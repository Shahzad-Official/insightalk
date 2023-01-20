import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:insightalk/constants/svgs.dart';
import 'package:insightalk/controllers/update_profile/update_profile_controller.dart';

import '../../constants/app_colors.dart';
import '../../constants/app_paddings.dart';
import '../../widgets/app_buttons.dart';
import '../../widgets/app_input_field.dart';
import 'package:cached_network_image/cached_network_image.dart';

class UpdateProfile extends StatelessWidget {
  final String imageUrl;
  UpdateProfile({
    Key? key,
    this.imageUrl =
        "https://images.unsplash.com/photo-1631947430066-48c30d57b943?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=416&q=80",
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
              child: GetBuilder<UpdateProfileController>(
                  init: UpdateProfileController(),
                  builder: (controller) {
                    return Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          width: 100,
                          height: 150,
                          padding: const EdgeInsets.all(5.0),
                          child: Stack(
                            children: [
                              CachedNetworkImage(
                                imageUrl: imageUrl,
                                imageBuilder: (context, imageProvider) {
                                  return Container(
                                    height: 150,
                                    width: 100,
                                    decoration: BoxDecoration(
                                      color: Colors.amber,
                                      image: DecorationImage(
                                        image: controller.imagePath == null
                                            ? imageProvider
                                            : FileImage(
                                                File(controller.imagePath!),
                                              ),
                                        fit: BoxFit.cover,
                                      ),
                                    ),
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
                                    height: 30,
                                    width: 30,
                                    margin: const EdgeInsets.only(
                                      right: 3,
                                      bottom: 3,
                                    ),
                                    decoration: BoxDecoration(
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
                                      padding: const EdgeInsets.all(7.0),
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
                          controller: _profileController.about,
                          headingText: "About",
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
                            _profileController.isValidInfo();
                          },
                          childText: "Save",
                        ),
                      ],
                    );
                  }),
            ),
          ),
        ),
      )),
    );
  }
}
