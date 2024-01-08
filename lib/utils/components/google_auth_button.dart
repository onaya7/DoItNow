import 'package:doitnow/utils/colors/color_constant.dart';
import 'package:doitnow/utils/constants/constant.dart';
import 'package:flutter/material.dart';

class GoogleAuthButton extends StatelessWidget {
  const GoogleAuthButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        debugPrint('Sign in with Google');
      },
      child: Container(
        width: Constants.deviceMaxWidth(context),
        height: 56,
        decoration: ShapeDecoration(
          shape: RoundedRectangleBorder(
            side: BorderSide(
              width: 1.50,
              color: ColorConstants.deepBlackColor,
            ),
            borderRadius: BorderRadius.circular(16),
          ),
          color: ColorConstants.plainWhiteColor,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              width: 24,
              height: 24,
              child: Image.asset(
                'assets/images/google.png',
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(
              width: 10,
            ),
            Text(
              'Continue with Google',
              style: TextStyle(
                  color: ColorConstants.deepBlackColor,
                  fontSize: 16,
                  fontWeight: FontWeight.w700,
                  letterSpacing: -0.18),
            ),
          ],
        ),
      ),
    );
  }
}
