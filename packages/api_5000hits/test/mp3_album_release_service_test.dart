// import 'package:api_5000hits/api_5000hits.dart';
// import 'package:api_5000hits/src/features/releases/mp3_album_release_local_repo.dart';
// import 'package:api_5000hits/src/features/releases/mp3_album_release_remote_repo.dart';
// import 'package:api_5000hits/src/features/releases/mp3_release_service.dart';
// import 'package:api_5000hits/src/utils/cache_timestamp.dart';
// import 'package:flutter_test/flutter_test.dart';
// import 'package:mockito/mockito.dart';
// import 'package:mockito/annotations.dart';
//
// @GenerateNiceMocks([
//   MockSpec<Mp3AlbumReleaseLocalRepository>(),
//   MockSpec<Mp3AlbumReleaseRemoteRepository>(),
//   MockSpec<CacheService>(),
// ])
// import 'mp3_album_release_service_test.mocks.dart';
//
// void main() {
//   group('Mp3AlbumReleaseService Tests', () {
//     late MockMp3AlbumReleaseLocalRepository mockLocalRepo;
//     late MockMp3AlbumReleaseRemoteRepository mockRemoteRepo;
//     late MockCacheService mockCacheService;
//     late Mp3AlbumReleaseServiceImpl service;
//
//     setUp(() {
//       mockLocalRepo = MockMp3AlbumReleaseLocalRepository();
//       mockRemoteRepo = MockMp3AlbumReleaseRemoteRepository();
//       mockCacheService = MockCacheService();
//       service = Mp3AlbumReleaseServiceImpl(mockLocalRepo, mockRemoteRepo);
//     });
//
//     group('getAlbumReleases', () {
//       test('returns cached data when cache is valid', () async {
//         final cachedReleases = [
//           Mp3AlbumRelease(ar: 1, artist: 'Cached Release 1'),
//           Mp3AlbumRelease(id: 2, artist: 'Cached Release 2'),
//         ];
//
//         when(mockCacheService.shouldUseCache())
//             .thenAnswer((_) async => true);
//         when(mockLocalRepo.getAll(page: 0, pageSize: 20))
//             .thenAnswer((_) async => cachedReleases);
//
//         final result = await service.getAlbumReleases();
//
//         expect(result, equals(cachedReleases));
//         verify(mockLocalRepo.getAll(page: 0, pageSize: 20)).called(1);
//         verifyNever(mockRemoteRepo.fetchAlbumReleases());
//       });
//
//       test('fetches from remote when cache is invalid', () async {
//         final remoteReleases = [
//           Mp3AlbumRelease(id: 1, artist: 'Remote Release 1'),
//           Mp3AlbumRelease(id: 2, artist: 'Remote Release 2'),
//         ];
//
//         when(mockCacheService.shouldUseCache())
//             .thenAnswer((_) async => false);
//         when(mockRemoteRepo.fetchAlbumReleases(
//           offset: 0,
//           limit: 20,
//           search: null,
//         )).thenAnswer((_) async => remoteReleases);
//
//         final result = await service.getAlbumReleases();
//
//         expect(result, equals(remoteReleases));
//         verify(mockRemoteRepo.fetchAlbumReleases(
//           offset: 0,
//           limit: 20,
//           search: null,
//         )).called(1);
//         verify(mockLocalRepo.saves(remoteReleases)).called(1);
//       });
//
//       test('falls back to cache when remote fails', () async {
//         final cachedReleases = [
//           Mp3AlbumRelease(id: 1, artist: 'Cached Release 1'),
//         ];
//
//         when(mockCacheService.shouldUseCache())
//             .thenAnswer((_) async => false);
//         when(mockRemoteRepo.fetchAlbumReleases(
//           offset: 0,
//           limit: 20,
//           search: null,
//         )).thenThrow(Exception('Network error'));
//         when(mockLocalRepo.getAll(page: 0, pageSize: 20))
//             .thenAnswer((_) async => cachedReleases);
//
//         final result = await service.getAlbumReleases();
//
//         expect(result, equals(cachedReleases));
//         verify(mockLocalRepo.getAll(page: 0, pageSize: 20)).called(1);
//       });
//
//       test('handles search with pagination', () async {
//         final searchResults = [
//           Mp3AlbumRelease(id: 1, artist: 'Search Result 1'),
//         ];
//
//         when(mockCacheService.shouldUseCache())
//             .thenAnswer((_) async => true);
//         when(mockLocalRepo.search('test', page: 1, pageSize: 10))
//             .thenAnswer((_) async => searchResults);
//
//         final result = await service.getAlbumReleases(
//           search: 'test',
//           page: 1,
//           pageSize: 10,
//         );
//
//         expect(result, equals(searchResults));
//         verify(mockLocalRepo.search('test', page: 1, pageSize: 10)).called(1);
//       });
//     });
//
//     group('getAlbumReleaseDetails', () {
//       test('returns cached details when available', () async {
//         final cachedRelease = Mp3AlbumRelease(id: 1, artist: 'Cached Release');
//
//         when(mockCacheService.shouldUseCache())
//             .thenAnswer((_) async => true);
//         when(mockLocalRepo.getById(1))
//             .thenAnswer((_) async => cachedRelease);
//
//         final result = await service.getAlbumReleaseDetails(1);
//
//         expect(result, equals(cachedRelease));
//         verify(mockLocalRepo.getById(1)).called(1);
//         verifyNever(mockRemoteRepo.getAlbumById(1));
//       });
//
//       test('fetches from remote when cache is invalid', () async {
//         final remoteRelease = Mp3AlbumRelease(id: 1, artist: 'Remote Release');
//
//         when(mockCacheService.shouldUseCache())
//             .thenAnswer((_) async => false);
//         when(mockRemoteRepo.getAlbumById(1))
//             .thenAnswer((_) async => remoteRelease);
//
//         final result = await service.getAlbumReleaseDetails(1);
//
//         expect(result, equals(remoteRelease));
//         verify(mockRemoteRepo.getAlbumById(1)).called(1);
//         verify(mockLocalRepo.save(remoteRelease)).called(1);
//       });
//     });
//
//     test('syncData updates cache and timestamp', () async {
//       final releases = [Mp3AlbumRelease(id: 1, artist: 'New Release')];
//
//       when(mockRemoteRepo.fetchAlbumReleases(limit: 100))
//           .thenAnswer((_) async => releases);
//
//       await service.syncData();
//
//       verify(mockRemoteRepo.fetchAlbumReleases(limit: 100)).called(1);
//       verify(mockLocalRepo.saves(releases)).called(1);
//       verify(mockCacheService.updateLastUpdateTime()).called(1);
//     });
//
//     test('preloadCache loads data if cache is invalid', () async {
//       final releases = [Mp3AlbumRelease(id: 1, artist: 'Preload Release')];
//
//       when(mockCacheService.shouldUseCache())
//           .thenAnswer((_) async => false);
//       when(mockRemoteRepo.fetchAlbumReleases(limit: 100))
//           .thenAnswer((_) async => releases);
//
//       await service.preloadCache();
//
//       verify(mockRemoteRepo.fetchAlbumReleases(limit: 100)).called(1);
//       verify(mockLocalRepo.saves(releases)).called(1);
//       verify(mockCacheService.activateCache()).called(1);
//     });
//
//     test('clearCache delegates to local repository', () async {
//       await service.clearCache();
//       verify(mockLocalRepo.deleteAllAl()).called(1);
//     });
//   });
// }