import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:insightalk/constants/app_colors.dart';
import 'package:insightalk/constants/svgs.dart';
import 'package:insightalk/views/register_screens/forget_password.dart';
import 'package:insightalk/widgets/app_buttons.dart';

import '../../constants/app_paddings.dart';
import '../../widgets/app_text.dart';

class EmailCheck extends StatelessWidget {
  const EmailCheck({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ColoredBox(
      color: AppColors.primaryColor,
      child: SafeArea(
        child: Scaffold(
          body: Padding(
            padding: AppPaddings.defaultPadding,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SvgPicture.string(
                  SvgIcons.resetEmaillogo,
                ),
                AppPaddings.heigthSpace30,
                AppText(
                  text: "Check your Email",
                  fontSize: 27,
                  fontWeight: FontWeight.w600,
                ),
                AppPaddings.heigthSpace10,
                AppText(
                  text:
                      "we have sent you a reset password link on your registered email address.",
                  fontSize: 16,
                  textAlign: TextAlign.center,
                  fontWeight: FontWeight.w500,
                  textColor: Colors.grey,
                ),
                AppPaddings.heigthSpace10,
                AppText(
                  text: "Don't forget to check email spam folder.",
                  fontSize: 16,
                  textAlign: TextAlign.center,
                  fontWeight: FontWeight.w500,
                  textColor: Colors.grey,
                ),
                AppPaddings.heigthSpace30,
                AppButton(
                  childText: "Reset Password",
                  onTap: () {
                    Get.to(
                      () => ForgetPassword(),
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
