import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:insightalk/constants/app_colors.dart';
import 'package:insightalk/constants/app_paddings.dart';
import 'package:insightalk/controllers/chat_controllers/chat_rating_controller.dart';
import 'package:insightalk/views/home_pages/home_screen.dart';
import 'package:insightalk/widgets/app_buttons.dart';
import 'package:insightalk/widgets/app_text.dart';

import '../../constants/svgs.dart';
import '../../widgets/link_widget.dart';

class RateGroupChat extends StatelessWidget {
  RateGroupChat({Key? key}) : super(key: key);
  final ChatRatingController controller = Get.put(ChatRatingController());

  @override
  Widget build(BuildContext context) {
    return ColoredBox(
      color: AppColors.primaryColor,
      child: SafeArea(
        child: Scaffold(
          appBar: PreferredSize(
            preferredSize: const Size.fromHeight(75),
            child: Padding(
              padding: AppPaddings.defaultPadding,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  RoundButton(
                    onTap: () => Get.back(),
                    height: 50,
                    width: 50,
                    color: AppColors.primaryColor.withOpacity(0.3),
                    borderColor: Colors.transparent,
                    childText: "",
                    child: const Icon(
                      Icons.arrow_back_ios,
                      color: AppColors.primaryColor,
                    ),
                  ),
                ],
              ),
            ),
          ),
          body: Padding(
            padding: AppPaddings.defaultPadding,
            child: Column(
              children: [
                const AppText(
                  fontSize: 24,
                  fontWeight: FontWeight.w700,
                  text:
                      "How would you rate your conversation with this person?",
                ),
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
                                              const EdgeInsets.only(right: 17),
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(15),
                                            border: Border.all(
                                                color: AppColors.primaryColor,
                                                width: 2),
                                            image: const DecorationImage(
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
                                              const EdgeInsets.only(left: 17),
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(15),
                                            border: Border.all(
                                                color: AppColors.primaryColor,
                                                width: 2),
                                            image: const DecorationImage(
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
                    ],
                  ),
                ),
                AppPaddings.heigthSpace30,
                Expanded(
                  child: GridView.builder(
                    itemCount: controller.ratings.length,
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      crossAxisSpacing: 20,
                      mainAxisSpacing: 20,
                      childAspectRatio: 2.4,
                    ),
                    itemBuilder: (context, index) {
                      return GetBuilder<ChatRatingController>(
                        init: ChatRatingController(),
                        builder: (_) {
                          return RoundButton(
                            onTap: () {
                              _.changeSelectedItem(index);
                            },
                            borderColor: Colors.transparent,
                            color: _.isSelectedItem[index]
                                ? Colors.black
                                : AppColors.primaryColor,
                            childText: controller.ratings[index],
                            textColor: Colors.white,
                            leftIcon:
                                Image.asset(controller.ratingsIcons[index]),
                          );
                        },
                      );
                    },
                  ),
                ),
                AppButton(
                  onTap: () => Get.offAll(() => const HomeScreen()),
                  childText: "Done",
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
