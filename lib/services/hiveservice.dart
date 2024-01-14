import 'package:doitnow/data/todo_item.dart';
import 'package:hive/hive.dart';

class HiveService {
  static const String _boxName = "TodoItemBox";

  Future<void> saveData(String key, String value) async {
    Box box = await Hive.openBox<TodoItem>(_boxName);
    await box.put(key, value);
  }

  Future<String> getData(String key) async {
    var box = await Hive.openBox(_boxName);
    return box.get(key);
  }

  Future<void> deleteData(String key) async {
    var box = await Hive.openBox(_boxName);
    await box.delete(key);
  }
}
