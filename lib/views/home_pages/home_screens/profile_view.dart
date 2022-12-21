import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:insightalk/constants/app_colors.dart';
import 'package:insightalk/constants/app_paddings.dart';
import 'package:insightalk/views/update_profile/update_profile.dart';
import 'package:insightalk/widgets/app_buttons.dart';
import 'package:insightalk/widgets/app_text.dart';

class ProfileView extends StatelessWidget {
  final String profileName, profileEmail;
  const ProfileView({
    Key? key,
    this.profileName = "Jessica Parker",
    this.profileEmail = "Jessica@gmail.com",
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Stack(
      children: [
        Align(
          alignment: Alignment.topCenter,
          child: Container(
            height: size.height * 0.6,
            width: size.width,
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/profile_bg.png"),
                fit: BoxFit.fitHeight,
              ),
            ),
          ),
        ),
        Align(
          alignment: Alignment.bottomCenter,
          child: Container(
            height: size.height * 0.5,
            width: size.width,
            decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(30),
                topRight: Radius.circular(30),
              ),
            ),
            child: Padding(
              padding: AppPaddings.defaultPadding,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  AppPaddings.heigthSpace20,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        children: [
                          AppText(
                            text: profileName,
                            fontSize: 20,
                            fontWeight: FontWeight.w700,
                          ),
                          AppText(
                            text: profileEmail,
                            fontSize: 12,
                            fontWeight: FontWeight.w400,
                          ),
                        ],
                      ),
                      AppButton(
                        onTap: () {
                          Get.to(
                            () => UpdateProfile(),
                          );
                        },
                        width: 120,
                        childText: "Edit Profile",
                      ),
                    ],
                  ),
                  AppPaddings.heigthSpace30,
                  AppText(
                    text: "About",
                    fontSize: 15,
                    fontWeight: FontWeight.w700,
                    lineHeight: 2,
                  ),
                  AppText(
                    lineHeight: 1.5,
                    text:
                        "My name is Jessica Parker and I enjoy meeting new people and finding ways to help them have an uplifting experience. I enjoy reading..",
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                  ),
                  AppPaddings.heigthSpace20,
                  AppText(
                    text: "Achievements",
                    fontSize: 15,
                    fontWeight: FontWeight.w700,
                    lineHeight: 2,
                  ),
                  AppPaddings.heigthSpace10,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      RoundButton(
                        width: 150,
                        leftIcon: Image.asset("assets/empathic.png"),
                        spaceinIcon: 5,
                        childText: "Empathic",
                        fontSize: 12,
                        rightIcon: Padding(
                          padding: const EdgeInsets.only(left: 12.0),
                          child: AppText(
                            text: "1x",
                            fontSize: 12,
                            fontWeight: FontWeight.w700,
                            textColor: AppColors.primaryColor,
                          ),
                        ),
                      ),
                      RoundButton(
                        width: 150,
                        leftIcon: Image.asset("assets/sweet.png"),
                        spaceinIcon: 5,
                        childText: "Sweet",
                        fontSize: 12,
                        rightIcon: Padding(
                          padding: const EdgeInsets.only(left: 12.0),
                          child: AppText(
                            text: "2x",
                            fontSize: 12,
                            fontWeight: FontWeight.w700,
                            textColor: AppColors.primaryColor,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
