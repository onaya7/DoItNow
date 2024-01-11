import 'package:doitnow/utils/colors/color_constant.dart';
import 'package:doitnow/utils/constants/constant.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class EmailAuthButton extends StatelessWidget {
  const EmailAuthButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, '/register');
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
            Text(
              'Continue with Email',
              style: TextStyle(
                  color: ColorConstants.deepBlackColor,
                  fontSize: 16,
                  fontWeight: FontWeight.w700,
                  letterSpacing: -0.18),
            ),
            const SizedBox(
              width: 10,
            ),
            Container(
              alignment: Alignment.center,
              child: SvgPicture.asset('assets/images/vector.svg',
                  fit: BoxFit.cover,
                  colorFilter: ColorFilter.mode(
                      ColorConstants.deepBlueColor, BlendMode.srcIn)),
            ),
          ],
        ),
      ),
    );
  }
}
