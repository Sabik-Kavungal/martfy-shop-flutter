import 'package:hive_flutter/hive_flutter.dart';
class LocalDB {
  Future<Box<dynamic>> openBox(String boxName) async {
    if (Hive.isBoxOpen(boxName)) {
      return Hive.box(boxName);
    } else {
      return await Hive.openBox(boxName);
    }
  }

  Future<void> saveData(Box<dynamic> box, String key, dynamic value) async {
    await box.put(key, value);
  }

  dynamic getData(Box<dynamic> box, String key) {
    return box.get(key);
  }

  Future<void> deleteData(Box<dynamic> box, String key) async {
    await box.delete(key);
  }

  Future<void> closeBox(Box<dynamic> box) async {
    if (box.isOpen) {
      await box.close();
    }
  }

  bool isBoxOpen(Box<dynamic> box) {
    return box.isOpen;
  }
}