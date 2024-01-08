import 'package:doitnow/utils/colors/color_constant.dart';
import 'package:doitnow/utils/constants/constant.dart';
import 'package:flutter/material.dart';

class AlreadyHave extends StatelessWidget {
  final String text;
  final String authName;
  const AlreadyHave({
    required this.text,
    required this.authName,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: Constants.deviceMaxWidth(context),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            text,
            style: TextStyle(
              color: ColorConstants.plainBlackColor,
              fontSize: 16,
              fontWeight: FontWeight.w400,
              letterSpacing: -0.18,
            ),
          ),
          const SizedBox(
            width: 6,
          ),
          GestureDetector(
            onTap: () {
              if (authName == 'Login') {
                Navigator.pushNamed(context, '/login');
              } else if (authName == 'Register') {
                Navigator.pushNamed(context, '/register');
              } else {
                debugPrint('No user');
              }
            },
            child: Text(
              authName,
              style: TextStyle(
                  color: ColorConstants.deepBlueColor,
                  fontSize: 16,
                  fontWeight: FontWeight.w700,
                  decoration: TextDecoration.underline,
                  decorationColor: ColorConstants.deepBlueColor),
            ),
          ),
        ],
      ),
    );
  }
}
