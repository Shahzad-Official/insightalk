import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../constants/app_colors.dart';

class SignupController extends GetxController {
  TextEditingController email = TextEditingController();

  TextEditingController name = TextEditingController();

  TextEditingController password = TextEditingController();
  TextEditingController confirmPassword = TextEditingController();
  String? phoneNo;
  String otp = '';
  bool checkValue = false;
  changeCheckValue(value) {
    checkValue = value;
    update();
  }

  bool isloading = false;

  bool isEmailValid(String email) {
    String exp =
        r'^(([^<>()[\]\\.,;:\s@"]+(\.[^<>()[\]\\.,;:\s@"]+)*)|(".+"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';

    RegExp regExp = RegExp(exp);
    return regExp.hasMatch(email);
  }

  bool ispasswordvalid(String password) {
    String exp =
        r'^(?=.*[A-Za-z])(?=.*\d)(?=.*[@$!%*#?&])[A-Za-z\d@$!%*#?&]{8,}$';

    RegExp regExp = RegExp(exp);
    return regExp.hasMatch(password);
  }

  isValidUser() async {
    if (name.text.trim().isEmpty) {
      Get.snackbar(
        "Error",
        "Name should not be empty",
        colorText: Colors.white,
        backgroundColor: AppColors.primaryColor,
      );
    } else if (email.text.trim().isEmpty) {
      Get.snackbar(
        "Error",
        "Email should not be empty",
        colorText: Colors.white,
        backgroundColor: AppColors.primaryColor,
      );
    } else if (!isEmailValid(email.text)) {
      Get.snackbar(
        "Error",
        "Email is invalid\nEmail must be like:- abc@gmail.com",
        colorText: Colors.white,
        backgroundColor: AppColors.primaryColor,
      );
    } else if (password.text.trim().isEmpty) {
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
