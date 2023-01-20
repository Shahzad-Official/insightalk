import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:insightalk/constants/app_colors.dart';
import 'package:insightalk/widgets/app_listtile.dart';

import '../constants/app_paddings.dart';
import '../constants/svgs.dart';
import '../widgets/app_text.dart';

class FriendRequestPage extends StatefulWidget {
  const FriendRequestPage({Key? key}) : super(key: key);

  @override
  State<FriendRequestPage> createState() => _FriendRequestPageState();
}

class _FriendRequestPageState extends State<FriendRequestPage> {
  final focusNode = FocusNode();
  bool hasFocus = false;

  @override
  Widget build(BuildContext context) {
    return ColoredBox(
      color: AppColors.primaryColor,
      child: SafeArea(
        child: Scaffold(
          appBar: PreferredSize(
            preferredSize: const Size.fromHeight(145),
            child: Padding(
              padding: AppPaddings.defaultPadding,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const AppText(
                    text: "Requests",
                    fontSize: 30,
                    fontWeight: FontWeight.w700,
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
                          color:
                              !hasFocus ? Colors.grey : AppColors.primaryColor,
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
            child: Padding(
              padding: AppPaddings.defaultPadding,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const AppText(
                    text: "Friend Requests",
                    fontSize: 24,
                    fontWeight: FontWeight.w700,
                  ),
                  AppPaddings.heigthSpace30,
                  ListView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: 3,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.only(bottom: 15.0),
                        child: AppListtile(
                          subTitle: const SizedBox(),
                          title: const AppText(
                            text: "Chloe",
                            fontSize: 15,
                            fontWeight: FontWeight.w600,
                          ),
                          trailing: Row(
                            children: [
                              SvgPicture.string(SvgIcons.deleteFriend),
                              const SizedBox(
                                width: 15,
                              ),
                              SvgPicture.string(SvgIcons.friendRequest),
                            ],
                          ),
                          imageProvider: AssetImage("assets/girl1.jpg"),
                        ),
                      );
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
