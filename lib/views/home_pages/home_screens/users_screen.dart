import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:insightalk/controllers/home_screens_controllers/users_screen_controller.dart';
import 'package:insightalk/widgets/app_text.dart';

import '../../../constants/app_colors.dart';
import '../../../constants/app_paddings.dart';
import '../../../constants/dummy_images.dart';

class UsersScreen extends StatelessWidget {
  const UsersScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: AppPaddings.defaultPadding,
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            AppPaddings.heigthSpace30,
            GetBuilder<UsersScreenController>(
              init: UsersScreenController(),
              builder: (_) {
                return AppText(
                  text: _.selectedUserCat,
                  fontSize: 24,
                  fontWeight: FontWeight.w700,
                );
              },
            ),
            AppPaddings.heigthSpace30,
            Row(
              children: [
                Container(
                  height: 50,
                  width: 120,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    color: AppColors.primaryColor,
                    boxShadow: [
                      BoxShadow(
                        color: AppColors.primaryColor.withOpacity(0.5),
                        blurRadius: 10,
                        spreadRadius: 1.2,
                        offset: const Offset(2, 2),
                      ),
                    ],
                  ),
                  child: GetBuilder<UsersScreenController>(
                    init: UsersScreenController(),
                    builder: (_) {
                      return DropdownButtonFormField(
                        dropdownColor: AppColors.primaryColor,
                        borderRadius: BorderRadius.circular(10),
                        icon: const Icon(
                          Icons.keyboard_arrow_down_rounded,
                          color: Colors.white,
                        ),
                        value: _.selectedUserCat,
                        items: _.usersCategory.map((e) {
                          return DropdownMenuItem(
                            value: e,
                            child: AppText(
                              text: e,
                              fontSize: 15,
                              fontWeight: FontWeight.w500,
                              textColor: Colors.white,
                            ),
                          );
                        }).toList(),
                        onChanged: (value) {
                          _.changeCat(value);
                        },
                        decoration: const InputDecoration(
                          contentPadding: EdgeInsets.symmetric(
                            horizontal: 15,
                          ),
                          border: InputBorder.none,
                        ),
                      );
                    },
                  ),
                ),
                const Spacer(),
                Row(
                  children: [
                    const AppText(
                      text: "Monthly",
                      fontWeight: FontWeight.w600,
                      fontSize: 12,
                    ),
                    Transform.scale(
                      scale: 0.7,
                      child: GetBuilder<UsersScreenController>(
                        init: UsersScreenController(),
                        builder: (_) {
                          return CupertinoSwitch(
                            trackColor: Colors.grey,
                            activeColor: AppColors.primaryColor,
                            value: _.selectedVal,
                            onChanged: (value) {
                              _.changeValue(value);
                            },
                          );
                        },
                      ),
                    ),
                    const AppText(
                      text: "Weekly",
                      fontWeight: FontWeight.w600,
                      fontSize: 12,
                    ),
                  ],
                ),
              ],
            ),
            AppPaddings.heigthSpace30,
            GridView.builder(
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemCount: DummyImages.networkImages.length,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                childAspectRatio: 0.7,
                mainAxisSpacing: 20,
                crossAxisSpacing: 20,
              ),
              itemBuilder: (context, index) {
                return CachedNetworkImage(
                  imageUrl: DummyImages.networkImages[index],
                  placeholder: (context, url) {
                    return const SpinKitThreeBounce(
                      color: AppColors.primaryColor,
                      size: 30,
                    );
                  },
                  imageBuilder: (context, imageProvider) {
                    return Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        color: AppColors.primaryColor.withOpacity(0.5),
                        image: DecorationImage(
                          image: NetworkImage(
                            DummyImages.networkImages[index],
                          ),
                          fit: BoxFit.cover,
                        ),
                      ),
                      child: Align(
                        alignment: Alignment.bottomCenter,
                        child: Container(
                          height: 30,
                          decoration: BoxDecoration(
                            color: Colors.black.withOpacity(0.8),
                            borderRadius: const BorderRadius.only(
                              bottomLeft: Radius.circular(15),
                              bottomRight: Radius.circular(15),
                            ),
                          ),
                          child: Center(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                const AppText(
                                  text: "1 . Lis sa",
                                  fontSize: 10,
                                  fontWeight: FontWeight.w600,
                                  textColor: Colors.white,
                                ),
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 5.0),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    children: const [
                                      AppText(
                                        text: "😊 1x",
                                        fontSize: 10,
                                        fontWeight: FontWeight.w600,
                                        textColor: Colors.white,
                                      ),
                                      AppText(
                                        text: "😊 1x",
                                        fontSize: 10,
                                        fontWeight: FontWeight.w600,
                                        textColor: Colors.white,
                                      ),
                                      AppText(
                                        text: "😊 1x",
                                        fontSize: 10,
                                        fontWeight: FontWeight.w600,
                                        textColor: Colors.white,
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
                  },
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
