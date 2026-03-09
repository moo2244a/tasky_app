import 'dart:async';

import 'package:flutter/material.dart';
import 'package:tasky_app/core/service/navigator.dart';
import 'package:tasky_app/core/theme/app_assets.dart';
import 'package:tasky_app/core/theme/app_colors.dart';
import 'package:tasky_app/features/Auth/presentation/screens/info_screen.dart';
import 'package:tasky_app/features/splash/presentation/widgets/image_splash.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  final CustomNavigator customNavigator = CustomNavigator();
  @override
  void initState() {
    super.initState();
    Timer(Duration(seconds: 4), () {
      customNavigator.push(context, InfoScreen());
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.splashBlue,
      body: SafeArea(
        child: Center(
          child: CustomImage(
            width: 130,
            height: 40,
            imagePath: AppAssets.logoApp,
          ),
        ),
      ),
    );
  }
}
