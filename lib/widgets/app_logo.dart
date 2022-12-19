import 'package:flutter/material.dart';

class AppLogo extends StatelessWidget {
  // ignore: prefer_const_constructors_in_immutables
  AppLogo({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 20.0),
      child: SizedBox(
        width: 150,
        height: 150,
        child: Image.asset(
          "assets/logo.png",
        ),
      ),
    );
  }
}
