import 'package:doitnow/data/todo_item.dart';
import 'package:hive/hive.dart';

class HiveService {
  static const String boxName = "TodoItemBox";
  static final todoBox = Hive.box<TodoItem>(HiveService.boxName);
  static Future<Box<TodoItem>> openTodoBox = Hive.openBox<TodoItem>(boxName);


  static Future<void> addTodoData(TodoItem todoItem) async {
    Box<TodoItem> box = await openTodoBox;
    await box.add(todoItem);
  }

  static Future<void> updateTodoData(int index, TodoItem todoItem) async {
    Box<TodoItem> box = await openTodoBox;
    await box.putAt(index, todoItem);
  }

 static Future<void> updateIsCompleted(int index, bool isCompleted ) async {
    Box<TodoItem> box = await openTodoBox;
    TodoItem todoItem = box.getAt(index)!;
    todoItem.isCompleted = isCompleted;
    await box.putAt(index, todoItem);
  }

  static Future<List<TodoItem>> getTodoData() async {
    Box<TodoItem> box = await openTodoBox;
    return box.values.toList();
  }

  static Future<void> deleteTodoData(int index) async {
    Box<TodoItem> box = await openTodoBox;
    await box.deleteAt(index);
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
