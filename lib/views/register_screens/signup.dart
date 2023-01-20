import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:insightalk/controllers/registration_controllers/signup_controller.dart';
import 'package:insightalk/views/register_screens/login.dart';
import 'package:insightalk/widgets/app_logo.dart';

import '../../constants/app_colors.dart';
import '../../constants/app_paddings.dart';
import '../../widgets/app_buttons.dart';
import '../../widgets/app_input_field.dart';
import '../../widgets/app_text.dart';

class Signup extends StatelessWidget {
  Signup({Key? key}) : super(key: key);
  final SignupController _signupController = Get.put(SignupController());

  @override
  Widget build(BuildContext context) {
    return ColoredBox(
      color: AppColors.primaryColor,
      child: SafeArea(
          child: Scaffold(
        body: Padding(
          padding: AppPaddings.defaultPadding,
          child: Center(
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const AppLogo(
                    size: 70,
                  ),
                  AppPaddings.heigthSpace30,
                  const AppText(
                    text: "Register to Insightalk",
                    fontSize: 20,
                    fontWeight: FontWeight.w600,
                  ),
                  AppPaddings.heigthSpace30,
                  AppPaddings.heigthSpace30,
                  AppInputField(
                    headingText: "Username",
                    controller: _signupController.name,
                  ),
                  AppPaddings.heigthSpace30,
                  AppInputField(
                    controller: _signupController.email,
                    headingText: "Email",
                  ),
                  AppPaddings.heigthSpace30,
                  AppInputField(
                    controller: _signupController.password,
                    headingText: "Password",
                  ),
                  AppPaddings.heigthSpace30,
                  AppInputField(
                    controller: _signupController.confirmPassword,
                    headingText: "ConfirmPassword",
                  ),
                  AppPaddings.heigthSpace20,
                  AppButton(
                    onTap: () {
                      _signupController.isValidUser();
                    },
                    childText: "Signup",
                  ),
                  AppPaddings.heigthSpace10,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const AppText(
                        text: "Already have an account?",
                        fontSize: 15,
                        fontWeight: FontWeight.w500,
                        textColor: Colors.grey,
                      ),
                      InkWell(
                        onTap: () {
                          Get.off(
                            () => Login(),
                          );
                        },
                        child: const AppText(
                          text: "Login",
                          fontSize: 15,
                          fontWeight: FontWeight.w500,
                          textColor: AppColors.primaryColor,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      )),
    );
  }
}
