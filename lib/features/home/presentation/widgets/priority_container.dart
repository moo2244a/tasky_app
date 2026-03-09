import 'package:flutter/material.dart';
import 'package:tasky_app/core/theme/app_text_style.dart';

class PriorityContainer extends StatelessWidget {
  const PriorityContainer({super.key, required this.color, required this.text});
  final Color color;
  final String text;
  @override
  Widget build(BuildContext context) {
    return Text(text, style: AppTextStyle.bodyMedium.copyWith(color: color));
  }
}
