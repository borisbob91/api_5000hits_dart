import 'package:api_5000hits/api_5000hits.dart';
import 'package:isar/isar.dart';
import 'database_interface.dart';
import 'isar_manager.dart';

class IsarClientDb<T> implements DatabaseInterface<T> {
  late IsarCollection<T> _collection;
  final IsarManager _isarManager = IsarManager();

  IsarClientDb();

  @override
  Future<void> initialize() async {
    await _isarManager.initialize();
    _collection = _isarManager.isar.collection<T>();
  }

  @override
  Future<int> create(T item) async {
    return await _isarManager.isar.writeTxn(() => _collection.put(item));
  }

  @override
  Future<T?> read(int id) async {
    return await _collection.get(id);
  }

  @override
  Future<void> update(T item) async {
    await _isarManager.isar.writeTxn(() => _collection.put(item));
  }

  @override
  Future<void> delete(int id) async {
  
    await _isarManager.isar.writeTxn(() => _collection.delete(id));
  }

  @override
  Future<List<T>> getAll() async {
    return await _collection.where().findAll();
  }

  @override
  Future<List<T>> search(String query) async {
    // Implémentez la logique de recherche spécifique ici
    throw UnimplementedError('Search not implemented for type $T');
  }

    @override
  Future<List<T>> searchAlbums(String query) async {
    // if (T == Mp3Album) {
    //   return await _collection.filter()
    //       .nameContains(query, caseSensitive: false)
    //       .or()
    //       .artistContains(query, caseSensitive: false)
    //       .findAll() as List<T>;
    // }
    // Ajoutez d'autres conditions pour les autres types que vous utilisez
    throw UnimplementedError('Search not implemented for type $T');
  }

  @override
  Future<void> clear() async {
    await _isarManager.isar.writeTxn(() => _collection.clear());
  }
}
