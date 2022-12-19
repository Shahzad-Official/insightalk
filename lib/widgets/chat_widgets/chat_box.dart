import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:insightalk/constants/app_colors.dart';
import 'package:insightalk/widgets/app_text.dart';

class ChatBox extends StatelessWidget {
  bool isSender;
  String msg, time;
  ChatBox({
    Key? key,
    this.isSender = true,
    required this.msg,
    required this.time,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: isSender ? Alignment.centerRight : Alignment.centerLeft,
      child: Container(
        constraints: BoxConstraints(
          maxWidth: MediaQuery.of(context).size.width * 0.9,
        ),
        padding: const EdgeInsets.symmetric(
          horizontal: 15.0,
          vertical: 8,
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
        child: Wrap(
          spacing: 5,
          direction: Axis.vertical,
          children: [
            Padding(
              padding: const EdgeInsets.only(right: 18.0),
              child: AppText(
                text: msg,
                fontSize: 16,
                fontWeight: FontWeight.w500,
                textColor: isSender ? Colors.white : AppColors.primaryColor,
              ),
            ),
            Align(
              alignment: Alignment.bottomRight,
              child: AppText(
                lineHeight: 1.5,
                text: time,
                fontSize: 10,
                fontWeight: FontWeight.w500,
                textColor: isSender ? Colors.white : AppColors.primaryColor,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
