
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';


class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context,) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          const SliverAppBar(
            floating: true,
            title: Text('5000hits', style: TextStyle(color: Colors.white)),
            backgroundColor: Colors.black,
            actions: [
              CircleAvatar(
                backgroundImage: AssetImage('assets/profile_pic.jpg'),
                radius: 15,
              ),
              SizedBox(width: 10),
            ],
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: SearchBar(),
            ),
          ),
          SliverToBoxAdapter(
            child: PopularPlaylists(),
          ),
          SliverToBoxAdapter(
            child: RecentlyPlayed(),
          ),
          SliverToBoxAdapter(
            child: VideoClips(),
          ),
          SliverToBoxAdapter(
            child: NewReleases(),
          ),
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (context, index) => SongListItem(songs[index]),
              childCount: songs.length,
            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: Colors.red,
        unselectedItemColor: Colors.grey,
        currentIndex: 0,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.search), label: 'Search'),
          BottomNavigationBarItem(icon: Icon(Icons.favorite), label: 'Favorites'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
        ],
      ),
    );
  }
}

class SearchBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      decoration: BoxDecoration(
        color: Colors.grey[200],
        borderRadius: BorderRadius.circular(20),
      ),
      child: const TextField(
        decoration: InputDecoration(
          hintText: 'Artists, songs, podcast',
          border: InputBorder.none,
          icon: Icon(Icons.search),
        ),
      ),
    );
  }
}

class PopularPlaylists extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Padding(
          padding: EdgeInsets.all(16.0),
          child: Text('Popular Playlist', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
        ),
        SizedBox(
          height: 180,
          child: ListView(
            scrollDirection: Axis.horizontal,
            children: [
              PlaylistItem('Shades of love', 'assets/shades_of_love.jpg'),
              PlaylistItem('The Escape', 'assets/the_escape.jpg'),
              PlaylistItem('Stardust', 'assets/stardust.jpg'),
            ],
          ),
        ),
      ],
    );
  }
}

class PlaylistItem extends StatelessWidget {
  final String title;
  final String imageUrl;

  PlaylistItem(this.title, this.imageUrl);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 140,
      margin: const EdgeInsets.only(left: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: Image.asset(imageUrl, height: 140, width: 140, fit: BoxFit.cover),
          ),
          const SizedBox(height: 8),
          Text(title, style: const TextStyle(fontWeight: FontWeight.bold)),
        ],
      ),
    );
  }
}

class RecentlyPlayed extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Padding(
          padding: EdgeInsets.all(16.0),
          child: Text('Recently played', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
        ),
        SizedBox(
          height: 120,
          child: ListView(
            scrollDirection: Axis.horizontal,
            children: [
              RecentItem('Ballroom Blitz', 'assets/ballroom_blitz.jpg'),
              RecentItem('Dreamer', 'assets/dreamer.jpg'),
              RecentItem('Give a Little', 'assets/give_a_little.jpg'),
              RecentItem('Come Dance', 'assets/come_dance.jpg'),
            ],
          ),
        ),
      ],
    );
  }
}

class RecentItem extends StatelessWidget {
  final String title;
  final String imageUrl;

  RecentItem(this.title, this.imageUrl);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100,
      margin: const EdgeInsets.only(left: 16),
      child: Column(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(50),
            child: Image.asset(imageUrl, height: 80, width: 80, fit: BoxFit.cover),
          ),
          const SizedBox(height: 8),
          Text(title, style: const TextStyle(fontSize: 12), maxLines: 2, textAlign: TextAlign.center),
        ],
      ),
    );
  }
}

class VideoClips extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Padding(
          padding: EdgeInsets.all(16.0),
          child: Text('Clips vidéos', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
        ),
        VideoClipItem('DJ Mohazic - 105 Kpere Promo Mixtape', 'assets/105_kpere.jpg'),
        VideoClipItem('Yankyrus - Maman (Official Video)', 'assets/yankyrus.jpg'),
        VideoClipItem('Malkoos - Complicado (Clip Officiel)', 'assets/malkoos.jpg'),
      ],
    );
  }
}

