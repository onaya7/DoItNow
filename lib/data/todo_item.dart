import 'package:hive/hive.dart';

part 'todo_item.g.dart';

@HiveType(typeId: 1)
class TodoItem {
  @HiveField(0)
  final String id;
  @HiveField(1)
  final String title;
  @HiveField(2)
  final String description;
  @HiveField(3)
  bool isCompleted;

  TodoItem({
    required this.id,
    required this.title,
    required this.description,
    this.isCompleted = false,
  });
}
