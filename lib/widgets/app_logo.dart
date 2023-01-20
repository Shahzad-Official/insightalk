import 'package:flutter/material.dart';

class AppLogo extends StatelessWidget {
  final double size;
  const AppLogo({
    Key? key,
    this.size = 150,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 20.0),
      child: SizedBox(
        width: size,
        height: size,
        child: Image.asset(
          "assets/logo.png",
        ),
      ),
    );
  }
}
