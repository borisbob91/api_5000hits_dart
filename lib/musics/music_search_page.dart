import 'package:flutter/material.dart';
import 'package:api_5000hits/api_5000hits.dart';

import 'music_populars.dart';

class MusicSearchPage extends StatefulWidget {
  const MusicSearchPage({super.key});

  @override
  _MusicSearchPageState createState() => _MusicSearchPageState();
}

class _MusicSearchPageState extends State<MusicSearchPage> {
  final MusicSdk _musicSdk = MusicSdk.instance;
  final TextEditingController _searchController = TextEditingController();
  List<Mp3Music> _searchResults = [];
  bool _isLoading = false;
  int _batchlimit = 20;
  int _batchCurrentPage = 0;

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  Future<void> _performSearch() async {
    setState(() {
      _isLoading = true;
    });

    try {
      final results =
          await _musicSdk.musicContrat?.searchMusic(_searchController.text, limit:_batchlimit, offset: _batchlimit*_batchCurrentPage ) ??
              [];
      setState(() {
        _searchResults = results;

        _isLoading = false;
      });
    } catch (e) {
      print('Error searching music: $e');
      setState(() {
        _isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Music Search'),
        elevation: 0,
      ),
      body: Column(
        children: [
          Container(
            padding: EdgeInsets.all(16),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _searchController,
                    decoration: InputDecoration(
                      hintText: 'Search music...',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30),
                        borderSide: BorderSide.none,
                      ),
                      filled: true,
                      fillColor: Colors.grey[200],
                      suffixIcon: Icon(Icons.search),
                      contentPadding:
                      EdgeInsets.symmetric(horizontal: 20, vertical: 16),
                    ),
                    onSubmitted: (_) => _performSearch(),
                  ),
                ),
                const SizedBox(width: 16),
                ElevatedButton(
                  onPressed: _performSearch,
                  child: Icon(Icons.search),
                  style: ElevatedButton.styleFrom(
                    shape: const CircleBorder(),
                    backgroundColor: Theme.of(context).primaryColor,
                    padding: const EdgeInsets.all(16),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: _isLoading
                ? const Center(child: CircularProgressIndicator())
                : ListView.builder(
              itemCount: _searchResults.length,
              itemBuilder: (context, index) {
                return MusicListItem(
                  music: _searchResults[index],
                  rank: index + 1,
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
