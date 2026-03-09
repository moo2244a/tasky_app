import 'package:flutter/material.dart';
import 'package:tasky_app/core/theme/app_text_style.dart';

class StatusContainer extends StatelessWidget {
  const StatusContainer({super.key, required this.color, required this.text});
  final Color color;
  final String text;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(5),
      decoration: BoxDecoration(
        color: color.withValues(alpha: .2),
        borderRadius: .circular(10),
      ),
      height: 40,

      child: Center(
        child: Text(
          text,
          style: AppTextStyle.headlineMedium.copyWith(color: color),
        ),
      ),
    );
  }
}
