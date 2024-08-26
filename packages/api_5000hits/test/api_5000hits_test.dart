import 'package:flutter_test/flutter_test.dart';
import 'dart:ui';
import 'package:api_5000hits/api_5000hits.dart';

// void main() {
//   test('adds one to input values', () {

//   });
// }

void main() async {
  // Initialize the SDK
  final sdk = MusicSdk().init(key: 'your_api_key_here');

  // Test Album functionality
  print('Testing Album functionality:');
  await testAlbumFunctionality(sdk);

  // Test Music functionality
 //  print('\nTesting Music functionality:');
  //await testMusicFunctionality(sdk);
}
Future<void> testAlbumFunctionality(MusicSdk sdk) async {
  try {
    // Fetch albums
    final albums = await sdk.album?.fetchAlbumsList();
    print('Fetched ${albums?.length} albums');
    if (albums != null && albums.isNotEmpty) {
      print('First album: ${albums.first}');

      // Fetch album by slug
      final albumSlug = albums.first.slug;
      if (albumSlug != null) {
        final album = await sdk.album?.fetchAlbumBySlug(albumSlug);
        print('Fetched album by slug: ${album?.name}');
      }

      // Fetch next albums
      final nextAlbums = await sdk.album?.fetchNextAlbum();
      print('Fetched ${nextAlbums?.length} next albums');
    }
  } catch (e) {
    print('Error in album functionality: $e');
  }
}