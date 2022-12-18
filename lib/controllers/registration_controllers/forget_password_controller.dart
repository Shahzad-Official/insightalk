import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../constants/app_colors.dart';

class ForgetPasswordController extends GetxController {
  TextEditingController password = TextEditingController();
  TextEditingController confirmPassword = TextEditingController();

  bool ispasswordvalid(String password) {
    String exp =
        r'^(?=.*[A-Za-z])(?=.*\d)(?=.*[@$!%*#?&])[A-Za-z\d@$!%*#?&]{8,}$';

    RegExp regExp = RegExp(exp);
    return regExp.hasMatch(password);
  }

  isValid() async {
    if (password.text.trim().isEmpty) {
      Get.snackbar(
        "Error",
        "Password should not be empty",
        colorText: Colors.white,
        backgroundColor: AppColors.primaryColor,
      );
    } else if (!ispasswordvalid(password.text)) {
      Get.snackbar(
        "Error",
        "Password should contain minimum 8 characters with alphabets,numeric and special characters",
        colorText: Colors.white,
        backgroundColor: AppColors.primaryColor,
      );
    } else if (password.text.trim().length < 6) {
      Get.snackbar(
        "Error",
        "Password length should be 6",
        colorText: Colors.white,
        backgroundColor: AppColors.primaryColor,
      );
    } else if (confirmPassword.text.trim() != password.text.trim()) {
      Get.snackbar(
        "Error",
        "Password Does not matched",
        colorText: Colors.white,
        backgroundColor: AppColors.primaryColor,
      );
    } else {}
  }
}
