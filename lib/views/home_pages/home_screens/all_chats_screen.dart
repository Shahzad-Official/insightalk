import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:insightalk/constants/app_colors.dart';
import 'package:insightalk/constants/app_paddings.dart';
import 'package:insightalk/constants/dummy_images.dart';
import 'package:insightalk/widgets/app_buttons.dart';

class AllChatsScreen extends StatelessWidget {
  const AllChatsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: AppPaddings.defaultPadding,
      child: Column(
        children: [
          GridView.builder(
            shrinkWrap: true,
            itemCount: DummyImages.networkImages.length,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3,
              childAspectRatio: 0.65,
              mainAxisSpacing: 10,
              crossAxisSpacing: 10,
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
          RoundButton(
            color: AppColors.primaryColor,
            borderColor: AppColors.primaryColor,
            textColor: Colors.white,
            leftIcon: SvgPicture.asset(
              "assets/message.svg",
            ),
            childText: "Join Now",
          ),
        ],
      ),
    );
  }
}
