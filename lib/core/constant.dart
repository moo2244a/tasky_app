import 'package:hive/hive.dart';

part 'constant.g.dart';

@HiveType(typeId: 1)
enum Status {
  @HiveField(0)
  waiting,

  @HiveField(1)
  inProgress,

  @HiveField(2)
  finished,
}

@HiveType(typeId: 2)
enum Priority {
  @HiveField(0)
  low,

  @HiveField(1)
  medium,

  @HiveField(2)
  high,
}

final String nameBoxTask = 'tasks';
final String nameBoxUser = 'users';
