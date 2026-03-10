import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';

import 'package:tasky_app/app_root.dart';
import 'package:tasky_app/core/constant.dart';
import 'package:tasky_app/features/Auth/data/models/user_model.dart';
import 'package:tasky_app/features/home/data/models/task.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Hive.initFlutter();

  Hive.registerAdapter(StatusAdapter());
  Hive.registerAdapter(PriorityAdapter());
  Hive.registerAdapter(UserAdapter());
  Hive.registerAdapter(TaskAdapter());

  await Hive.openBox<User>(nameBoxUser);
  await Hive.openBox<Task>(nameBoxTask);

  runApp(const AppRoot());
}
