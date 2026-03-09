import 'package:flutter/material.dart';
import 'package:tasky_app/core/theme/app_colors.dart';
import 'package:tasky_app/core/theme/app_text_style.dart';

class ItemOfCategories extends StatelessWidget {
  const ItemOfCategories({
    super.key,
    required this.categories,
    required this.isSelectIndex,
    required this.currentindex,
    this.onTap,
  });

  final List<dynamic> categories;
  final int isSelectIndex;
  final int currentindex;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 15, vertical: 0),
      decoration: BoxDecoration(
        borderRadius: .circular(10),
        color: (isSelectIndex == currentindex)
            ? AppColors.splashBlue
            : AppColors.splashBlue.withValues(alpha: .1),
      ),
      child: Center(
        child: Text(
          categories[currentindex],
          style: AppTextStyle.headlineMedium.copyWith(
            color: (isSelectIndex == currentindex)
                ? AppColors.kOffWhite
                : AppColors.kOffWhiteLigth,
          ),
        ),
      ),
    );
  }
}
