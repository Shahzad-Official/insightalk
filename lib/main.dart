import 'package:emoji_picker_flutter/emoji_picker_flutter.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:insightalk/constants/app_colors.dart';
import 'package:insightalk/views/chat_screen/chat_screen.dart';
import 'package:insightalk/views/home_pages/home_screen.dart';
import 'package:insightalk/views/splash_screen.dart';
import 'package:insightalk/widgets/app_text.dart';
import 'package:insightalk/widgets/chat_widgets/chat_box.dart';
import 'package:intl/intl.dart';
import 'package:numberpicker/numberpicker.dart';

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
      // home: Main(),
      home: ChatScreen(
        lastSeen: "20 min ago",
        profileName: "shado",
      ),
    );
  }
}

class Main extends StatefulWidget {
  const Main({Key? key}) : super(key: key);

  @override
  State<Main> createState() => _MainState();
}

class _MainState extends State<Main> {
  int currentValue = 0;
  String emojiText = 'hello';
  @override
  Widget build(BuildContext context) {
    double x = currentIndex.toDouble();
    return SafeArea(
      child: Scaffold(
        body: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                AppText(
                  text: "Horizontal Number Picker",
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  textColor: AppColors.primaryColor,
                ),
                const SizedBox(
                  height: 20,
                ),
                NumberPicker(
                  axis: Axis.horizontal,
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: AppColors.primaryColor,
                    ),
                    borderRadius: BorderRadius.circular(15),
                  ),
                  minValue: 0,
                  maxValue: 100,
                  value: currentValue,
                  onChanged: (value) {
                    currentValue = value;
                    setState(() {});
                  },
                ),
                const SizedBox(
                  height: 20,
                ),
                AppText(
                  text: "Vertical Number Picker",
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  textColor: AppColors.primaryColor,
                ),
                const SizedBox(
                  height: 20,
                ),
                NumberPicker(
                  axis: Axis.vertical,
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: AppColors.primaryColor,
                    ),
                    borderRadius: BorderRadius.circular(15),
                  ),
                  minValue: 0,
                  maxValue: 100,
                  value: currentValue,
                  onChanged: (value) {
                    currentValue = value;
                    setState(() {});
                  },
                ),
                const SizedBox(
                  height: 25,
                ),
                AppText(
                  text: emojiText,
                  fontSize: 25,
                ),
                SizedBox(
                  height: 80,
                  child: Stack(
                    children: [
                      Align(
                        alignment: Alignment.bottomCenter,
                        child: Container(
                          color: Colors.amber,
                          height: 55,
                          width: Get.width,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: List.generate(
                              4,
                              (index) => InkWell(
                                onTap: () {
                                  currentIndex = index;
                                  setState(() {});
                                },
                                child: SizedBox(
                                  width: 50,
                                  child: Column(
                                    mainAxisAlignment: index == currentIndex
                                        ? MainAxisAlignment.end
                                        : MainAxisAlignment.center,
                                    children: [
                                      index == currentIndex
                                          ? const SizedBox()
                                          : const Icon(
                                              Icons.home,
                                              color: Colors.white,
                                            ),
                                      index != currentIndex
                                          ? const SizedBox()
                                          : Padding(
                                              padding: const EdgeInsets.only(
                                                bottom: 5,
                                              ),
                                              child: AppText(
                                                text: "label",
                                              ),
                                            ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                      Align(
                        alignment: Alignment.topCenter,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: List.generate(
                            4,
                            (index) => index == currentIndex
                                ? Container(
                                    height: 50,
                                    width: 50,
                                    decoration: const BoxDecoration(
                                      color: Colors.brown,
                                      shape: BoxShape.circle,
                                    ),
                                    child: const Center(
                                      child: Icon(
                                        Icons.holiday_village,
                                        color: Colors.white,
                                      ),
                                    ),
                                  )
                                : const SizedBox(
                                    height: 50,
                                    width: 50,
                                  ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  int currentIndex = 0;
}
