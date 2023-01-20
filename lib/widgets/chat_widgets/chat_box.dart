import 'dart:io';

import 'package:flutter/material.dart';
import 'package:insightalk/constants/app_colors.dart';
import 'package:insightalk/widgets/app_text.dart';

class ChatBox extends StatelessWidget {
  final bool isSender;
  final String msg, time;
  final File? imageFile;
  final bool isImage;
  final ImageProvider? userImage;
  const ChatBox({
    Key? key,
    this.isSender = true,
    required this.msg,
    required this.time,
    this.isImage = false,
    this.imageFile,
    this.userImage,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        userImage != null
            ? Align(
                alignment:
                    isSender ? Alignment.centerRight : Alignment.centerLeft,
                child: Container(
                  margin: const EdgeInsets.only(top: 10),
                  height: 50,
                  width: 50,
                  decoration: BoxDecoration(
                    color: AppColors.primaryColor,
                    border: Border.all(
                      color: AppColors.primaryColor,
                      width: 2,
                    ),
                    image:
                        DecorationImage(image: userImage!, fit: BoxFit.cover),
                    shape: BoxShape.circle,
                  ),
                ),
              )
            : const SizedBox(),
        Align(
          alignment: isSender ? Alignment.centerRight : Alignment.centerLeft,
          child: Container(
            constraints: BoxConstraints(
              maxWidth: MediaQuery.of(context).size.width * 0.7,
            ),
            padding: const EdgeInsets.symmetric(
              horizontal: 15.0,
              vertical: 8,
            ),
            margin: userImage != null
                ? EdgeInsets.only(
                    left: isSender ? 0 : 60,
                    right: isSender ? 60 : 0,
                    bottom: 20,
                  )
                : const EdgeInsets.only(
                    bottom: 20,
                  ),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(25),
              color: isSender ? AppColors.primaryColor : Colors.white,
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.2),
                  blurRadius: 15,
                  spreadRadius: 2,
                  offset: const Offset(
                    1,
                    4,
                  ),
                ),
              ],
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                isImage
                    ? Image.file(imageFile!)
                    : Padding(
                        padding: const EdgeInsets.only(right: 18.0),
                        child: AppText(
                          text: msg,
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                          textColor:
                              isSender ? Colors.white : AppColors.primaryColor,
                        ),
                      ),
                AppText(
                  lineHeight: 1.5,
                  text: time,
                  fontSize: 10,
                  fontWeight: FontWeight.w500,
                  textColor: isSender ? Colors.white : AppColors.primaryColor,
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
