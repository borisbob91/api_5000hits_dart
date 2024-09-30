import 'package:flutter/material.dart';

class ErrorPage extends StatelessWidget {
  const ErrorPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text('ERROR'),
        ),
        body: const Center(
          child: Card(
            child: Padding(
              padding: EdgeInsets.all(8.0),
              child: Text('Error developper api ket need'),
            ),
          ),
        ),
      ),
    );
  }
}
