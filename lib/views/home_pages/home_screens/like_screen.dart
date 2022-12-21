import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:insightalk/widgets/app_text.dart';

import '../../../constants/app_colors.dart';
import '../../../constants/app_paddings.dart';
import '../../../constants/dummy_images.dart';

class LikeScreen extends StatelessWidget {
  const LikeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: AppPaddings.defaultPadding,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          GridView.builder(
            shrinkWrap: true,
            itemCount: DummyImages.networkImages.length,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3,
              childAspectRatio: 0.8,
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
                    child: Align(
                      alignment: Alignment.bottomCenter,
                      child: Container(
                        height: 20,
                        decoration: BoxDecoration(
                          color: Colors.black.withOpacity(0.8),
                          borderRadius: const BorderRadius.only(
                            bottomLeft: Radius.circular(15),
                            bottomRight: Radius.circular(15),
                          ),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 8.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              AppText(
                                text: "1 . Lis sa",
                                fontSize: 10,
                                fontWeight: FontWeight.w600,
                                textColor: Colors.white,
                              ),
                              AppText(
                                text: "😊 1x",
                                fontSize: 10,
                                fontWeight: FontWeight.w600,
                                textColor: Colors.white,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  );
                },
              );
            },
          ),
        ],
      ),
    );
  }
}
