import 'package:hive/hive.dart';
import 'package:logger/logger.dart';

class LocalDatabaseService {
  final Logger _logger = Logger();

  Future<Box<T>> openBox<T>(String boxName) async {
    try {
      await Hive.openBox<T>(boxName); // Open the box before returning it
      return Hive.box<T>(boxName);
    } catch (e) {
      _logger.e('Error opening box $boxName: $e');
      rethrow;
    }
  }

  Future<void> toDb<T>(Box<T> box, String key, T value) async {
    try {
      await box.put(key, value);
    } catch (e) {
      _logger.e('Error saving data in box ${box.name}: $e');
      rethrow;
    }
  }

  T? fromDb<T>(Box<T> box, String key) {
    try {
      return box.get(key);
    } catch (e) {
      _logger.e('Error getting data from box ${box.name}: $e');
      return null;
    }
  }

  Future<void> deleteDb<T>(Box<T> box, String key) async {
    try {
      await box.delete(key);
    } catch (e) {
      _logger.e('Error deleting data from box ${box.name}: $e');
      rethrow;
    }
  }

  Future<void> closeBox<T>(Box<T> box) async {
    try {
      await box.close();
    } catch (e) {
      _logger.e('Error closing box ${box.name}: $e');
      rethrow;
    }
  }

  bool isBoxOpen<T>(Box<T> box) => box.isOpen;
}
