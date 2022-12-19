import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:insightalk/constants/app_colors.dart';
import 'package:insightalk/constants/svgs.dart';
import 'package:insightalk/widgets/app_input_field.dart';

class SendChat extends StatelessWidget {
  TextEditingController? msgController;
  SendChat({
    Key? key,
    this.msgController,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          flex: 5,
          child: Container(
            decoration: BoxDecoration(
              gradient: const LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Color(0xffDBDBDB),
                  Color(0xffF3F3F3),
                ],
              ),
              borderRadius: BorderRadius.circular(30),
            ),
            child: TextFormField(
              controller: msgController,
              decoration: InputDecoration(
                border: InputBorder.none,
                prefixIcon: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: SvgPicture.string(
                    SvgIcons.smile,
                  ),
                ),
                suffixIcon: Container(
                  padding: const EdgeInsets.only(
                    right: 10,
                  ),
                  margin: const EdgeInsets.only(
                    right: 5,
                  ),
                  child: SvgPicture.string(
                    SvgIcons.camera,
                  ),
                ),
              ),
            ),
          ),
        ),
        Expanded(
          child: CircleAvatar(
            backgroundColor: AppColors.primaryColor,
            radius: 25,
            child: SvgPicture.string(
              SvgIcons.mic,
            ),
          ),
        ),
      ],
    );
  }
}
