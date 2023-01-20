import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:insightalk/constants/app_colors.dart';
import 'package:insightalk/constants/dummy_images.dart';
import 'package:insightalk/widgets/app_listtile.dart';
import 'package:insightalk/widgets/app_text.dart';

import '../../constants/app_paddings.dart';
import '../../widgets/app_buttons.dart';
import '../../widgets/app_input_field.dart';

class FriendProfileView extends StatelessWidget {
  const FriendProfileView({
    Key? key,
    this.imageUrl,
    this.about,
    this.email,
    this.name,
  }) : super(key: key);

  final String? email, name, about, imageUrl;
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return ColoredBox(
      color: AppColors.primaryColor,
      child: SafeArea(
        child: Scaffold(
          body: Column(
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
                                        leftIcon:
                                            Image.asset("assets/empathic.png"),
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
                                        leftIcon:
                                            Image.asset("assets/sweet.png"),
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
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            fit: BoxFit.cover,
                            image: NetworkImage(
                                imageUrl ?? DummyImages.networkImages[0]),
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
                                text: name ?? "JohnDoe",
                                fontSize: 20,
                                fontWeight: FontWeight.w700,
                              ),
                              AppText(
                                text: email ?? "abc@gmail.com",
                                fontSize: 12,
                                fontWeight: FontWeight.w400,
                              ),
                            ],
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
          ),
        ),
      ),
    );
  }
}
