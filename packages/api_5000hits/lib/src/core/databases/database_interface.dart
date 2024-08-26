// Fichier: database_interface.dart
import 'package:isar/isar.dart';

abstract class DatabaseInterface<T> {
  Future<void> initialize();
  Future<int> create(T item);
  Future<T?> read(int id);
  Future<void> update(T item);
  Future<void> delete(int id);
  Future<List<T>> getAll();
  Future<List<T>> search(String query);
  Future<void> clear();
}