class VideoClipItem extends StatelessWidget {
  final String title;
  final String thumbnailUrl;

  VideoClipItem(this.title, this.thumbnailUrl);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16, left: 16, right: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            alignment: Alignment.center,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: Image.asset(thumbnailUrl, height: 200, width: double.infinity, fit: BoxFit.cover),
              ),
              const Icon(Icons.play_circle_fill, color: Colors.white, size: 50),
            ],
          ),
          const SizedBox(height: 8),
          Text(title, style: const TextStyle(fontWeight: FontWeight.bold)),
        ],
      ),
    );
  }
}

class NewReleases extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Padding(
          padding: EdgeInsets.all(16.0),
          child: Text('New Releases', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
        ),
        Wrap(
          spacing: 16,
          runSpacing: 16,
          children: [
            NewReleaseItem('Five Leaf Clover (EP)', 'Joyelle', 'assets/five_leaf_clover.jpg'),
            NewReleaseItem('Fletcher', 'Fiorious Freddy', 'assets/fletcher.jpg'),
            NewReleaseItem('Naissance', 'Manu', 'assets/naissance.jpg'),
            NewReleaseItem('Kyffy', 'Paramore', 'assets/kyffy.jpg'),
            NewReleaseItem('12 Summers', 'Big', 'assets/12_summers.jpg'),
            NewReleaseItem('Homeless', 'Liona', 'assets/homeless.jpg'),
          ],
        ),
      ],
    );
  }
}

class NewReleaseItem extends StatelessWidget {
  final String title;
  final String artist;
  final String imageUrl;

  NewReleaseItem(this.title, this.artist, this.imageUrl);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: (MediaQuery.of(context).size.width - 48) / 2,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: Image.asset(imageUrl, height: 160, width: double.infinity, fit: BoxFit.cover),
          ),
          const SizedBox(height: 8),
          Text(title, style: const TextStyle(fontWeight: FontWeight.bold)),
          Text(artist, style: const TextStyle(color: Colors.grey)),
        ],
      ),
    );
  }
}

class SongListItem extends StatelessWidget {
  final Map<String, String> song;

  SongListItem(this.song);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: ClipRRect(
        borderRadius: BorderRadius.circular(4),
        child: Image.asset(song['imageUrl']!, width: 50, height: 50, fit: BoxFit.cover),
      ),
      title: Text(song['title']!),
      subtitle: Text(song['artist']!),
      trailing: Text(song['duration']!),
    );
  }
}

// Sample data
final List<Map<String, String>> songs = [
  {'title': 'Ça Sort (feat. Doogi Papillon)', 'artist': 'Ste Miliano', 'duration': '3:45', 'imageUrl': 'assets/ca_sort.jpg'},
  {'title': 'Ifa (feat. Fally Ipupa)', 'artist': 'Oxlade', 'duration': '3:18', 'imageUrl': 'assets/ifa.jpg'},
  {'title': 'Isokolors', 'artist': 'Fireboy DML', 'duration': '2:57', 'imageUrl': 'assets/isokolors.jpg'},
  {'title': 'Merci', 'artist': 'Krys M', 'duration': '3:34', 'imageUrl': 'assets/merci.jpg'},
  {'title': 'Ukhonona', 'artist': 'Diamond Platnumz', 'duration': '3:00', 'imageUrl': 'assets/ukhonona.jpg'},
  {'title': 'Pain (feat. Shatta Wale)', 'artist': 'Ypee', 'duration': '4:12', 'imageUrl': 'assets/pain.jpg'},
  {'title': 'Reconnaissance', 'artist': "Jadax's", 'duration': '3:22', 'imageUrl': 'assets/reconnaissance.jpg'},
];


