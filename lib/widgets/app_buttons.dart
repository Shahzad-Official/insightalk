import 'package:flutter/material.dart';
import 'package:insightalk/constants/app_colors.dart';
import 'package:insightalk/widgets/app_text.dart';

class AppButton extends StatelessWidget {
  double? width, height, fontSize;
  double borderwidth, borderRadius;
  FontWeight? fontWeight;
  Color? color, textColor;
  Color borderColor;
  String childText;

  void Function()? onTap;
  AppButton({
    Key? key,
    this.color = AppColors.primaryColor,
    this.borderwidth = 1.0,
    this.borderColor = AppColors.primaryColor,
    this.borderRadius = 15.0,
    required this.childText,
    this.height = 56,
    this.onTap,
    this.width,
    this.fontSize = 16,
    this.fontWeight = FontWeight.w700,
    this.textColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        height: height,
        width: width ?? MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(borderRadius),
          border: Border.all(
            color: borderColor,
            width: borderwidth,
          ),
        ),
        child: Center(
          child: AppText(
            text: childText,
            fontSize: fontSize,
            fontWeight: fontWeight,
            textColor: textColor ?? Colors.white,
          ),
        ),
      ),
    );
  }
}

class RoundButton extends StatelessWidget {
  double? width, height, fontSize, spaceinIcon;
  double borderwidth, borderRadius;
  FontWeight? fontWeight;
  Color? color, textColor;
  Color borderColor;
  String childText;
  Widget? leftIcon, rightIcon;
  void Function()? onTap;
  RoundButton({
    Key? key,
    this.color = Colors.white,
    this.borderwidth = 1.0,
    this.borderColor = Colors.grey,
    this.borderRadius = 15.0,
    required this.childText,
    this.height = 56,
    this.leftIcon,
    this.onTap,
    this.width,
    this.fontSize = 16,
    this.fontWeight = FontWeight.w700,
    this.textColor,
    this.spaceinIcon = 14,
    this.rightIcon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        height: height,
        width: width ?? MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(borderRadius),
          border: Border.all(
            color: borderColor,
            width: borderwidth,
          ),
        ),
        child: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              leftIcon ?? const SizedBox(),
              SizedBox(
                width: spaceinIcon,
              ),
              AppText(
                text: childText,
                fontSize: fontSize,
                fontWeight: fontWeight,
                textColor: textColor,
              ),
              rightIcon ?? const SizedBox(),
            ],
          ),
        ),
      ),
    );
  }
}
