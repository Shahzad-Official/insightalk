import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:insightalk/constants/app_colors.dart';
import 'package:insightalk/constants/svgs.dart';

// ignore: must_be_immutable
class SendChat extends StatefulWidget {
  TextEditingController? msgController;
  Function sendMessage, voiceRecord;
  bool isRecording;
  SendChat({
    Key? key,
    this.msgController,
    required this.sendMessage,
    required this.voiceRecord,
    this.isRecording = false,
  }) : super(key: key);

  @override
  State<SendChat> createState() => _SendChatState();
}

class _SendChatState extends State<SendChat> {
  bool isFocused = false;
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
              onFocusChange: (value) {
                setState(() {
                  isFocused = value;
                });
              },
              child: TextFormField(
                controller: widget.msgController,
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
        ),
        Expanded(
          child: InkWell(
            onTap: () {
              if (isFocused) {
                widget.sendMessage();
              } else {
                widget.voiceRecord();
              }
            },
            child: CircleAvatar(
              backgroundColor: AppColors.primaryColor,
              radius: 25,
              child: isFocused || widget.isRecording
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
