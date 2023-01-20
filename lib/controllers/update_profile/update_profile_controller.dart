import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:insightalk/views/home_pages/home_screen.dart';

import '../../constants/app_colors.dart';

class UpdateProfileController extends GetxController {
  TextEditingController email = TextEditingController();

  TextEditingController name = TextEditingController();
  TextEditingController about = TextEditingController();

  TextEditingController password = TextEditingController();
  TextEditingController confirmPassword = TextEditingController();
  String? imagePath;

  picknewImage() async {
    XFile? res = await ImagePicker.platform.getImage(
      source: ImageSource.gallery,
    );
    if (res != null) {
      imagePath = res.path;
    } else {}
    update();
  }

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

  userInfo() {
    name.text = "tanvesh padyal";
    email.text = "abc@gamil.com";
    about.text = "My name is Jessica Parker and I enjoy ...";
    password.text = "Sh@123456";
    confirmPassword.text = "Sh@123456";
  }

  isValidInfo() {
    if (!isEmailValid(email.text)) {
      Get.snackbar(
        "Error",
        "Email is invalid\nEmail must be like:- abc@gmail.com",
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
    } else {
      Get.offAll(() => const HomeScreen());
    }
  }

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    userInfo();
  }
}
