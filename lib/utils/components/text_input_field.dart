import 'package:doitnow/utils/colors/color_constant.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class TextInputField extends StatelessWidget {
  final TextEditingController controller;
  final FocusNode focus;
  final String iconPath;
  final String hintText;
  final bool obscureText;

    final TextInputAction action;
  final FocusNode? requestFocus;

  

  const TextInputField(
      {required this.controller,
      required this.focus,
      required this.iconPath,
      required this.hintText,
      required this.obscureText,
  
      required this.action,
      this.requestFocus,
      super.key});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText: obscureText,
     
      controller: controller,
      textInputAction: action,
      focusNode: focus,
      onFieldSubmitted: (value) => FocusScope.of(context).requestFocus(requestFocus),

      decoration: InputDecoration(
        contentPadding:
            const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
        prefixIcon: Container(
            width: 19.2,
            height: 19.2,
            alignment: Alignment.center,
            child: SvgPicture.asset(
              iconPath,
              fit: BoxFit.cover,
            )),
        hintText: hintText,
        hintStyle: TextStyle(
            color: ColorConstants.lightGreyColor,
            fontSize: 16,
            fontStyle: FontStyle.italic,
            fontWeight: FontWeight.w400,
            letterSpacing: -0.18),
        enabledBorder: OutlineInputBorder(
          borderSide:
              BorderSide(color: ColorConstants.deepBlueColor, width: 1.50),
          borderRadius: BorderRadius.circular(16),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide:
              BorderSide(color: ColorConstants.deepBlueColor, width: 1.50),
          borderRadius: BorderRadius.circular(16),
        ),
      ),
      validator: (value) {
        if (controller.text.isEmpty) {
          return 'Please enter your email';
        }
        return null;
      },
    );
  }
}
