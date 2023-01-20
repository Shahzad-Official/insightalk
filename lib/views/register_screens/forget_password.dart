import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:insightalk/constants/app_colors.dart';
import 'package:insightalk/controllers/registration_controllers/forget_password_controller.dart';
import 'package:insightalk/widgets/app_text.dart';

import '../../constants/app_paddings.dart';
import '../../widgets/app_buttons.dart';
import '../../widgets/app_input_field.dart';

class ForgetPassword extends StatelessWidget {
  ForgetPassword({Key? key}) : super(key: key);
  final ForgetPasswordController _passwordController =
      Get.put(ForgetPasswordController());

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
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const AppText(
                      text: "Reset password",
                      fontSize: 27,
                      fontWeight: FontWeight.w600,
                    ),
                    const AppText(
                      text:
                          "Please enter your new password  and confirm that new password.",
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                      textColor: Colors.grey,
                    ),
                    AppPaddings.heigthSpace30,
                    AppInputField(
                      controller: _passwordController.password,
                      headingText: "New Password",
                    ),
                    AppPaddings.heigthSpace30,
                    AppInputField(
                      controller: _passwordController.confirmPassword,
                      headingText: "Confirm New Password",
                    ),
                    AppPaddings.heigthSpace30,
                    AppPaddings.heigthSpace30,
                    AppButton(
                      onTap: () {
                        _passwordController.isValid();
                      },
                      childText: "Update Password",
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
