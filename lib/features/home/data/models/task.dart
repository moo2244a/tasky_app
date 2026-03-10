import 'package:hive/hive.dart';
import 'package:tasky_app/core/constant.dart';
import 'package:tasky_app/features/Auth/data/models/user_model.dart';

part 'task.g.dart';

@HiveType(typeId: 0)
class Task extends HiveObject {
  @HiveField(0)
  String image;

  @HiveField(1)
  String title;

  @HiveField(2)
  String content;

  @HiveField(3)
  final DateTime dateTime;

  @HiveField(4)
  Status status;

  @HiveField(5)
  Priority priority;
  @HiveField(6)
  final User? user;

  Task({
    required this.image,
    required this.title,
    required this.content,
    required this.dateTime,
    required this.status,
    required this.priority,
    required this.user,
  });
}
