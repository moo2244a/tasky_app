import 'package:flutter/material.dart';
import 'package:tasky_app/core/theme/app_colors.dart';
import 'package:tasky_app/core/theme/app_text_style.dart';
import 'package:tasky_app/features/Auth/data/models/user_model.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key, required this.user});
  final User user;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          ContinerItemList(title: 'NAME', subtitle: user.name),
          ContinerItemList(title: 'PHONE', subtitle: user.phone),
          ContinerItemList(title: 'LEVEL', subtitle: user.level),
          ContinerItemList(
            title: 'Years of experience',
            subtitle: user.yearsOfExp,
          ),
          ContinerItemList(title: 'Location', subtitle: user.address),
        ],
      ),
      appBar: AppBar(
        title: Text(
          "Profile",
          style: AppTextStyle.bodyMedium.copyWith(color: AppColors.darkBlack),
        ),
      ),
    );
  }
}

class ContinerItemList extends StatelessWidget {
  const ContinerItemList({
    super.key,
    required this.title,
    required this.subtitle,
  });
  final String title;
  final String subtitle;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Card(
        elevation: 0,

        child: ListTile(
          title: Text(
            title,
            style: AppTextStyle.bodySmall.copyWith(
              color: AppColors.kOffWhiteLigth,
            ),
          ),
          subtitle: Text(
            subtitle,
            style: AppTextStyle.bodyMedium.copyWith(color: AppColors.darkBlack),
          ),
        ),
      ),
    );
  }
}
