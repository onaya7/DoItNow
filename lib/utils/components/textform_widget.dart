import 'package:doitnow/utils/colors/color_constant.dart';
import 'package:doitnow/utils/controllers/shiftfocus.dart';
import 'package:flutter/material.dart';

class TextFormWidget extends StatelessWidget {
  final String hintText;
  final TextEditingController controller;
  final FocusNode currentFocus;
  final FocusNode? nextFocus;
  final TextInputAction action;
  final String? Function(String?)? validator;
  final dynamic maxLines;

  const TextFormWidget({
    required this.hintText,
    required this.controller,
    required this.currentFocus,
    this.nextFocus,
    required this.action,
    required this.validator,
    required this.maxLines,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      maxLines: maxLines,
      controller: controller,
      focusNode: currentFocus,
      onEditingComplete: () {
        Controller.shiftFocus(context, currentFocus, nextFocus);
      },
      textInputAction: action,
      decoration: InputDecoration(
        hintText: hintText,
        hintStyle: TextStyle(
          color: ColorConstants.textGreyColor,
          fontSize: 16,
          fontWeight: FontWeight.w400,
        ),
        border: UnderlineInputBorder(
          borderSide:
              BorderSide(width: 1.0, color: ColorConstants.textGreyColor),
        ),
        focusedBorder: UnderlineInputBorder(
          borderSide:
              BorderSide(width: 1.0, color: ColorConstants.deepBlueColor),
        ),
      ),
      validator: validator,
    );
  }
}
