import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:insightalk/constants/app_colors.dart';
import 'package:insightalk/constants/app_paddings.dart';
import 'package:insightalk/views/register_screens/login.dart';
import 'package:insightalk/views/register_screens/signup.dart';
import 'package:insightalk/widgets/app_buttons.dart';
import 'package:insightalk/widgets/app_text.dart';

class OnBoardingPage extends StatefulWidget {
  const OnBoardingPage({Key? key}) : super(key: key);

  @override
  State<OnBoardingPage> createState() => _OnBoardingPageState();
}

class _OnBoardingPageState extends State<OnBoardingPage> {
  int selectedIndex = 0;
  final controller = PageController(viewportFraction: 0.8, keepPage: true);

  final List<String> imgList = [
    'assets/girl2.png',
    'assets/girl1.jpg',
    'assets/girl3.jpg',
  ];

  @override
  Widget build(BuildContext context) {
    return ColoredBox(
      color: AppColors.primaryColor,
      child: SafeArea(
        child: Scaffold(
          body: SingleChildScrollView(
            child: Column(
              children: [
                AppPaddings.heigthSpace30,
                CarouselSlider(
                  items: imgList
                      .map(
                        (item) => Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            color: Colors.amber,
                            image: DecorationImage(
                              fit: BoxFit.cover,
                              image: AssetImage(item),
                            ),
                          ),
                          margin: const EdgeInsets.symmetric(
                            horizontal: 8.0,
                          ),
                        ),
                      )
                      .toList(),
                  options: CarouselOptions(
                    onPageChanged: (index, reason) {
                      setState(() {
                        selectedIndex = index;
                      });
                    },
                    enableInfiniteScroll: true,
                    autoPlay: true,
                    height: 400,
                    enlargeCenterPage: true,
                    enlargeStrategy: CenterPageEnlargeStrategy.height,
                  ),
                ),
                AppPaddings.heigthSpace30,
                const AppText(
                  text: "Insightalk",
                  fontSize: 24,
                  fontWeight: FontWeight.w700,
                  textColor: AppColors.primaryColor,
                ),
                AppPaddings.heigthSpace30,
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 50.0),
                  child: AppText(
                    text:
                        "Where conversations that were good for you, take place.",
                    textAlign: TextAlign.center,
                  ),
                ),
                AppPaddings.heigthSpace30,
                SizedBox(
                  height: 40,
                  width: 60,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: List.generate(
                      imgList.length,
                      (index) {
                        return Container(
                          height: 10,
                          width: 10,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: selectedIndex == index
                                ? AppColors.primaryColor
                                : Colors.grey,
                          ),
                        );
                      },
                    ),
                  ),
                ),
                AppPaddings.heigthSpace20,
                Padding(
                  padding: AppPaddings.defaultPadding,
                  child: Column(
                    children: [
                      AppButton(
                        childText: "Create Account",
                        onTap: () => Get.off(
                          () => Signup(),
                        ),
                      ),
                      AppPaddings.heigthSpace20,
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
              ],
            ),
          ),
        ),
      ),
    );
  }
}
