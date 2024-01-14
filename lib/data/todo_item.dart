import 'package:hive/hive.dart';

part 'todo_item.g.dart';

@HiveType(typeId: 1)
class TodoItem {
  @HiveField(0)
  final String title;
  @HiveField(1)
  final String description;
  @HiveField(2)
  bool isCompleted;

  TodoItem({
    required this.title,
    required this.description,
    this.isCompleted = false,
  });
}
