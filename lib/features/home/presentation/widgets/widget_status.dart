import 'package:flutter/material.dart';
import 'package:tasky_app/core/constant.dart';
import 'package:tasky_app/features/home/presentation/widgets/status_container.dart';

class WidgetStatus {
  Widget call(Status status) {
    Color? color;
    String? text;
    if (status == Status.waiting) {
      color = Colors.red;
      text = "Waiting";
    } else if (status == Status.inProgress) {
      color = const Color(0xff5f33e1);
      text = "InProgress";
    } else if (status == Status.finished) {
      color = Colors.blue;
      text = "Finished";
    }
    return StatusContainer(color: color!, text: text!);
  }
}
