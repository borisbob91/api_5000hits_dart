import 'package:flutter/material.dart';
import 'package:api_5000hits/api_5000hits.dart';

class AuthTestPage extends StatefulWidget {
  @override
  _AuthTestPageState createState() => _AuthTestPageState();
}

class _AuthTestPageState extends State<AuthTestPage> {
  final MusicSdk _musicSdk = MusicSdk.instance;
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  bool _isLoading = false;
  String? _errorMessage;
  String? _successMessage;
  bool _isLoggedIn = false;
  String? _currentUserEmail;

  @override
  void initState() {
    super.initState();
    _checkCurrentUser();
  }

  Future<void> _checkCurrentUser() async {
    final user = await _musicSdk.auth?.getCurrentAuthState();
    setState(() {
      _isLoggedIn = user?.isAuthenticated ?? false;
      _currentUserEmail = user?.userProfile?.email;
    });
  }


  Future<void> _signIn() async {
    if (_formKey.currentState!.validate()) {
      setState(() {
        _isLoading = true;
        _errorMessage = null;
        _successMessage = null;
      });

      try {
        await _musicSdk.auth?.signIn(
          email: _emailController.text,
          password: _passwordController.text,
        );
        await _checkCurrentUser();
        setState(() {
          _successMessage = 'Sign in successful.';
        });
      } catch (e) {
        setState(() {
          _errorMessage = 'Sign in failed: ${e.toString()}';
        });
      } finally {
        setState(() {
          _isLoading = false;
        });
      }
    }
  }

  Future<void> _signOut() async {
    setState(() {
      _isLoading = true;
      _errorMessage = null;
      _successMessage = null;
    });

    try {
      await _musicSdk.auth?.signOut();
      await _checkCurrentUser();
      setState(() {
        _successMessage = 'Sign out successful.';
      });
    } catch (e) {
      setState(() {
        _errorMessage = 'Sign out failed: ${e.toString()}';
      });
    } finally {
      setState(() {
        _isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Auth Test'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              if (_isLoggedIn)
                Text('Currently logged in as: $_currentUserEmail',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
              TextFormField(
                controller: _emailController,
                decoration: InputDecoration(labelText: 'Email'),
                keyboardType: TextInputType.emailAddress,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your email';
                  }
                  return null;
                },
              ),
              SizedBox(height: 16),
              TextFormField(
                controller: _passwordController,
                decoration: InputDecoration(labelText: 'Password'),
                obscureText: true,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your password';
                  }
                  return null;
                },
              ),
              SizedBox(height: 24),
              if (!_isLoggedIn) ...[
                ElevatedButton(
                  onPressed: (){
                  },
                  child: Text('Sign Up'),
                ),
                SizedBox(height: 16),
                ElevatedButton(
                  onPressed: _isLoading ? null : _signIn,
                  child: Text('Sign In'),
                ),
              ],
              if (_isLoggedIn)
                ElevatedButton(
                  onPressed: _isLoading ? null : _signOut,
                  child: Text('Sign Out'),
                ),
              SizedBox(height: 16),
              if (_isLoading)
                Center(child: CircularProgressIndicator()),
              if (_errorMessage != null)
                Text(_errorMessage!,
                    style: TextStyle(color: Colors.red, fontSize: 16)),
              if (_successMessage != null)
                Text(_successMessage!,
                    style: TextStyle(color: Colors.green, fontSize: 16)),
            ],
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }
}