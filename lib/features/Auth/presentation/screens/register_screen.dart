import 'package:flutter/material.dart';
import 'package:tasky_app/core/service/navigator.dart';
import 'package:tasky_app/core/theme/app_assets.dart';
import 'package:tasky_app/core/theme/app_button_style.dart';
import 'package:tasky_app/core/theme/app_colors.dart';
import 'package:tasky_app/core/theme/app_text_style.dart';
import 'package:tasky_app/features/Auth/presentation/widgets/custom_phone_field.dart';
import 'package:tasky_app/features/Auth/presentation/widgets/custom_text_field.dart';
import 'package:tasky_app/features/home/presentation/screens/home_screen.dart';
import 'package:tasky_app/features/splash/presentation/widgets/image_splash.dart';

class RegisterScreen extends StatelessWidget {
  RegisterScreen({super.key});
  final CustomNavigator customNavigator = CustomNavigator();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.kWhite,
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
                  Row(
                    children: [
                      Text(
                        "Login",
                        style: AppTextStyle.headlineLarge.copyWith(
                          color: AppColors.darkBlack,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 14),
                  CustomTextField(hintText: "Name"),
                  SizedBox(height: 14),

                  CustomPhoneField(onChanged: (val) {}),

                  SizedBox(height: 14),

                  CustomTextField(hintText: "Years of experience..."),
                  SizedBox(height: 14),
                  DropdownButtonFormField<String>(
                    decoration: InputDecoration(
                      hintText: "Choose experience Level",
                      filled: true,
                      fillColor: Color(0xfff5f5f5),
                      contentPadding: EdgeInsets.symmetric(horizontal: 20),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                    items: const [
                      DropdownMenuItem(value: "Senior", child: Text("Senior")),
                      DropdownMenuItem(value: "Junior", child: Text("Junior")),
                    ],
                    onChanged: (value) {},
                  ),
                  SizedBox(height: 15),
                  CustomTextField(hintText: "Address..."),

                  SizedBox(height: 15),
                  CustomTextField(
                    hintText: "Password...",
                    suffixIcon: Icons.visibility,
                  ),

                  SizedBox(height: 20),
                  Row(
                    children: [
                      Expanded(
                        child: ElevatedButton(
                          onPressed: () {
                            customNavigator.pushReplacement(
                              context,
                              HomeScreen(),
                            );
                          },
                          style: AppButtonStyle.elevatedButtonStyleFrom(
                            verticalPadding: 20,

                            backgroundColor: AppColors.splashBlue,
                            foregroundColor: AppColors.kWhite,
                          ),
                          child: Text(
                            "Sign Up",
                            style: AppTextStyle.headlineMedium.copyWith(
                              color: AppColors.kWhite,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 15),
                  Row(
                    mainAxisAlignment: .center,
                    children: [
                      Text(
                        "Didn’t have any account? ",
                        style: AppTextStyle.bodyMedium.copyWith(
                          color: AppColors.kOffWhiteLigth,
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          customNavigator.pop(context);
                        },
                        child: Text(
                          "Sign in here",
                          style: AppTextStyle.headlineMedium.copyWith(
                            color: AppColors.splashBlue,
                            decoration: TextDecoration.underline,
                            decorationColor: Colors.blue,
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 20),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
