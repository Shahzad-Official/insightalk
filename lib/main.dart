import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:insightalk/constants/app_colors.dart';
import 'package:insightalk/views/chat_screen/chat_screen.dart';

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
