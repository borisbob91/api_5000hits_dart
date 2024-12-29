import 'package:flutter/material.dart';
import 'package:api_5000hits/api_5000hits.dart';

import 'music_detail_page.dart';

class PopularMusic extends StatefulWidget {
  @override
  _MusicListPageState createState() => _MusicListPageState();
}

class _MusicListPageState extends State<PopularMusic> {
  final MusicSdk _musicSdk = MusicSdk.instance;
  List<Mp3Music> _music = [];
  bool _isLoading = false;
  int _currentPage = 0;
  final ScrollController _scrollController = ScrollController();

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
      if (!_isLoading && _currentPage != -1) {
        _fetchMusic();
      }
    }
  }

  Future<List<Mp3Music>> _fetchMusic() async {
    if (_isLoading) return [];
    setState(() {
      _isLoading = true;
    });
    try {
      List<Mp3Music> result = await _musicSdk.musicContrat?.getPopularMusic(page: _currentPage) ?? [];
      if (result.isEmpty) {
        _currentPage = -1;
        return [];
      }
      setState(() {
        _music.addAll(result);
        _currentPage = _currentPage + 1;
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Musique Populaire'),
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
              padding: EdgeInsets.all(16.0),
              child: Text('Trending, page ${_currentPage}', style: TextStyle()),
            ),
            CategorySelector(),
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

class MusicList extends StatelessWidget {
  final List<Mp3Music> music;
  final ScrollController scrollController;
  final bool isLoading;
  final bool hasMore;

  const MusicList({
    Key? key,
    required this.music,
    required this.scrollController,
    required this.isLoading,
    required this.hasMore,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      physics: const BouncingScrollPhysics(),
      shrinkWrap: true,
      controller: scrollController,
      itemCount: music.length + (isLoading || hasMore ? 1 : 0),
      itemBuilder: (context, index) {
        if (index < music.length) {
          return MusicListItem(music: music[index], rank: index + 1);
        } else if (isLoading) {
          return Center(child: CircularProgressIndicator());
        } else {
          return SizedBox.shrink();
        }
      },
    );
  }
}

class CategorySelector extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return const SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: [
          CategoryButton(label: 'ALL', isSelected: true),
          CategoryButton(label: 'Hip-Hop'),
          CategoryButton(label: 'Pop'),
          CategoryButton(label: 'Rock'),
          CategoryButton(label: 'Jazz'),
        ],
      ),
    );
  }
}

class CategoryButton extends StatelessWidget {
  final String label;
  final bool isSelected;

  const CategoryButton({Key? key, required this.label, this.isSelected = false}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: ElevatedButton(
        onPressed: () {},
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

class MusicListItem extends StatelessWidget {
  final Mp3Music music;
  final int rank;

  const MusicListItem({Key? key, required this.music, required this.rank}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Container(
        width: 50,
        height: 50,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: NetworkImage(music.cover.value?.min ?? 'https://example.com/placeholder.jpg'),
            fit: BoxFit.cover,
          ),
          borderRadius: BorderRadius.circular(8),
        ),
      ),
      title: Text(music.title ?? 'Unknown Title'),
      subtitle: Text("${music.artist ?? 'Unknown Artist'} - ${music.genre ?? 'Unknown Genre'}"),
      trailing: Text('${music.hits ?? 0} plays'),
      onTap: () {
        // Navigate to music details page
        Navigator.of(context).push(MaterialPageRoute(builder: (context) => MusicDetailPage(music: music)));
      },
    );
  }
}