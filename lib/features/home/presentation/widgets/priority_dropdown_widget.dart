import 'package:flutter/material.dart';
import 'package:tasky_app/core/constant.dart';
import 'package:tasky_app/core/theme/app_colors.dart';
import 'package:tasky_app/core/theme/app_text_style.dart';

class PriorityDropdownWidget extends StatelessWidget {
  const PriorityDropdownWidget({
    super.key,
    required this.priority,
    required this.isCheckPriority,
    required this.onChanged,
  });

  final Priority? priority;
  final bool isCheckPriority;
  final void Function(Priority?) onChanged;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 12),
          decoration: BoxDecoration(
            color: Colors.deepPurple.withOpacity(.1),
            borderRadius: BorderRadius.circular(10),
          ),
          child: DropdownButtonHideUnderline(
            child: DropdownButton<Priority>(
              hint: Text(
                "Priority",
                style: AppTextStyle.bodySmall.copyWith(
                  color: AppColors.kOffWhiteLigth,
                ),
              ),
              value: priority,
              items: const [
                DropdownMenuItem(
                  value: Priority.low,
                  child: Text("Low Priority"),
                ),
                DropdownMenuItem(
                  value: Priority.medium,
                  child: Text("Medium Priority"),
                ),
                DropdownMenuItem(
                  value: Priority.high,
                  child: Text("High Priority"),
                ),
              ],
              onChanged: onChanged,
              icon: const Icon(Icons.keyboard_arrow_down),
              isExpanded: true,
            ),
          ),
        ),
        isCheckPriority
            ? SizedBox()
            : Row(
                children: [
                  SizedBox(width: 12),
                  Text(
                    "Please select a priority",
                    style: AppTextStyle.bodySmall.copyWith(
                      color: Color(0XFFb3261e),
                      fontSize: 12,
                    ),
                  ),
                ],
              ),
      ],
    );
  }
}
