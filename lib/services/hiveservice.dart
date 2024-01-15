import 'package:doitnow/data/todo_item.dart';
import 'package:hive/hive.dart';

class HiveService {
  static const String boxName = "TodoData";
  // static const String boxName = "TodoManager";

  static final todoBox = Hive.box<TodoItem>(HiveService.boxName);
  static Future<Box<TodoItem>> openTodoBox = Hive.openBox<TodoItem>(boxName);

  static Future<void> addTodoData(TodoItem todoItem) async {
    Box<TodoItem> box = await openTodoBox;
    await box.put(todoItem.id, todoItem);
  }

  static Future<void> updateTodoData(TodoItem todoItem) async {
    Box<TodoItem> box = await openTodoBox;
    await box.put(todoItem.id, todoItem);
  }

  static Future<void> updateIsCompleted(String id, bool isCompleted) async {
    Box<TodoItem> box = await openTodoBox;
    TodoItem todoItem = box.get(id)!;
    todoItem.isCompleted = isCompleted;
    await box.put(id, todoItem);
  }

  static Future<List<TodoItem>> getTodoData() async {
    Box<TodoItem> box = await openTodoBox;
    return box.values.toList();
  }



  static Future<void> deleteTodoData(String id) async {
    Box<TodoItem> box = await openTodoBox;
    await box.delete(id);
  }

  static Future<void> deleteAllTodoData() async {
    Box<TodoItem> box = await openTodoBox;
    await box.clear();
  }

  static Future<void> closeBox() async {
    Box<TodoItem> box = await openTodoBox;
    await box.close();
  }
}

