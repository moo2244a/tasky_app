import 'package:flutter/material.dart';
import 'package:tasky_app/core/constant.dart';
import 'package:tasky_app/features/home/presentation/widgets/priority_container.dart';

class WidgetPriority {
  Widget call(Priority status) {
    Color? color;
    String? text;
    if (status == Priority.heigh) {
      color = Colors.deepOrange;
      text = "Heigh";
    } else if (status == Priority.medium) {
      color = const Color(0xff5f33e1);
      text = "Medium";
    } else if (status == Priority.low) {
      color = Colors.blue;
      text = "Low";
    }
    return PriorityContainer(color: color!, text: text!);
  }
}
