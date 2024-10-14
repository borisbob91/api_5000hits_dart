import 'package:flutter/material.dart';
import 'package:api_5000hits/api_5000hits.dart';

class VideoDetailPage extends StatefulWidget {
  final Mp3Video video;

  const VideoDetailPage({Key? key, required this.video}) : super(key: key);

  @override
  _VideoDetailPageState createState() => _VideoDetailPageState();
}

class _VideoDetailPageState extends State<VideoDetailPage> {
  final MusicSdk _musicSdk = MusicSdk.instance;
  List<Mp3Video> _artistVideos = [];
  List<Mp3Video> _suggestedVideos = [];
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();

    _fetchRelatedVideos();
  }

  Future<void> _fetchRelatedVideos() async {
    setState(() {
      _isLoading = true;
    });
    try {
      final artistVideos = await _musicSdk.videoContrat?.getVideosByArtist(widget.video.artist!) ?? [];
      final suggestedVideos = await _musicSdk.videoContrat?.fetchVideos(genre: widget.video.genre) ?? [];
      setState(() {
        _artistVideos = artistVideos;
        _suggestedVideos = suggestedVideos;
        _isLoading = false;
      });
    } catch (e) {
      print('Error fetching related videos: $e');
      setState(() {
        _isLoading = false;
      });
    }
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('${widget.video.title}'),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('${widget.video.title}', style: Theme.of(context).textTheme.bodyMedium),
                  SizedBox(height: 8),
                  Text('${widget.video.artist}', style: Theme.of(context).textTheme.bodyMedium),
                  SizedBox(height: 16),
                  Text('genre:', style: Theme.of(context).textTheme.bodyMedium),
                  Text('${widget.video.genre}' ?? 'No description available'),
                ],
              ),
            ),
            if (_isLoading)
              Center(child: CircularProgressIndicator())
            else
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _buildVideoList('More from ${widget.video.artist}', _artistVideos),
                  _buildVideoList('Suggested Videos', _suggestedVideos),
                ],
              ),
          ],
        ),
      ),
    );
  }

  Widget _buildVideoList(String title, List<Mp3Video> videos) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: Text(title, style: Theme.of(context).textTheme.bodyMedium),
        ),
        SizedBox(
          height: 200,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: videos.length,
            itemBuilder: (context, index) {
              return VideoThumbnail(
                video: videos[index],
                onTap: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => VideoDetailPage(video: videos[index]),
                    ),
                  );
                },
              );
            },
          ),
        ),
      ],
    );
  }
}

class VideoThumbnail extends StatelessWidget {
  final Mp3Video video;
  final VoidCallback onTap;

  const VideoThumbnail({Key? key, required this.video, required this.onTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 160,
        margin: EdgeInsets.symmetric(horizontal: 8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            AspectRatio(
              aspectRatio: 16 / 9,
              child: Image.network(
                video.cover!,
                fit: BoxFit.cover,
              ),
            ),
            SizedBox(height: 8),
            Text(
             '${ video.title}',
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              style: Theme.of(context).textTheme.titleMedium,
            ),
            Text(
             '${ video.artist}',
              style: Theme.of(context).textTheme.bodySmall,
            ),
          ],
        ),
      ),
    );
  }
}