import 'package:doitnow/utils/colors/color_constant.dart';
import 'package:doitnow/utils/constants/constant.dart';
import 'package:flutter/material.dart';
class Button extends StatelessWidget {
  final String buttonName;
  final GlobalKey<FormState> formKey;
  const Button({
    required this.buttonName,
    required this.formKey,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: Constants.deviceMaxWidth(context),
      decoration: ShapeDecoration(
          color: ColorConstants.deepBlueColor,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(16))),
      child: ElevatedButton(
        style: ButtonStyle(
            padding: MaterialStateProperty.all<EdgeInsets>(
                const EdgeInsets.symmetric(
              vertical: 16,
            )),
            backgroundColor:
                MaterialStateProperty.all<Color>(ColorConstants.deepBlueColor),
            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16.0),
            ))),
        
        child: Text(
          buttonName,
          style: TextStyle(
              letterSpacing: -0.18,
              fontWeight: FontWeight.w700,
              color: ColorConstants.plainWhiteColor),
        ),

        onPressed: () {
          if (formKey.currentState!.validate()) {
            
            debugPrint('Button pressed');
          }
        },
      ),
    );
  }
}
