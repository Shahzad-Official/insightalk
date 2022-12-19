import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:insightalk/constants/app_colors.dart';
import 'package:insightalk/views/chat_screen/chat_screen.dart';
import 'package:insightalk/views/profile_view/profile_view.dart';
import 'package:insightalk/views/register_screens/forget_password.dart';
import 'package:insightalk/views/register_screens/login.dart';
import 'package:insightalk/views/register_screens/signup.dart';
import 'package:insightalk/views/splash_screen.dart';
import 'package:insightalk/views/update_profile/update_profile.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'InsighTalk',
      theme: ThemeData(
        primarySwatch: AppColors().customMaterialColor(),
      ),
      home: ChatScreen(
        lastSeen: "lastSeen 3.04pm",
        profileName: "Jahaaz",
      ),
    );
  }
}
