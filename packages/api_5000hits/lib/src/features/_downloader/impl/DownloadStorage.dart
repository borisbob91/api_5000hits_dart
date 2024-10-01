import '../../../core/databases/isar_manager.dart';
import '../download_info.dart';
import '../interfaces.dart';



class DownloadStorage implements DownloadStorageInterface {
  final IsarManager _isarManager;

  DownloadStorage(this._isarManager);

  get isar => _isarManager.isar;

  @override
  Future<void> saveDownloadInfo(DownloadInfo info) async {
    final downloadInfoIsar = DownloadInfoIsar.fromDownloadInfo(info);
    await isar.writeTxn(() async {
      await isar.downloadInfoIsars.put(downloadInfoIsar);
    });
  }

  @override
  Future<DownloadInfo?> getDownloadInfo(String slug) async {
    final downloadInfoIsar = await isar.downloadInfoIsars
        .filter()
        .slugEqualTo(slug)
        .findFirst();

    return downloadInfoIsar?.toDownloadInfo();
  }

  @override
  Future<List<DownloadInfo>> getAllDownloads() async {
    final downloadInfoIsars = await isar.downloadInfoIsars.where().findAll();
    return downloadInfoIsars.map((info) => info.toDownloadInfo()).toList();
  }

  @override
  Future<void> updateDownloadStatus(String slug, DownloadStatus status) async {
    await isar.writeTxn(() async {
      final downloadInfoIsar = await isar.downloadInfoIsars
          .filter()
          .slugEqualTo(slug)
          .findFirst();

      if (downloadInfoIsar != null) {
        downloadInfoIsar.status = status;
        await isar.downloadInfoIsars.put(downloadInfoIsar);
      }
    });
  }

  @override
  Future<void> deleteDownloadInfo(String slug) async {
    await isar.writeTxn(() async {
      await isar.downloadInfoIsars
          .filter()
          .slugEqualTo(slug)
          .deleteAll();
    });
  }

  Future<List<DownloadInfo>> getDownloadsByStatus(DownloadStatus status) async {
    final downloadInfoIsars = await isar.downloadInfoIsars
        .filter()
        .statusEqualTo(status)
        .findAll();

    return downloadInfoIsars.map((info) => info.toDownloadInfo()).toList();
  }

  Future<void> clearAllDownloads() async {
    await isar.writeTxn(() async {
      await isar.downloadInfoIsars.clear();
    });
  }
}