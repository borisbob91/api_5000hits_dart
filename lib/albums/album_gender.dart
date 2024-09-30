import 'package:api_5000hits_dart/provider.dart';
import 'package:flutter/material.dart';
import 'package:api_5000hits/api_5000hits.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'album_list.dart';

class AlbumListByGenrePage extends ConsumerStatefulWidget {
  @override
  _AlbumListPageState createState() => _AlbumListPageState();
}

class _AlbumListPageState extends ConsumerState<AlbumListByGenrePage> {
  final MusicSdk _musicSdk = MusicSdk.instance;
  List<Mp3Album> _albums = [];
  bool _isLoading = false;
  int _currentPage = 0;
  final ScrollController _scrollController = ScrollController();
  String _selectedGenre = 'ALL';

  @override
  void initState() {

    super.initState();
    _fetchAlbums();
    _scrollController.addListener(_onScroll);
  }

  @override
  void dispose() {

    _scrollController.removeListener(_onScroll);
    _scrollController.dispose();
    super.dispose();
  }

  void _onScroll() {
    if (_scrollController.position.pixels == _scrollController.position.maxScrollExtent) {
      if (!_isLoading && _currentPage != -1) {
        _fetchAlbums();
      }
    }
  }

  Future<List<Mp3Album>> _fetchAlbums() async {
    if (_isLoading) return [];
    setState(() {
      _isLoading = true;
    });
    try {
      List<Mp3Album> result;
      if (_selectedGenre == 'ALL') {

        result = await _musicSdk.albumContrat?.getAlbums(page: _currentPage) ?? [];
      } else {
        result = await _musicSdk.albumContrat?.getAlbumsByGenre(_selectedGenre, page: _currentPage) ?? [];
      }
      if (result.isEmpty) {
        _currentPage = -1;
        result=[];
      }
      setState(() {
        _albums.addAll(result);
        _currentPage++;
        _isLoading = false;
      });
      return result;
    } catch (e) {
      print('Error fetching albums: $e');
      setState(() {
        _isLoading = false;
      });
      return [];
    }
  }

  Future<void> _refreshAlbumList() async {
    setState(() {
      _albums = [];
      _currentPage = 0;
    });
    _musicSdk.albumContrat?.clearCache();
    await _fetchAlbums();
  }

  void _onGenreSelected(String genre) {
    setState(() {
      _selectedGenre = genre;
      _albums = [];
      _currentPage = 0;
    });
    _refreshAlbumList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Albums'),
        actions: [
          IconButton(
            icon: const Icon(Icons.search),
            onPressed: () {
              // Handle search action
            },
          ),
          IconButton(
            icon: const Icon(Icons.refresh),
            onPressed: _refreshAlbumList,
          ),
        ],
      ),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text('$_selectedGenre Albums, Page ${_currentPage + 1}', style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            ),
            CategorySelector(
              selectedGenre: _selectedGenre,
              onGenreSelected: _onGenreSelected,
            ),
            Expanded(
              child: RefreshIndicator(
                onRefresh: _refreshAlbumList,
                child: AlbumList(
                  albums: _albums,
                  scrollController: _scrollController,
                  isLoading: _isLoading,
                  hasMore: _currentPage != -1,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class CategorySelector extends StatelessWidget {
  final String selectedGenre;
  final Function(String) onGenreSelected;

  const CategorySelector({
    Key? key,
    required this.selectedGenre,
    required this.onGenreSelected,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: [
          CategoryButton(
            label: 'ALL',
            isSelected: selectedGenre == 'ALL',
            onPressed: () => onGenreSelected('ALL'),
          ),
          CategoryButton(
            label: 'Hip-Hop',
            isSelected: selectedGenre == 'Hip-Hop',
            onPressed: () => onGenreSelected('Hip-Hop'),
          ),
          CategoryButton(
            label: 'Pop',
            isSelected: selectedGenre == 'Pop',
            onPressed: () => onGenreSelected('Pop'),
          ),
          CategoryButton(
            label: 'Rock',
            isSelected: selectedGenre == 'Rock',
            onPressed: () => onGenreSelected('Rock'),
          ),
          CategoryButton(
            label: 'Zouglou',
            isSelected: selectedGenre == 'Zouglou',
            onPressed: () => onGenreSelected('Zouglou'),
          ),
           CategoryButton(
            label: 'Gospel',
            isSelected: selectedGenre == 'Gospel',
            onPressed: () => onGenreSelected('Gospel'),
          ),
          CategoryButton(
            label: 'Maimouna',
            isSelected: selectedGenre == 'Maimouna',
            onPressed: () => onGenreSelected('Maimouna'),
          ),
          // Ajoutez d'autres genres selon vos besoins
        ],
      ),
    );
  }
}

class CategoryButton extends StatelessWidget {
  final String label;
  final bool isSelected;
  final VoidCallback onPressed;

  const CategoryButton({
    Key? key,
    required this.label,
    this.isSelected = false,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          foregroundColor: isSelected ? Colors.white : Colors.black,
          backgroundColor: isSelected ? Colors.red : Colors.grey[300],
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
        ),
        child: Text(label),
      ),
    );
  }
}
