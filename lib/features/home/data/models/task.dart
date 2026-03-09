import 'package:tasky_app/core/constant.dart';

class Task {
  final String image;
  final String title;
  final String content;
  final DateTime dateTime;
  final Status status;
  final Priority priority;

  Task({
    required this.image,
    required this.title,
    required this.content,
    required this.dateTime,
    required this.status,
    required this.priority,
  });
}
