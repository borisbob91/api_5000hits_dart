
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

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
      ref.read(videosProvider.notifier).loadMoreVideos();
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

  Widget _buildVideoItem(Video video) {
    return Card(
      margin: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            alignment: Alignment.bottomRight,
            children: [
              Image.network(
                video.thumbnailUrl,
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
                  video.duration,
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
                  video.title,
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
                SizedBox(height: 4),
                Text(
                  video.artist,
                  style: TextStyle(fontSize: 14, color: Colors.grey[600]),
                ),
                SizedBox(height: 4),
                Text(
                  video.views,
                  style: const TextStyle(fontSize: 12, color: Colors.grey),
                ),
              ],
            ),
          ),
        ],
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


class Video {
  final String title;
  final String artist;
  final String thumbnailUrl;
  final String duration;
  final String views;

  Video({
    required this.title,
    required this.artist,
    required this.thumbnailUrl,
    required this.duration,
    required this.views,
  });
}

final videosProvider = StateNotifierProvider<VideosNotifier, List<Video>>((ref) => VideosNotifier());

class VideosNotifier extends StateNotifier<List<Video>> {
  VideosNotifier() : super([]);

  Future<void> loadMoreVideos() async {
    // Simuler un délai de chargement
    await Future.delayed(Duration(seconds: 1));

    // Simuler le chargement de nouvelles vidéos
    final newVideos = List.generate(
      10,
          (index) => Video(
        title: 'Video ${state.length + index + 1}',
        artist: 'Artist ${state.length + index + 1}',
        thumbnailUrl: 'https://picsum.photos/320/180?random=${state.length + index}',
        duration: '${3 + (index % 3)}:${30 + (index * 7) % 30}',
        views: '${(state.length + index) * 1000 + 500} views',
      ),
    );

    state = [...state, ...newVideos];
  }
}
