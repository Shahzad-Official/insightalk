import 'package:emoji_picker_flutter/emoji_picker_flutter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:insightalk/constants/svgs.dart';
import 'package:insightalk/controllers/chat_controllers/group_chat_controller.dart';
import 'package:insightalk/views/chat_screen/chat_screen.dart';
import 'package:insightalk/views/chat_screen/rate_group_chat.dart';
import 'package:insightalk/widgets/app_buttons.dart';
import 'package:insightalk/widgets/app_text.dart';

import '../../constants/app_colors.dart';
import '../../constants/app_paddings.dart';
import '../../widgets/chat_widgets/chat_box.dart';
import '../../widgets/chat_widgets/send_chat.dart';
import '../../widgets/link_widget.dart';

class GroupChatScreen extends StatelessWidget {
  const GroupChatScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ColoredBox(
      color: AppColors.primaryColor,
      child: SafeArea(
        child: Scaffold(
          body: Stack(
            children: [
              SingleChildScrollView(
                child: Column(
                  children: [
                    Container(
                      padding: const EdgeInsets.all(15),
                      width: double.infinity,
                      height: MediaQuery.of(context).size.height * 0.5,
                      child: Column(
                        children: [
                          Expanded(
                            child: Row(
                              children: [
                                Expanded(
                                  flex: 4,
                                  child: Stack(
                                    children: [
                                      const LinkWidget(),
                                      Row(
                                        children: [
                                          Expanded(
                                            child: Column(
                                              children: [
                                                AppPaddings.heigthSpace20,
                                                Expanded(
                                                  child: Container(
                                                    margin:
                                                        const EdgeInsets.only(
                                                            right: 17),
                                                    decoration: BoxDecoration(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              15),
                                                      border: Border.all(
                                                          color: AppColors
                                                              .primaryColor,
                                                          width: 2),
                                                      image:
                                                          const DecorationImage(
                                                        image: AssetImage(
                                                          "assets/girl1.jpg",
                                                        ),
                                                        fit: BoxFit.cover,
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                                AppPaddings.heigthSpace20,
                                                const AppText(
                                                  text: "Elsa",
                                                  fontSize: 16,
                                                  fontWeight: FontWeight.w600,
                                                ),
                                              ],
                                            ),
                                          ),
                                          Expanded(
                                            child: Column(
                                              children: [
                                                AppPaddings.heigthSpace20,
                                                Expanded(
                                                  child: Container(
                                                    margin:
                                                        const EdgeInsets.only(
                                                            left: 17),
                                                    decoration: BoxDecoration(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              15),
                                                      border: Border.all(
                                                          color: AppColors
                                                              .primaryColor,
                                                          width: 2),
                                                      image:
                                                          const DecorationImage(
                                                        image: AssetImage(
                                                          "assets/girl3.jpg",
                                                        ),
                                                        fit: BoxFit.cover,
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                                AppPaddings.heigthSpace20,
                                                const AppText(
                                                  text: "John Doe",
                                                  fontSize: 16,
                                                  fontWeight: FontWeight.w600,
                                                ),
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                                Expanded(
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      RoundButton(
                                        onTap: () =>
                                            Get.to(() => RateGroupChat()),
                                        borderColor: Colors.transparent,
                                        height: 45,
                                        width: 40,
                                        childText: "",
                                        color: AppColors.primaryColor
                                            .withOpacity(0.3),
                                        child: Padding(
                                          padding: const EdgeInsets.all(10.0),
                                          child: SvgPicture.string(
                                            SvgIcons.exclamation,
                                          ),
                                        ),
                                      ),
                                      AppPaddings.heigthSpace30,
                                      RoundButton(
                                        onTap: () => Get.to(
                                          () => const ChatScreen(
                                              lastSeen: "10:pm",
                                              profileName: "John Doe"),
                                        ),
                                        borderColor: Colors.transparent,
                                        height: 45,
                                        width: 40,
                                        childText: "",
                                        color: AppColors.primaryColor
                                            .withOpacity(0.3),
                                        child: Padding(
                                          padding: const EdgeInsets.all(5.0),
                                          child: SvgPicture.string(
                                            SvgIcons.friendRequest,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Align(
                            alignment: Alignment.centerRight,
                            child: Padding(
                              padding: const EdgeInsets.only(top: 20.0),
                              child: AppButton(
                                onTap: () => Get.to(
                                  () => RateGroupChat(),
                                ),
                                childText: "End Chat",
                                width: 150,
                                height: 45,
                              ),
                            ),
                          ),
                          AppPaddings.heigthSpace20,
                          const Divider(
                            color: AppColors.primaryColor,
                            thickness: 2,
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: AppPaddings.defaultPadding,
                      child: Column(
                        children: [
                          AppPaddings.heigthSpace20,
                          GetBuilder<GroupChatController>(
                            init: GroupChatController(),
                            builder: (_) {
                              return ListView.builder(
                                physics: const NeverScrollableScrollPhysics(),
                                shrinkWrap: true,
                                itemCount: _.allMessages.length,
                                itemBuilder: (context, index) {
                                  return ChatBox(
                                    userImage: index.isEven
                                        ? const AssetImage("assets/girl2.png")
                                        : const AssetImage('assets/girl3.jpg'),
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
                  ],
                ),
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: Padding(
                  padding: const EdgeInsets.all(10),
                  child: GetBuilder<GroupChatController>(
                    init: GroupChatController(),
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
