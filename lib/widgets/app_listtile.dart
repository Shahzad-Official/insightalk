import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:insightalk/constants/svgs.dart';
import 'package:insightalk/widgets/app_text.dart';

class AppListtile extends StatelessWidget {
  const AppListtile({
    Key? key,
    this.leading,
    required this.subTitle,
    required this.title,
    required this.trailing,
    this.imageProvider,
  }) : super(key: key);
  final Widget title, subTitle, trailing;
  final Widget? leading;
  final ImageProvider? imageProvider;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Row(
        children: [
          leading == null
              ? Container(
                  height: 70,
                  width: 50,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    image: DecorationImage(
                      fit: BoxFit.cover,
                      image: imageProvider!,
                    ),
                  ),
                  child: leading,
                )
              : leading!,
          const SizedBox(
            width: 10,
          ),
          Column(
            children: [
              title,
              const SizedBox(
                height: 5,
              ),
              subTitle,
            ],
          ),
          const Spacer(),
          trailing,
        ],
      ),
    );
  }
}
