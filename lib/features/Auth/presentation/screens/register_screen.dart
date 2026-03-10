import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:tasky_app/core/constant.dart';
import 'package:tasky_app/core/service/navigator.dart';
import 'package:tasky_app/core/service/validator_service.dart';
import 'package:tasky_app/core/theme/app_assets.dart';
import 'package:tasky_app/core/theme/app_colors.dart';
import 'package:tasky_app/core/theme/app_text_style.dart';
import 'package:tasky_app/core/widget/custom_elevated_button.dart';
import 'package:tasky_app/features/Auth/data/models/user_model.dart';
import 'package:tasky_app/features/Auth/presentation/widgets/custom_phone_field.dart';
import 'package:tasky_app/features/Auth/presentation/widgets/custom_text_field.dart';
import 'package:tasky_app/features/Auth/presentation/widgets/find_user_by_phone.dart';
import 'package:tasky_app/features/Auth/presentation/widgets/snak_bar_message.dart';
import 'package:tasky_app/features/home/presentation/screens/home_screen.dart';
import 'package:tasky_app/features/splash/presentation/widgets/image_splash.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final CustomNavigator customNavigator = CustomNavigator();

  final TextEditingController nameController = TextEditingController();

  final TextEditingController phoneController = TextEditingController();

  final TextEditingController yearsOfExpController = TextEditingController();

  String? levelController;

  final TextEditingController addressController = TextEditingController();

  final TextEditingController passwordController = TextEditingController();

  final GlobalKey<FormState> globalKey = GlobalKey();

  final SnackBarMessage snackBarMessage = SnackBarMessage();
  final FindUserByPhone isExistPhone = FindUserByPhone();
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
                    CustomTextField(
                      hintText: "Name",
                      controller: nameController,
                      validator: ValidatorService.validateName,
                    ),
                    SizedBox(height: 14),

                    CustomPhoneField(
                      onChanged: (val) {},
                      controller: phoneController,
                    ),

                    SizedBox(height: 14),

                    CustomTextField(
                      hintText: "Years of experience...",
                      controller: yearsOfExpController,
                      validator: ValidatorService.validateTitle,
                    ),
                    SizedBox(height: 14),
                    DropdownButtonFormField<String>(
                      validator: ValidatorService.validateTitle,
                      initialValue: levelController,
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
                        DropdownMenuItem(
                          value: "Senior",
                          child: Text("Senior"),
                        ),
                        DropdownMenuItem(
                          value: "Junior",
                          child: Text("Junior"),
                        ),
                      ],
                      onChanged: (value) {
                        levelController = value;
                      },
                    ),
                    SizedBox(height: 15),
                    CustomTextField(
                      hintText: "Address...",
                      controller: addressController,
                      validator: ValidatorService.validateTitle,
                    ),

                    SizedBox(height: 15),
                    CustomTextField(
                      hintText: "Password...",
                      controller: passwordController,
                      validator: ValidatorService.validateTitle,
                      suffixIcon: Icons.visibility,
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
                                if (isExistPhone(users, phoneController.text) ==
                                    null) {
                                  final user = User(
                                    name: nameController.text,
                                    phone: phoneController.text,
                                    yearsOfExp: yearsOfExpController.text,
                                    level: levelController!,
                                    address: addressController.text,
                                    password: passwordController.text,
                                  );
                                  box.add(user);
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
                                    "This phone number already exists",
                                    false,
                                  );
                                  return;
                                }
                              }
                            },
                            text: "Sign Up",
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
      ),
    );
  }
}
