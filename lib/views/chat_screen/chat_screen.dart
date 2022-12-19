import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:insightalk/constants/app_colors.dart';
import 'package:insightalk/constants/app_paddings.dart';
import 'package:insightalk/widgets/app_text.dart';
import 'package:insightalk/widgets/chat_widgets/chat_box.dart';
import 'package:insightalk/widgets/chat_widgets/send_chat.dart';

import '../../widgets/chat_widgets/chat_appbar.dart';

class ChatScreen extends StatelessWidget {
  String imageUrl, profileName, lastSeen;
  int msgLength;
  ChatScreen({
    Key? key,
    required this.lastSeen,
    required this.profileName,
    this.msgLength = 10,
    this.imageUrl =
        "https://images.unsplash.com/photo-1557862921-37829c790f19?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=871&q=80",
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ColoredBox(
      color: AppColors.primaryColor,
      child: SafeArea(
        child: Scaffold(
          appBar: PreferredSize(
            preferredSize: const Size.fromHeight(70),
            child: ChatAppBar(
              profileName: profileName,
              lastSeen: lastSeen,
              imageUrl: imageUrl,
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
                      ListView.builder(
                        shrinkWrap: true,
                        itemCount: msgLength,
                        itemBuilder: (context, index) {
                          return ChatBox(
                            isSender: index.isOdd ? false : true,
                            msg: "msg",
                            time: "12.09pm",
                          );
                        },
                      ),
                    ],
                  ),
                ),
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: Padding(
                  padding: const EdgeInsets.all(10),
                  child: SendChat(),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
