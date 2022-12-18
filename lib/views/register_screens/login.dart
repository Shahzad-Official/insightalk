import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:insightalk/constants/app_colors.dart';
import 'package:insightalk/constants/app_paddings.dart';
import 'package:insightalk/controllers/registration_controllers/login_controller.dart';
import 'package:insightalk/views/register_screens/email_check.dart';
import 'package:insightalk/views/register_screens/signup.dart';
import 'package:insightalk/widgets/app_buttons.dart';
import 'package:insightalk/widgets/app_input_field.dart';
import 'package:insightalk/widgets/app_logo.dart';
import 'package:insightalk/widgets/app_text.dart';

// ignore: must_be_immutable
class Login extends StatelessWidget {
  Login({Key? key}) : super(key: key);
  final LoginController _loginController = Get.put(LoginController());

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
                  AppLogo(),
                  AppInputField(
                    controller: _loginController.email,
                    headingText: "Email/Phone",
                  ),
                  AppPaddings.heigthSpace30,
                  AppInputField(
                    controller: _loginController.password,
                    headingText: "Password",
                  ),
                  AppPaddings.heigthSpace10,
                  Align(
                    alignment: Alignment.topRight,
                    child: InkWell(
                      onTap: () {
                        Get.off(
                          () => EmailCheck(),
                        );
                      },
                      child: AppText(
                        text: "Forget passsword",
                        fontSize: 15,
                        fontWeight: FontWeight.w600,
                        textColor: AppColors.primaryColor,
                      ),
                    ),
                  ),
                  AppPaddings.heigthSpace20,
                  AppButton(
                    onTap: () {
                      _loginController.isValidUser();
                    },
                    childText: "Signin",
                  ),
                  AppPaddings.heigthSpace10,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      AppText(
                        text: "Don't have an account?",
                        fontSize: 15,
                        fontWeight: FontWeight.w500,
                        textColor: Colors.grey,
                      ),
                      InkWell(
                        onTap: () {
                          Get.off(
                            () => Signup(),
                          );
                        },
                        child: AppText(
                          text: "Register",
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
