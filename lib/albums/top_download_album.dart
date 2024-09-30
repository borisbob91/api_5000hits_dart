import 'package:api_5000hits_dart/albums/album_detail.dart';
import 'package:flutter/material.dart';
import 'package:api_5000hits/api_5000hits.dart';

class TopDownloadAlbum extends StatefulWidget {
  @override
  _AlbumListPageState createState() => _AlbumListPageState();
}

class _AlbumListPageState extends State<TopDownloadAlbum> {
  final MusicSdk _musicSdk = MusicSdk.instance;
  List<Mp3Album> _albums = [];
  bool _isLoading = false;
  int _currentPage = 0;
  final ScrollController _scrollController = ScrollController();

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
      if (!_isLoading && _currentPage !=-1) {
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
      List<Mp3Album> result = await _musicSdk.albumContrat?.getTopDownloadAlbum(page: _currentPage) ?? [];
      if (result.isEmpty) {
        _currentPage = -1;
        return [];
      }
      setState(() {
        _albums.addAll(result);
        _currentPage = _currentPage + 1;
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

  Future<void> _fetchMoreAlbums() async {
    if (_isLoading) return;
    setState(() {
      _isLoading = true;
    });
    try {
      List<Mp3Album>? result = await _fetchAlbums();
      if (result == null || result.isEmpty) {
        _currentPage = -1;
        return;
      }
      setState(() {
        _albums.addAll(result);
        _currentPage = _currentPage++;
        _isLoading = false;
      });
    } catch (e) {
      print('Error fetching more albums: $e');
      setState(() {
        _isLoading = false;
      });
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Albums Top 100'),
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
              padding: EdgeInsets.all(16.0),
              child: Text('Trending, page ${_currentPage}', style: TextStyle()),
            ),
            CategorySelector(),
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

class AlbumList extends StatelessWidget {
  final List<Mp3Album> albums;
  final ScrollController scrollController;
  final bool isLoading;
  final bool hasMore;

  const AlbumList({
    Key? key,
    required this.albums,
    required this.scrollController,
    required this.isLoading,
    required this.hasMore,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      controller: scrollController,
      itemCount: albums.length + (isLoading || hasMore ? 1 : 0),
      itemBuilder: (context, index) {
        if (index < albums.length) {
          return AlbumListItem(album: albums[index], rank: index + 1);
        } else if (isLoading) {
          return Center(child: CircularProgressIndicator());
        } else {
          return SizedBox.shrink();
        }
      },
    );
  }
}

// Les autres classes (CategorySelector, CategoryButton, AlbumListItem) restent inchangées

class CategorySelector extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return const SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: [
          CategoryButton(label: 'ALL', isSelected: true),
          CategoryButton(label: 'Hip-Hop'),
          CategoryButton(label: 'Podcasts'),
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
          foregroundColor: isSelected ? Colors.white : Colors.black, backgroundColor: isSelected ? Colors.red : Colors.grey[300],
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
        ),
        child: Text(label),
      ),
    );
  }
}

class AlbumListOld extends StatelessWidget {
  final List<Mp3Album> albums;

  const AlbumListOld({Key? key, required this.albums}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: albums.length,
      itemBuilder: (context, index) {
        return AlbumListItem(album: albums[index], rank: index + 1);
      },
    );
  }
}

class AlbumListItem extends StatelessWidget {
  final Mp3Album album;
  final int rank;

  const AlbumListItem({Key? key, required this.album, required this.rank}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Container(
        width: 50,
        height: 50,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: NetworkImage('${album.cover.value?.max}'),
            fit: BoxFit.cover,
          ),
          borderRadius: BorderRadius.circular(8),
        ),
      ),
      title: Text(album.name),
      subtitle: Text("${album.artist} - ${album.genre}"),
      trailing: Text('${album.hits ?? 0} plays'),
      onTap: () {
        // Navigate to album details page
        Navigator.of(context).push(MaterialPageRoute(builder: (context) => AlbumDetailPage(album: album)));
      },
    );
  }
}