import 'dart:convert';

import 'package:api_5000hits/src/core/databases/database_interface.dart';
import 'package:api_5000hits/src/features/album/mp3_album.dart';
import 'package:api_5000hits/src/utils/api_client.dart';
import 'package:dio/dio.dart';


part 'mp3_album_base_repository.dart';
part 'mp3_album_local_repository.dart';
part 'mp3_album_remote_repositorry.dart';


class Mp3AlbumRepository implements Mp3AlbumRepositoryInterface {
  final Mp3AlbumLocalRepository localRepository;
  final Mp3AlbumRemoteRepositorry remoteRepository;

  Mp3AlbumRepository({required this.localRepository, required this.remoteRepository});

  @override
  Future<List<Mp3Album>> fetchAlbums() async {
    try {
      // Vérifier d'abord dans le cache local
      final cachedAlbums = await localRepository.getAllAlbums();
      if (cachedAlbums.isNotEmpty) {
        return cachedAlbums;
      }

      // Si le cache est vide, récupérer depuis l'API
      final albums = await remoteRepository.fetchAlbums();

      // Mettre en cache les albums récupérés
      for (var album in albums) {
        await localRepository.saveAlbum(album);
      }

      return albums;
    } catch (error) {
      throw Exception('Failed to fetch albums: $error');
    }
  }

  @override
  Future<Mp3Album> getAlbumBySlug(String slug) async {
    try {
      // Vérifier d'abord dans le cache local
      final cachedAlbum = await localRepository.getAlbumBySlug(slug);
      if (cachedAlbum != null) {
        return cachedAlbum;
      }

      // Si non trouvé dans le cache, récupérer depuis l'API
      final album = await remoteRepository.getAlbumBySlug(slug);

      // Mettre en cache l'album récupéré
      await localRepository.saveAlbum(album);

      return album;
    } catch (error) {
      throw Exception('Failed to fetch album by slug: $error');
    }
  }

  Future<void> clearCache() async {
    await localRepository.clearAllAlbums();
  }
  
  @override
  bool canFetchNext() {
    // TODO: implement canFetchNext
    throw UnimplementedError();
  }
  
  @override
  Future<List<Mp3Album>> fetchNextAlbums() {
    // TODO: implement fetchNextAlbums
    throw UnimplementedError();
  }

  // Vous pouvez ajouter d'autres méthodes ici selon vos besoins
}