import 'package:doitnow/utils/colors/color_constant.dart';
import 'package:doitnow/utils/constants/constant.dart';
import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final String buttonName;
  final VoidCallback onTap;

  const CustomButton(
      {required this.buttonName, required this.onTap, super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        width: Constants.deviceMaxWidth(context),
        decoration: ShapeDecoration(
            color: ColorConstants.deepBlueColor,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16))),
        child: ElevatedButton(
            style: ButtonStyle(
                padding: MaterialStateProperty.all<EdgeInsets>(
                    const EdgeInsets.symmetric(
                  vertical: 16,
                )),
                backgroundColor: MaterialStateProperty.all<Color>(
                    ColorConstants.deepBlueColor),
                shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                    RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16.0),
                ))),
            onPressed: onTap,
            child: Text(
              buttonName,
              style: TextStyle(
                  letterSpacing: -0.18,
                  fontWeight: FontWeight.w700,
                  color: ColorConstants.plainWhiteColor),
            )));
  }
}
