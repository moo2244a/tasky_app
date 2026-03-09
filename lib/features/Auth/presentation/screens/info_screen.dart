import 'package:flutter/material.dart';
import 'package:tasky_app/core/service/navigator.dart';
import 'package:tasky_app/core/theme/app_assets.dart';
import 'package:tasky_app/core/theme/app_button_style.dart';
import 'package:tasky_app/core/theme/app_colors.dart';
import 'package:tasky_app/core/theme/app_text_style.dart';
import 'package:tasky_app/features/Auth/presentation/screens/login_screen.dart';
import 'package:tasky_app/features/splash/presentation/widgets/image_splash.dart';

class InfoScreen extends StatelessWidget {
  final CustomNavigator customNavigator = CustomNavigator();

  InfoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ListView(
          children: [
            CustomImage(
              width: MediaQuery.sizeOf(context).width * .5,
              height: 400,
              imagePath: AppAssets.imageInAuth,
            ),
            Container(
              padding: .symmetric(horizontal: 40),
              child: Column(
                children: [
                  Text(
                    textAlign: .center,
                    "Task Management & To-Do List",
                    style: AppTextStyle.headlineLarge.copyWith(
                      color: AppColors.darkBlack,
                    ),
                  ),
                  SizedBox(height: 15),
                  Text(
                    textAlign: .center,
                    """This productive tool is designed to help
            you better manage your task 
            project-wise conveniently!""",
                    style: AppTextStyle.bodySmall.copyWith(
                      color: AppColors.kOffWhiteLigth,
                    ),
                  ),
                  SizedBox(height: 20),
                  Row(
                    children: [
                      Expanded(
                        child: ElevatedButton(
                          onPressed: () {
                            customNavigator.push(context, LoginScreen());
                          },
                          style: AppButtonStyle.elevatedButtonStyleFrom(
                            verticalPadding: 20,
                            backgroundColor: AppColors.splashBlue,
                            foregroundColor: AppColors.kWhite,
                          ),
                          child: Row(
                            mainAxisAlignment: .center,
                            children: [
                              Text(
                                "Let’s Start",
                                style: AppTextStyle.headlineMedium.copyWith(
                                  color: AppColors.kWhite,
                                ),
                              ),
                              SizedBox(width: 2),
                              Icon(Icons.arrow_forward_ios),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
