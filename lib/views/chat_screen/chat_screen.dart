import 'package:emoji_picker_flutter/emoji_picker_flutter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:insightalk/constants/app_colors.dart';
import 'package:insightalk/constants/app_paddings.dart';
import 'package:insightalk/constants/svgs.dart';
import 'package:insightalk/controllers/chat_controllers/chat_messages_controller.dart';
import 'package:insightalk/widgets/chat_widgets/chat_box.dart';
import 'package:insightalk/widgets/chat_widgets/send_chat.dart';

import '../../widgets/chat_widgets/chat_appbar.dart';

class ChatScreen extends StatelessWidget {
  final String imageUrl, profileName, lastSeen;
  final int msgLength;
  const ChatScreen({
    Key? key,
    required this.lastSeen,
    required this.profileName,
    this.msgLength = 20,
    this.imageUrl =
        "https://images.unsplash.com/photo-1557862921-37829c790f19?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=871&q=80",
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ColoredBox(
      color: AppColors.primaryColor,
      child: SafeArea(
        child: Scaffold(
          appBar: ChatAppBar(
            profileName: profileName,
            lastSeen: lastSeen,
            imageUrl: imageUrl,
            trailing: Padding(
              padding: const EdgeInsets.only(right: 15.0),
              child: SvgPicture.string(SvgIcons.deleteFriend),
            ),
          ),
          body: Stack(
            children: [
              SingleChildScrollView(
                child: Padding(
                  padding: AppPaddings.defaultPadding,
                  child: Column(
                    children: [
                      AppPaddings.heigthSpace20,
                      GetBuilder<ChatMessagesController>(
                        init: ChatMessagesController(),
                        builder: (_) {
                          return ListView.builder(
                            physics: const NeverScrollableScrollPhysics(),
                            shrinkWrap: true,
                            itemCount: _.allMessages.length,
                            itemBuilder: (context, index) {
                              return ChatBox(
                                isImage: false,
                                imageFile: _.imageFile,
                                isSender: index.isOdd ? false : true,
                                msg: _.allMessages[index],
                                time: "12.09pm",
                              );
                            },
                          );
                        },
                      ),
                      const SizedBox(
                        height: 40,
                      ),
                    ],
                  ),
                ),
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: Padding(
                  padding: const EdgeInsets.all(10),
                  child: GetBuilder<ChatMessagesController>(
                    init: ChatMessagesController(),
                    builder: (_) {
                      return Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          SendChat(
                            onCameraOpen: () async {
                              await _.openCamera();
                            },
                            isFocused: _.isFocused,
                            onFocusChage: (value) {
                              _.changeFocus(value);
                            },
                            selectEmoji: () {
                              _.selectEmoji(context);
                            },
                            isRecording: _.isRecording,
                            msgController: _.message,
                            sendMessage: () {
                              _.addMessage(context);
                            },
                            voiceRecord: () {
                              _.isRecordingaudio();
                              _.addImageToList();
                            },
                          ),
                          _.isSelected
                              ? SizedBox(
                                  height: 300,
                                  width: Get.width,
                                  child: EmojiPicker(
                                    textEditingController: _.message,
                                    onEmojiSelected: (category, emoji) {},
                                  ),
                                )
                              : Container(),
                        ],
                      );
                    },
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
