import 'package:flutter/material.dart';
import 'package:tasky_app/core/theme/app_assets.dart';
import 'package:tasky_app/core/theme/app_colors.dart';
import 'package:tasky_app/core/theme/app_text_style.dart';
import 'package:tasky_app/features/home/data/models/task.dart';
import 'package:tasky_app/features/home/presentation/widgets/widget_priority.dart';
import 'package:tasky_app/features/home/presentation/widgets/widget_status.dart';

class ItemOfListViewTasks extends StatelessWidget {
  const ItemOfListViewTasks({
    super.key,
    required this.task1,
    required this.widgetStatus,
    required this.widgetPriority,
    required this.formattedDate,
  });

  final Task task1;
  final WidgetStatus widgetStatus;
  final WidgetPriority widgetPriority;
  final String formattedDate;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0,
      color: AppColors.kWhite,

      child: ListTile(
        contentPadding: EdgeInsets.symmetric(horizontal: 5),
        leading: SizedBox(
          child: Image.asset(AppAssets.imageItem, fit: .fitHeight),
        ),
        title: Row(
          children: [
            Expanded(
              child: Text(
                task1.title,
                overflow: .ellipsis,

                maxLines: 1,
                style: AppTextStyle.headlineMedium.copyWith(
                  color: AppColors.darkBlack,
                ),
              ),
            ),
            widgetStatus(task1.status),
          ],
        ),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              task1.content,
              overflow: .ellipsis,
              maxLines: 1,
              style: AppTextStyle.bodyMedium.copyWith(
                color: AppColors.kOffWhiteLigth,
              ),
            ),
            Row(
              mainAxisAlignment: .spaceBetween,
              children: [
                widgetPriority(task1.priority),
                Text(
                  formattedDate,
                  style: AppTextStyle.bodySmall.copyWith(
                    color: AppColors.kOffWhiteLigth,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
