import 'package:hive/hive.dart';
import 'package:interview_app/Core/constant/app_constant.dart';

class GeneralLocalService {
  Future<Box> _getBox<T>(String boxName) async {
    if (boxName == AppConstant.settingsBox || T == dynamic || T == Object) {
      if (!Hive.isBoxOpen(boxName)) {
        return await Hive.openBox(boxName);
      }
      return Hive.box(boxName);
    }

    if (!Hive.isBoxOpen(boxName)) {
      return await Hive.openBox<T>(boxName);
    }
    return Hive.box<T>(boxName);
  }

  Future<int> add<T>(String boxName, T value) async {
    final box = await _getBox<T>(boxName);
    return await box.add(value);
  }

  Future<void> put<T>(String boxName, dynamic key, T value) async {
    final box = await _getBox<T>(boxName);
    await box.put(key, value);
  }

  Future<T?> get<T>(String boxName, dynamic key) async {
    final box = await _getBox<T>(boxName);
    final value = box.get(key);
    if (value is T) return value;
    return null;
  }

  Future<void> delete<T>(String boxName, dynamic key) async {
    final box = await _getBox<T>(boxName);
    await box.delete(key);
  }

  Future<List<T>> getAll<T>(String boxName) async {
    final box = await _getBox<T>(boxName);
    return box.values.whereType<T>().toList();
  }

  Future<void> clearBox<T>(String boxName) async {
    final box = await _getBox<T>(boxName);
    await box.clear();
  }

  Future<void> deleteItems<T>(String boxName, bool Function(T) filter) async {
    final box = await _getBox<T>(boxName);
    final keysToDelete = <dynamic>[];
    for (var key in box.keys) {
      final item = box.get(key);
      if (item is T && filter(item)) {
        keysToDelete.add(key);
      }
    }
    await box.deleteAll(keysToDelete);
  }

  Future<void> updateItem<T>(
    String boxName,
    T newValue,
    bool Function(T) filter,
  ) async {
    final box = await _getBox<T>(boxName);
    dynamic keyToUpdate;

    for (var key in box.keys) {
      final item = box.get(key);
      if (item is T && filter(item)) {
        keyToUpdate = key;
        break;
      }
    }

    if (keyToUpdate != null) {
      await box.put(keyToUpdate, newValue);
    }
  }

  Future<void> deleteBox(String boxName) async {
    if (Hive.isBoxOpen(boxName)) {
      await Hive.box(boxName).close();
    }
    await Hive.deleteBoxFromDisk(boxName);
  }
}
