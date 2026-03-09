import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:tasky_app/core/constant.dart';
import 'package:tasky_app/core/theme/app_assets.dart';
import 'package:tasky_app/features/home/data/models/task.dart';
import 'package:tasky_app/features/home/presentation/widgets/item_of_list_view_tasks.dart';
import 'package:tasky_app/features/home/presentation/widgets/widget_priority.dart';
import 'package:tasky_app/features/home/presentation/widgets/widget_status.dart';

class ListViewTasks extends StatelessWidget {
  const ListViewTasks({
    super.key,
    required this.widgetStatus,
    required this.widgetPriority,
  });

  final WidgetStatus widgetStatus;
  final WidgetPriority widgetPriority;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 8,
      itemBuilder: (BuildContext context, int index) {
        Task task1 = Task(
          image: AppAssets.imageItem,
          title:
              "Finish UI Design Finish UI DesignFinish UI DesignFinish UI Design",
          content: "Complete the UI for the Aqar360 home screen",
          dateTime: DateTime.now(),
          status: Status.waiting,
          priority: Priority.medium,
        );
        final String formattedDate = DateFormat(
          'yyyy/MM/dd',
        ).format(task1.dateTime);
        return ItemOfListViewTasks(
          task1: task1,
          widgetStatus: widgetStatus,
          widgetPriority: widgetPriority,
          formattedDate: formattedDate,
        );
      },
    );
  }
}
