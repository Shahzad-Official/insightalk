import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:insightalk/constants/app_colors.dart';
import 'package:insightalk/constants/app_paddings.dart';
import 'package:insightalk/constants/dummy_images.dart';
import 'package:insightalk/views/chat_screen/group_chat_screen.dart';
import 'package:insightalk/widgets/app_buttons.dart';
import 'package:insightalk/widgets/app_text.dart';

class AllChatsScreen extends StatelessWidget {
  const AllChatsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: AppPaddings.defaultPadding,
      child: Column(
        children: [
          const Spacer(),
          GridView.builder(
            shrinkWrap: true,
            itemCount: DummyImages.networkImages.length - 3,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3,
              childAspectRatio: 0.7,
              mainAxisSpacing: 15,
              crossAxisSpacing: 15,
            ),
            itemBuilder: (context, index) {
              return CachedNetworkImage(
                imageUrl: DummyImages.networkImages[index],
                placeholder: (context, url) {
                  return const SpinKitThreeBounce(
                    color: AppColors.primaryColor,
                    size: 30,
                  );
                },
                imageBuilder: (context, imageProvider) {
                  return Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      color: AppColors.primaryColor.withOpacity(0.5),
                      image: DecorationImage(
                        image: NetworkImage(
                          DummyImages.networkImages[index],
                        ),
                        fit: BoxFit.cover,
                      ),
                    ),
                  );
                },
              );
            },
          ),
          const Spacer(),
          const AppText(
            text: "Users here now",
            fontSize: 16,
            fontWeight: FontWeight.w700,
            textColor: AppColors.primaryColor,
          ),
          const Spacer(),
          RoundButton(
            onTap: () => Get.to(() => const GroupChatScreen()),
            color: AppColors.primaryColor,
            borderColor: AppColors.primaryColor,
            textColor: Colors.white,
            leftIcon: SvgPicture.asset(
              "assets/message.svg",
            ),
            childText: "Join Now",
          ),
          const Spacer(),
        ],
      ),
    );
  }
}
