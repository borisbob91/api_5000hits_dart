import 'package:flutter/material.dart';
import 'package:api_5000hits/api_5000hits.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'music_list_item.dart';

class MusicListByGenrePage extends ConsumerStatefulWidget {
  @override
  _MusicListPageState createState() => _MusicListPageState();
}

class _MusicListPageState extends ConsumerState<MusicListByGenrePage> {
  final MusicSdk _musicSdk = MusicSdk.instance;
  List<Mp3Music> _music = [];
  bool _isLoading = false;
  int _currentPage = 0;
  int _bastchLimit = 20;
  final ScrollController _scrollController = ScrollController();
  String _selectedGenre = 'ALL';

  @override
  void initState() {
    super.initState();
    _fetchMusic();
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
      setState(() {
        _isLoading = true;
      });
      Future.delayed(const Duration(seconds: 3)).then((onValue){

        if (!_isLoading && _currentPage != -1) {
          _fetchMusic();
        }
        setState(() {
          _isLoading = false;
        });
      });

    }
  }

  Future<List<Mp3Music>> _fetchMusic() async {
    if (_isLoading) return [];
    setState(() {
      _isLoading = true;
    });
    try {
      List<Mp3Music> result;
      if (_selectedGenre == 'ALL') {
        result = await _musicSdk.musicContrat?.getMusics(offset: _currentPage) ?? [];
      } else {
        result = await _musicSdk.musicContrat?.getMusicByGenre(_selectedGenre, offset:_currentPage * _bastchLimit , limit: _bastchLimit) ?? [];
      }

      if (result.isEmpty) {
        _currentPage = -1;
        result = [];
      }
      setState(() {
        _music.addAll(result);
        _currentPage++;
        _isLoading = false;
      });
      return result;
    } catch (e) {
      print('Error fetching music: $e');
      setState(() {
        _isLoading = false;
      });
      return [];
    }
  }

  Future<void> _refreshMusicList() async {
    setState(() {
      _music = [];
      _currentPage = 0;
    });
    _musicSdk.musicContrat?.clearCache();
    await _fetchMusic();
  }

  void _onGenreSelected(String genre) {
    setState(() {
      _selectedGenre = genre;
      _music = [];
      _currentPage = 0;
    });
    _refreshMusicList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Music'),
        actions: [
          IconButton(
            icon: const Icon(Icons.search),
            onPressed: () {
              // Handle search action
            },
          ),
          IconButton(
            icon: const Icon(Icons.refresh),
            onPressed: _refreshMusicList,
          ),
        ],
      ),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text('$_selectedGenre Music, Page ${_currentPage + 1}', style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            ),
            CategorySelector(
              selectedGenre: _selectedGenre,
              onGenreSelected: _onGenreSelected,
            ),
            Expanded(
              child: RefreshIndicator(
                onRefresh: _refreshMusicList,
                child: MusicList(
                  music: _music,
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