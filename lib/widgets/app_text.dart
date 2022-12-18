import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppText extends StatelessWidget {
  String text;
  Color? textColor;
  FontWeight? fontWeight;
  double? fontSize, lineHeight;
  TextAlign? textAlign;

  AppText({
    Key? key,
    required this.text,
    this.fontSize,
    this.fontWeight,
    this.lineHeight,
    this.textColor,
    this.textAlign,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textAlign: textAlign,
      style: GoogleFonts.poppins(
        color: textColor,
        fontSize: fontSize,
        fontWeight: fontWeight,
        height: lineHeight,
      ),
    );
  }
}
