import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:insightalk/constants/app_colors.dart';
import 'package:insightalk/constants/app_paddings.dart';
import 'package:insightalk/constants/dummy_images.dart';
import 'package:insightalk/constants/svgs.dart';
import 'package:insightalk/views/chat_screen/chat_screen.dart';
import 'package:insightalk/views/friend_request_page.dart';
import 'package:insightalk/widgets/app_text.dart';

class FriendsScreen extends StatefulWidget {
  const FriendsScreen({Key? key}) : super(key: key);

  @override
  State<FriendsScreen> createState() => _FriendsScreenState();
}

class _FriendsScreenState extends State<FriendsScreen> {
  final TextEditingController searchController = TextEditingController();
  FocusNode focusNode = FocusNode();
  bool hasFocus = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(145),
        child: Padding(
          padding: AppPaddings.defaultPadding,
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const AppText(
                    text: "Friends",
                    fontSize: 30,
                    fontWeight: FontWeight.w700,
                  ),
                  InkWell(
                    onTap: () => Get.to(() => const FriendRequestPage()),
                    child: SizedBox(
                      height: 30,
                      width: 35,
                      child: Stack(
                        children: [
                          const Align(
                            alignment: Alignment.topRight,
                            child: AppText(
                              text: "+1",
                              fontWeight: FontWeight.w600,
                              textColor: AppColors.primaryColor,
                            ),
                          ),
                          Align(
                            alignment: Alignment.bottomLeft,
                            child: SvgPicture.string(SvgIcons.friendRequest),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              const Spacer(),
              TextFormField(
                focusNode: focusNode,
                onTap: () {
                  focusNode.addListener(() {
                    setState(() {
                      hasFocus = focusNode.hasFocus;
                    });
                  });
                },
                decoration: InputDecoration(
                  prefixIcon: Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: SvgPicture.string(
                      SvgIcons.search,
                      color: !hasFocus ? Colors.grey : AppColors.primaryColor,
                    ),
                  ),
                  border: InputBorder.none,
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                    borderSide: const BorderSide(
                      color: Colors.grey,
                    ),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                    borderSide: const BorderSide(
                      color: AppColors.primaryColor,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Padding(
              padding: AppPaddings.defaultPadding,
              child: AppText(
                text: "Chats",
                fontSize: 24,
                fontWeight: FontWeight.w700,
              ),
            ),
            ListView.builder(
              physics: const NeverScrollableScrollPhysics(),
              itemCount: DummyImages.networkImages.length - 3,
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
                            return Container(
                              height: 90,
                              width: 50,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(5),
                                image: DecorationImage(
                                  image: imageProvider,
                                  fit: BoxFit.cover,
                                ),
                              ),
                            );
                          },
                        ),
                        title: AppText(
                          text: DummyImages.dummyNames[index],
                          fontWeight: FontWeight.w700,
                        ),
                        subtitle: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const SizedBox(
                              height: 5,
                            ),
                            Row(
                              children: [
                                index == 2
                                    ? const AppText(
                                        text: "You:",
                                        textColor: Colors.grey,
                                      )
                                    : const SizedBox(),
                                AppText(
                                  text: DummyImages.dummyMessages[index],
                                  textColor: Colors.black,
                                ),
                              ],
                            ),
                            const SizedBox(
                              height: 3,
                            ),
                            index == 0
                                ? const AppText(
                                    text: "Last active: 1hr ago",
                                    textColor: Colors.grey,
                                    fontSize: 10,
                                    fontWeight: FontWeight.w500,
                                  )
                                : const SizedBox(),
                          ],
                        ),
                        trailing: SizedBox(
                          height: 50,
                          width: 50,
                          child: Stack(
                            children: [
                              index == 0 || index == 1
                                  ? Center(
                                      child: Container(
                                        height: 20,
                                        width: 20,
                                        decoration: const BoxDecoration(
                                            shape: BoxShape.circle,
                                            color: AppColors.primaryColor),
                                        child: Center(
                                          child: AppText(
                                            text: index == 0 ? "1" : "2",
                                            fontWeight: FontWeight.w600,
                                            textColor: Colors.white,
                                          ),
                                        ),
                                      ),
                                    )
                                  : const SizedBox(),
                              const Center(
                                child: AppText(
                                  text: "30\nmin",
                                  fontSize: 12,
                                  textColor: Colors.grey,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      const Divider(
                        thickness: 1,
                      ),
                    ],
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
