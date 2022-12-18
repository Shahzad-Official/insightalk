import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:insightalk/constants/svgs.dart';
import 'package:insightalk/controllers/update_profile/update_profile_controller.dart';
import 'package:insightalk/widgets/app_text.dart';

import '../../constants/app_colors.dart';
import '../../constants/app_paddings.dart';
import '../../widgets/app_buttons.dart';
import '../../widgets/app_input_field.dart';
import 'package:cached_network_image/cached_network_image.dart';

class UpdateProfile extends StatelessWidget {
  String imageUrl;
  UpdateProfile({
    Key? key,
    this.imageUrl =
        "https://images.unsplash.com/photo-1557862921-37829c790f19?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=871&q=80",
  }) : super(key: key);
  final UpdateProfileController _profileController =
      Get.put(UpdateProfileController());
  @override
  Widget build(BuildContext context) {
    return ColoredBox(
      color: AppColors.primaryColor,
      child: SafeArea(
          child: Scaffold(
        body: Padding(
          padding: AppPaddings.defaultPadding,
          child: Center(
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    width: 150,
                    height: 150,
                    padding: const EdgeInsets.all(5.0),
                    child: Stack(
                      children: [
                        CachedNetworkImage(
                          imageUrl: imageUrl,
                          imageBuilder: (context, imageProvider) {
                            return CircleAvatar(
                              radius: 70,
                              backgroundImage: imageProvider,
                            );
                          },
                          errorWidget: (context, url, error) {
                            return const Center(
                              child: Icon(
                                Icons.error,
                              ),
                            );
                          },
                          progressIndicatorBuilder:
                              (context, url, downloadProgress) {
                            return CircularProgressIndicator(
                              value: downloadProgress.progress,
                            );
                          },
                        ),
                        Align(
                          alignment: Alignment.bottomRight,
                          child: InkWell(
                            onTap: () {
                              _profileController.picknewImage();
                            },
                            child: Container(
                              height: 40,
                              width: 40,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: Colors.white,
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.black.withOpacity(0.2),
                                    blurRadius: 15,
                                    spreadRadius: 1,
                                    offset: const Offset(2, 2),
                                  ),
                                ],
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(10.0),
                                child: SvgPicture.string(
                                  SvgIcons.pen,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  AppPaddings.heigthSpace30,
                  AppPaddings.heigthSpace30,
                  AppInputField(
                    controller: _profileController.name,
                    headingText: "Username",
                  ),
                  AppPaddings.heigthSpace30,
                  AppInputField(
                    controller: _profileController.email,
                    headingText: "Email",
                  ),
                  AppPaddings.heigthSpace30,
                  AppInputField(
                    controller: _profileController.password,
                    headingText: "Password",
                    obsecure: true,
                  ),
                  AppPaddings.heigthSpace30,
                  AppInputField(
                    controller: _profileController.confirmPassword,
                    obsecure: true,
                    headingText: "ConfirmPassword",
                    textInputAction: TextInputAction.done,
                  ),
                  AppPaddings.heigthSpace20,
                  AppPaddings.heigthSpace20,
                  AppButton(
                    onTap: () {
                      _profileController.isValidUser();
                    },
                    childText: "Save",
                  ),
                ],
              ),
            ),
          ),
        ),
      )),
    );
  }
}
