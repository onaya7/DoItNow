import 'package:doitnow/utils/colors/color_constant.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class TextInputField {
  static InputDecoration field(String icon, String? hinttext) => InputDecoration(
        contentPadding:
            const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
        prefixIcon: Container(
            width: 19.2,
            height: 19.2,
            alignment: Alignment.center,
            child: SvgPicture.asset(
              'assets/images/$icon',
              fit: BoxFit.cover,
            )),
        hintText: hinttext,
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
      );
}
