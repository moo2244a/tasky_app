import 'package:flutter/material.dart';
import 'package:tasky_app/core/theme/app_colors.dart';

class AppButtonStyle {
  static ButtonStyle Function({
    Color backgroundColor,
    Color foregroundColor,
    double borderRadiusCircular,
    double horizontalPadding,
    double verticalPadding,
  })
  elevatedButtonStyleFrom =
      ({
        Color backgroundColor = AppColors.darkBlack,
        Color foregroundColor = Colors.white,
        double borderRadiusCircular = 12,
        double horizontalPadding = 16,
        double verticalPadding = 12,
      }) {
        return ElevatedButton.styleFrom(
          backgroundColor: backgroundColor,
          foregroundColor: foregroundColor,
          padding: EdgeInsets.symmetric(
            horizontal: horizontalPadding,
            vertical: verticalPadding,
          ),
          elevation: 4,
          shape: RoundedRectangleBorder(
            side: BorderSide(color: AppColors.darkBlack),
            borderRadius: BorderRadius.circular(borderRadiusCircular),
          ),
        );
      };
}
