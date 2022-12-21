import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:insightalk/constants/app_colors.dart';
import 'package:insightalk/constants/app_paddings.dart';
import 'package:insightalk/constants/dummy_images.dart';
import 'package:insightalk/views/chat_screen/chat_screen.dart';
import 'package:insightalk/widgets/app_text.dart';

class FriendsScreen extends StatelessWidget {
  const FriendsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: DummyImages.networkImages.length,
      shrinkWrap: true,
      itemBuilder: (context, index) {
        return Padding(
          padding: AppPaddings.defaultPadding,
          child: Column(
            children: [
              ListTile(
                contentPadding: EdgeInsets.zero,
                focusColor: AppColors.primaryColor,
                hoverColor: AppColors.primaryColor,
                onTap: () {
                  Get.to(
                    () => ChatScreen(
                      imageUrl: DummyImages.networkImages[index],
                      lastSeen: "10:00pm",
                      profileName: DummyImages.dummyNames[index],
                    ),
                  );
                },
                leading: CachedNetworkImage(
                  imageUrl: DummyImages.networkImages[index],
                  progressIndicatorBuilder: (context, url, progress) {
                    return CircularProgressIndicator(
                      value: progress.progress,
                    );
                  },
                  imageBuilder: (context, imageProvider) {
                    return CircleAvatar(
                      radius: 30,
                      backgroundImage: imageProvider,
                    );
                  },
                ),
                title: AppText(
                  text: DummyImages.dummyNames[index],
                  fontWeight: FontWeight.w700,
                ),
                subtitle: AppText(
                  text: "Hello",
                  textColor: Colors.black,
                ),
                trailing: AppText(text: "30min ago"),
              ),
              const Divider(
                thickness: 1,
              ),
            ],
          ),
        );
      },
    );
  }
}
