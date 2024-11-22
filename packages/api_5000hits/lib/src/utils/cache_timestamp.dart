// cache_service.dart
import 'package:api_5000hits/src/core/databases/isar_manager.dart';
import 'package:isar/isar.dart';

part 'cache_timestamp.g.dart';

@collection
class CacheTimestamp {
  Id id = Isar.autoIncrement;
  DateTime? lastUpdate;
  int validityDurationInHours = 5;

  CacheTimestamp();
}
class CacheService {
  late final Isar isar;
  static CacheService? _instance;

  CacheService._internal() {
    final isarManager = IsarManager();
    isar = isarManager.isar;
  }

  static CacheService get instance {
    _instance ??= CacheService._internal();
    return _instance!;
  }

  /// Active le cache en créant ou mettant à jour le timestamp
  Future<void> activateCache() async {
    final timestamp = await isar.cacheTimestamps.where().findFirst();

    if (timestamp == null) {
      await isar.writeTxn(() async {
        final newTimestamp = CacheTimestamp()
          ..lastUpdate = DateTime.now();
        await isar.cacheTimestamps.put(newTimestamp);
      });
    } else {
      await isar.writeTxn(() async {
        timestamp.lastUpdate = DateTime.now();
        await isar.cacheTimestamps.put(timestamp);
      });
    }
  }

  /// Vérifie si on doit utiliser le cache
  Future<bool> shouldUseCache() async {
    final timestamp = await isar.cacheTimestamps.where().findFirst();

    if (timestamp == null || timestamp.lastUpdate == null) {
      return false;
    }

    final now = DateTime.now();
    final validUntil = timestamp.lastUpdate!.add(
        Duration(hours: timestamp.validityDurationInHours)
    );

    return now.isBefore(validUntil);
  }

  /// Redéfinit la date de dernier mise à jour
  Future<void> updateLastUpdateTime() async {
    final timestamp = await isar.cacheTimestamps.where().findFirst();
    if (timestamp != null) {
      await isar.writeTxn(() async {
        timestamp.lastUpdate = DateTime.now();
        await isar.cacheTimestamps.put(timestamp);
      });
    } else {
      await activateCache();
    }
  }
}