import 'package:doitnow/utils/colors/color_constant.dart';
import 'package:doitnow/utils/controllers/shiftfocus.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class TextInputField extends StatelessWidget {
  final TextEditingController controller;
  final FocusNode currentFocus;
  final FocusNode? nextFocus;
  final String iconPath;
  final String hintText;
  final bool obscureText;
  final TextInputAction action;
  final String? Function(String?)? validator;

  const TextInputField(
      {required this.controller,
      required this.currentFocus,
      this.nextFocus,
      required this.iconPath,
      required this.hintText,
      required this.obscureText,
      required this.action,
      required this.validator,
      super.key});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText: obscureText,
      controller: controller,
      textInputAction: action,
      focusNode: currentFocus,
      onEditingComplete: () {
        Controller.shiftFocus(context, currentFocus, nextFocus);
      },
      decoration: InputDecoration(
        focusedErrorBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: Colors.red, width: 1.50),
          borderRadius: BorderRadius.circular(16),
        ),
        errorBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: Colors.red, width: 1.50),
          borderRadius: BorderRadius.circular(16),
        ),
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
      validator: validator,
    );
  }
}
