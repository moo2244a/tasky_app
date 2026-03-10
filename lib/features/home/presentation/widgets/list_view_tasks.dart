import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

import 'package:intl/intl.dart';
import 'package:tasky_app/core/constant.dart';
import 'package:tasky_app/core/service/navigator.dart';
import 'package:tasky_app/features/Auth/data/models/user_model.dart';
import 'package:tasky_app/features/home/data/models/task.dart';
import 'package:tasky_app/features/home/presentation/screens/edit_task.dart';
import 'package:tasky_app/features/home/presentation/widgets/item_of_list_view_tasks.dart';
import 'package:tasky_app/features/home/presentation/widgets/widget_priority.dart';
import 'package:tasky_app/features/home/presentation/widgets/widget_status.dart';

class ListViewTasks extends StatefulWidget {
  const ListViewTasks({
    super.key,
    required this.widgetStatus,
    required this.widgetPriority,
    required this.isSelectIndex,
    required this.categories,
    required this.user,
  });
  final int isSelectIndex;
  final List<String> categories;
  final User user;
  final WidgetStatus widgetStatus;
  final WidgetPriority widgetPriority;

  @override
  State<ListViewTasks> createState() => _ListViewTasksState();
}

class _ListViewTasksState extends State<ListViewTasks> {
  final CustomNavigator customNavigator = CustomNavigator();

  List<Task> filterTasks(Box<Task> box) {
    final tasks = box.values.toList();
    final taskByUser = tasks
        .where((t) => t.user!.phone == widget.user.phone)
        .toList();
    switch (widget.categories[widget.isSelectIndex]) {
      case "Inpogress":
        return taskByUser.where((t) => t.status == Status.inProgress).toList();
      case "Waiting":
        return taskByUser.where((t) => t.status == Status.waiting).toList();
      case "Finished":
        return taskByUser.where((t) => t.status == Status.finished).toList();
      default:
        return taskByUser;
    }
  }

  @override
  Widget build(BuildContext context) {
    final tasks = filterTasks(Hive.box<Task>(nameBoxTask));
    return tasks.isNotEmpty
        ? ListView.builder(
            itemCount: tasks.length,
            itemBuilder: (BuildContext context, int index) {
              final Task task1 = tasks[index];
              final String formattedDate = DateFormat(
                'yyyy/MM/dd',
              ).format(task1.dateTime);
              return ItemOfListViewTasks(
                task1: task1,
                onPressDelete: () async {
                  await task1.delete();
                  setState(() {});
                },
                onTap: () async {
                  await customNavigator.pushFuture(
                    context,
                    EditTaskScreen(task: task1),
                  );
                  setState(() {});
                },
                widgetStatus: widget.widgetStatus,
                widgetPriority: widget.widgetPriority,
                formattedDate: formattedDate,
              );
            },
          )
        : Center(child: Text("no element"));
  }
}
