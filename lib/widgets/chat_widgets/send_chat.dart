import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:insightalk/constants/app_colors.dart';
import 'package:insightalk/constants/svgs.dart';

class SendChat extends StatelessWidget {
  final TextEditingController? msgController;
  final Function sendMessage, voiceRecord;
  final bool isRecording;
  final VoidCallback? selectEmoji, onCameraOpen;
  final void Function(bool value)? onFocusChage;
  final bool isFocused;
  const SendChat({
    Key? key,
    this.msgController,
    required this.sendMessage,
    required this.voiceRecord,
    this.isRecording = false,
    this.selectEmoji,
    this.isFocused = false,
    this.onFocusChage,
    this.onCameraOpen,
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
            child: Focus(
              onFocusChange: onFocusChage,
              child: TextFormField(
                controller: msgController,
                decoration: InputDecoration(
                  border: InputBorder.none,
                  prefixIcon: InkWell(
                    onTap: selectEmoji,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: SvgPicture.string(
                        SvgIcons.smile,
                      ),
                    ),
                  ),
                  suffixIcon: InkWell(
                    onTap: onCameraOpen,
                    child: Container(
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
          ),
        ),
        Expanded(
          child: InkWell(
            onTap: () {
              if (isFocused) {
                sendMessage();
              } else {
                voiceRecord();
              }
            },
            child: CircleAvatar(
              backgroundColor: AppColors.primaryColor,
              radius: 25,
              child: isFocused || isRecording
                  ? const Icon(
                      Icons.send_outlined,
                      color: Colors.white,
                    )
                  : SvgPicture.string(
                      SvgIcons.mic,
                    ),
            ),
          ),
        ),
      ],
    );
  }
}
