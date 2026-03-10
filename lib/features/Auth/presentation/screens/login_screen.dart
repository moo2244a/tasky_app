import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:tasky_app/core/constant.dart';
import 'package:tasky_app/core/service/navigator.dart';
import 'package:tasky_app/core/theme/app_assets.dart';
import 'package:tasky_app/core/theme/app_colors.dart';
import 'package:tasky_app/core/theme/app_text_style.dart';
import 'package:tasky_app/core/widget/custom_elevated_button.dart';
import 'package:tasky_app/features/Auth/data/models/user_model.dart';
import 'package:tasky_app/features/Auth/presentation/screens/register_screen.dart';
import 'package:tasky_app/features/Auth/presentation/widgets/custom_phone_field.dart';
import 'package:tasky_app/features/Auth/presentation/widgets/find_user_by_phone.dart';
import 'package:tasky_app/features/Auth/presentation/widgets/snak_bar_message.dart';
import 'package:tasky_app/features/home/presentation/screens/home_screen.dart';
import 'package:tasky_app/features/Auth/presentation/widgets/custom_text_field.dart';

import 'package:tasky_app/features/splash/presentation/widgets/image_splash.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});
  final CustomNavigator customNavigator = CustomNavigator();
  final SnackBarMessage snackBarMessage = SnackBarMessage();
  final FindUserByPhone isExistPhone = FindUserByPhone();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final GlobalKey<FormState> globalKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    final box = Hive.box<User>(nameBoxUser);
    final users = box.values.toList();
    return Scaffold(
      backgroundColor: AppColors.kWhite,
      body: SafeArea(
        child: Form(
          key: globalKey,
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
                    CustomPhoneField(
                      onChanged: (val) {},
                      controller: phoneController,
                    ),
                    SizedBox(height: 15),
                    CustomTextField(
                      hintText: "Password...",
                      suffixIcon: Icons.visibility,
                      controller: passwordController,
                    ),

                    SizedBox(height: 20),

                    Row(
                      children: [
                        Expanded(
                          child: CustomElevatedButton(
                            onPressed: () {
                              if (phoneController.text == "") {
                                snackBarMessage(
                                  context,
                                  "Please enter phone number",
                                  false,
                                );

                                return;
                              }
                              if (globalKey.currentState!.validate()) {
                                final user = isExistPhone(
                                  users,
                                  phoneController.text,
                                );
                                if (user != null) {
                                  if (passwordController.text ==
                                      user.password) {
                                    snackBarMessage(
                                      context,
                                      "Registration successful",
                                      true,
                                    );

                                    Navigator.pushAndRemoveUntil(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) =>
                                            HomeScreen(user: user),
                                      ),
                                      (route) => false,
                                    );
                                  } else {
                                    snackBarMessage(
                                      context,
                                      "error password",
                                      false,
                                    );
                                  }
                                } else {
                                  snackBarMessage(
                                    context,
                                    "This phone number not already exists",
                                    false,
                                  );
                                  return;
                                }
                              }
                            },
                            text: "Sign in",
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
                            customNavigator.push(context, RegisterScreen());
                          },
                          child: Text(
                            "Sign Up here",
                            style: AppTextStyle.headlineMedium.copyWith(
                              color: AppColors.splashBlue,
                              decoration: TextDecoration.underline,
                              decorationColor: Colors.blue,
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
      ),
    );
  }
}
