import 'package:flutter/material.dart';
import 'package:tasky_app/core/theme/app_button_style.dart';
import 'package:tasky_app/core/theme/app_colors.dart';
import 'package:tasky_app/core/theme/app_text_style.dart';

class CustomElevatedButton extends StatelessWidget {
  const CustomElevatedButton({
    super.key,
    required this.onPressed,
    required this.text,
  });
  final void Function()? onPressed;
  final String text;
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: AppButtonStyle.elevatedButtonStyleFrom(
        verticalPadding: 20,

        backgroundColor: AppColors.splashBlue,
        foregroundColor: AppColors.kWhite,
      ),
      child: Text(
        text,
        style: AppTextStyle.headlineMedium.copyWith(color: AppColors.kWhite),
      ),
    );
  }
}
