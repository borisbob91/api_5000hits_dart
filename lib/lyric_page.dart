import 'package:flutter/material.dart';
import 'package:api_5000hits/api_5000hits.dart';
import 'package:flutter_tts/flutter_tts.dart';
import 'package:just_audio/just_audio.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';

// Lyrics List Page
class LyricsListPage extends StatefulWidget {
  @override
  _LyricsListPageState createState() => _LyricsListPageState();
}

class _LyricsListPageState extends State<LyricsListPage> {
  final MusicSdk _musicSdk = MusicSdk.instance;
  List<Mp3Lyric> _musicWithLyrics = [];
  bool _isLoading = false;
  int _currentPage = 0;
  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    _fetchMusicWithLyrics();
    _scrollController.addListener(_onScroll);
  }

  void _onScroll() {
    if (_scrollController.position.pixels == _scrollController.position.maxScrollExtent) {
      _fetchMusicWithLyrics();
    }
  }

  Future<void> _fetchMusicWithLyrics() async {
    if (_isLoading) return;
    setState(() {
      _isLoading = true;
    });
    try {
      final newMusic = await _musicSdk.lyricContrat?.getLyrics(page: _currentPage) ?? [];
      setState(() {
        _musicWithLyrics.addAll(newMusic);
        _currentPage++;
        _isLoading = false;
      });
    } catch (e) {
      print('Error fetching music with lyrics: $e');
      setState(() {
        _isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Lyrics')),
      body: ListView.builder(
        controller: _scrollController,
        itemCount: _musicWithLyrics.length + (_isLoading ? 1 : 0),
        itemBuilder: (context, index) {
          if (index == _musicWithLyrics.length) {
            return Center(child: CircularProgressIndicator());
          }
          final lyric = _musicWithLyrics[index];
          return ListTile(
            title: Text(lyric.title ?? 'Unknown Title'),
            subtitle: Text(lyric.artist ?? 'Unknown Artist'),
            onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => LyricsDetailPage(lyric: lyric),
                ),
              );
            },
          );
        },
      ),
    );
  }
}

// Lyrics Detail Page
class LyricsDetailPage extends StatefulWidget {
  final Mp3Lyric lyric;

  const LyricsDetailPage({Key? key, required this.lyric}) : super(key: key);

  @override
  _LyricsDetailPageState createState() => _LyricsDetailPageState();
}

class _LyricsDetailPageState extends State<LyricsDetailPage> {
  final FlutterTts flutterTts = FlutterTts();
  final AudioPlayer audioPlayer = AudioPlayer();
  final ItemScrollController itemScrollController = ItemScrollController();
  final ItemPositionsListener itemPositionsListener = ItemPositionsListener.create();
  bool isPlaying = false;
  List<String> lyricsLines = [];

  @override
  void initState() {
    super.initState();
    _initializeTts();
    _initializeAudio();
    _parseLyrics();
  }

  void _initializeTts() async {
    await flutterTts.setLanguage("fr-Fr");
    await flutterTts.setSpeechRate(0.5);
    flutterTts.setCompletionHandler(() {
      setState(() {
        isPlaying = false;
      });
    });
  }

  void _initializeAudio() async {
    final mp3Lyric = widget.lyric;
    await audioPlayer.setUrl('https://samplelib.com/lib/preview/mp3/sample-3s.mp3');
  }

  void _parseLyrics() {
    lyricsLines = widget.lyric.text?.split('\n') ?? ['No lyrics available'];
  }

  void _playPauseTts() {
    setState(() {
      isPlaying = !isPlaying;
    });
    if (isPlaying) {
      flutterTts.speak(widget.lyric.text ?? '');
    } else {
      flutterTts.stop();
    }
  }

  void _playPauseAudio() {
    if (audioPlayer.playing) {
      audioPlayer.pause();
    } else {
      audioPlayer.play();
    }
  }

  @override
  void dispose() {
    flutterTts.stop();
    audioPlayer.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.lyric.title ?? 'Unknown Title'),
      ),
      body: Column(
        children: [
          Expanded(
            child: ScrollablePositionedList.builder(
              itemCount: lyricsLines.length,
              itemBuilder: (context, index) => Padding(
                padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 16),
                child: Text(lyricsLines[index], style: TextStyle(fontSize: 18)),
              ),
              itemScrollController: itemScrollController,
              itemPositionsListener: itemPositionsListener,
            ),
          ),
          Container(
            padding: EdgeInsets.all(16),
            color: Colors.grey[200],
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                IconButton(
                  icon: Icon(isPlaying ? Icons.stop : Icons.play_arrow),
                  onPressed: _playPauseTts,
                ),
                IconButton(
                  icon: Icon(Icons.music_note),
                  onPressed: _playPauseAudio,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
