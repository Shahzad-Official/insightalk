import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:insightalk/constants/app_colors.dart';
import 'package:insightalk/constants/app_paddings.dart';
import 'package:insightalk/constants/svgs.dart';
import 'package:insightalk/views/register_screens/login.dart';

import '../widgets/app_logo.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Future.delayed(
      const Duration(seconds: 3),
      (() => Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) => Login(),
            ),
          )),
    );
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Padding(
          padding: AppPaddings.defaultPadding,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              AppLogo(),
              const SizedBox(
                height: 20,
              ),
              const SpinKitCircle(
                color: AppColors.primaryColor,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
