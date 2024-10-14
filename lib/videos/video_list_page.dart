import 'package:api_5000hits/api_5000hits.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'vidoe_detail.dart';

class VideoListScreen extends ConsumerStatefulWidget {
  @override
  _VideoListScreenState createState() => _VideoListScreenState();
}

class _VideoListScreenState extends ConsumerState<VideoListScreen> {
  final ScrollController _scrollController = ScrollController();
  bool _isLoading = false;

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_onScroll);
    // Charger les premières vidéos
    WidgetsBinding.instance.addPostFrameCallback((_) {
      ref.read(videosProvider.notifier).loadVideos();
    });
  }

  void _onScroll() {
    if (_scrollController.position.pixels == _scrollController.position.maxScrollExtent) {
      _loadMore();
    }
  }

  Future<void> _loadMore() async {
    if (!_isLoading) {
      setState(() {
        _isLoading = true;
      });

      await ref.read(videosProvider.notifier).loadMoreVideos();

      setState(() {
        _isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final videos = ref.watch(videosProvider);

    return Scaffold(
      appBar: AppBar(
        title: Text('Videos'),
      ),
      body: ListView.builder(
        controller: _scrollController,
        itemCount: videos.length + 1, // +1 pour l'indicateur de chargement
        itemBuilder: (context, index) {
          if (index == videos.length) {
            return _buildLoader();
          }
          return _buildVideoItem(videos[index]);
        },
      ),
    );
  }

  Widget _buildVideoItem(Mp3Video video) {
    return InkWell(
      onTap: () {
        Navigator.of(context).push(MaterialPageRoute(builder: (context) {
          return VideoDetailPage(video: video);
        }));
      },
      child: Card(
        margin: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              alignment: Alignment.bottomRight,
              children: [
                Image.network(
                  video.cover ?? '',
                  width: double.infinity,
                  height: 180,
                  fit: BoxFit.cover,
                ),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                  margin: EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    color: Colors.black.withOpacity(0.7),
                    borderRadius: BorderRadius.circular(4),
                  ),
                  child: Text(
                     '4555',
                    style: TextStyle(color: Colors.white, fontSize: 12),
                  ),
                ),
              ],
            ),
            Padding(
              padding: EdgeInsets.all(12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    video.title ?? 'No Title',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                  SizedBox(height: 4),
                  Text(
                    video.artist ?? 'Unknown Artist',
                    style: TextStyle(fontSize: 14, color: Colors.grey[600]),
                  ),
                  SizedBox(height: 4),
                  Text(
                    '${video.views ?? 0} views',
                    style: const TextStyle(fontSize: 12, color: Colors.grey),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildLoader() {
    return Container(
      padding: EdgeInsets.all(16),
      alignment: Alignment.center,
      child: _isLoading
          ? CircularProgressIndicator()
          : SizedBox(),
    );
  }

  @override
  void dispose() {
    _scrollController.removeListener(_onScroll);
    _scrollController.dispose();
    super.dispose();
  }
}

final videosProvider = StateNotifierProvider<VideosNotifier, List<Mp3Video>>((ref) => VideosNotifier());

class VideosNotifier extends StateNotifier<List<Mp3Video>> {
  VideosNotifier() : super([]);
  final MusicSdk _musicSdk = MusicSdk.instance;
  int _currentPage = 0;
  bool _hasMore = true;

  Future<void> loadVideos() async {
    if (state.isEmpty) {
      await loadMoreVideos();
    }
  }

  Future<void> loadMoreVideos() async {
    if (!_hasMore) return;

    try {
      final newVideos = await _musicSdk.videoContrat?.fetchVideos(page: _currentPage) ?? [];
      if (newVideos.isEmpty) {
        _hasMore = false;
      } else {
        state = [...state, ...newVideos];
        _currentPage++;
      }
    } catch (e) {
      print('Error loading videos: $e');
      // Vous pouvez gérer l'erreur ici, par exemple en affichant un message à l'utilisateur
    }
  }
}