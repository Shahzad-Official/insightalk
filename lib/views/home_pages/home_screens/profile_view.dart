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
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        SizedBox(
          height: size.height * 0.45,
          width: double.infinity,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 10.0,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      AppPaddings.heigthSpace30,
                      const AppText(
                        text: "Rank",
                        fontSize: 24,
                        fontWeight: FontWeight.w700,
                      ),
                      AppPaddings.heigthSpace10,
                      Expanded(
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            border: Border.all(
                              color: AppColors.primaryColor,
                            ),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(15.0),
                            child: Column(
                              children: [
                                RoundButton(
                                  width: 150,
                                  leftIcon: Image.asset("assets/empathic.png"),
                                  spaceinIcon: 5,
                                  childText: "Empathic",
                                  fontSize: 12,
                                  rightIcon: const Padding(
                                    padding: EdgeInsets.only(left: 12.0),
                                    child: AppText(
                                      text: "1x",
                                      fontSize: 12,
                                      fontWeight: FontWeight.w700,
                                      textColor: AppColors.primaryColor,
                                    ),
                                  ),
                                ),
                                AppPaddings.heigthSpace20,
                                RoundButton(
                                  width: 150,
                                  leftIcon: Image.asset("assets/sweet.png"),
                                  spaceinIcon: 5,
                                  childText: "Sweet",
                                  fontSize: 12,
                                  rightIcon: const Padding(
                                    padding: EdgeInsets.only(left: 12.0),
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
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Expanded(
                child: Container(
                  margin: const EdgeInsets.only(
                    left: 10,
                  ),
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                      fit: BoxFit.cover,
                      image: AssetImage("assets/profile_bg.png"),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        const Divider(
          color: AppColors.primaryColor,
          thickness: 1.3,
        ),
        SizedBox(
          height: size.height * 0.35,
          width: size.width,
          child: Padding(
            padding: AppPaddings.defaultPadding,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
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
                      height: 45,
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
                Container(
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(
                      color: AppColors.primaryColor,
                    ),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
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
                    ],
                  ),
                ),
                AppPaddings.heigthSpace20,
              ],
            ),
          ),
        ),
      ],
    );
  }
}
