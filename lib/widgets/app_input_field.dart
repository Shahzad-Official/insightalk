import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:insightalk/widgets/app_text.dart';

class AppInputField extends StatelessWidget {
  final TextEditingController? controller;
  final String? hintText, initialValue;
  final String headingText;
  final TextInputType? keyboardType;
  final bool? enabled, obsecure;
  final TextInputAction? textInputAction;
  const AppInputField({
    Key? key,
    this.controller,
    this.hintText,
    required this.headingText,
    this.keyboardType,
    this.initialValue,
    this.enabled,
    this.obsecure,
    this.textInputAction = TextInputAction.next,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        AppText(
          text: headingText,
          fontSize: 16,
          fontWeight: FontWeight.w500,
          textColor: Colors.grey,
        ),
        TextFormField(
          obscureText: obsecure ?? false,
          enabled: enabled,
          textInputAction: textInputAction,
          obscuringCharacter: "*",
          initialValue: initialValue,
          controller: controller,
          keyboardType: keyboardType,
          decoration: InputDecoration(
            hintText: hintText,
            hintStyle: GoogleFonts.poppins(
              color: Colors.grey,
              fontSize: 14,
              fontWeight: FontWeight.w400,
            ),
            enabledBorder: const UnderlineInputBorder(
              borderSide: BorderSide(
                color: Colors.black,
                width: 1,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
