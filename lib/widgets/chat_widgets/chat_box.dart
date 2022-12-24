import 'dart:io';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:insightalk/constants/app_colors.dart';
import 'package:insightalk/widgets/app_text.dart';
import 'package:intl/intl.dart';

class ChatBox extends StatelessWidget {
  bool isSender;
  String msg, time;
  File? imageFile;
  bool isImage;
  ChatBox({
    Key? key,
    this.isSender = true,
    required this.msg,
    required this.time,
    this.isImage = false,
    this.imageFile,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    time = DateFormat.jm().format(
      DateTime.now(),
    );
    return Align(
      alignment: isSender ? Alignment.centerRight : Alignment.centerLeft,
      child: Container(
        constraints: BoxConstraints(
          maxWidth: MediaQuery.of(context).size.width * 0.7,
        ),
        padding: const EdgeInsets.symmetric(
          horizontal: 15.0,
          vertical: 8,
        ),
        margin: const EdgeInsets.only(
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
    );
  }
}
