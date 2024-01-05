import 'package:doitnow/utils/colors/color_constant.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class WelcomePage extends StatelessWidget {
  const WelcomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final w = MediaQuery.of(context).size.width;
    final h = MediaQuery.of(context).size.height;
    return Scaffold(
        body: Container(
      color: Colors.green,
      width: w,
      height: h,
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.only(
                top: 205, left: 35, right: 60, bottom: 204),
            color: Colors.pink,
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    'Welcome to',
                    style: TextStyle(
                      color: ColorConstants.plainBlackColor,
                      fontSize: 20,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Text(
                    'DoItNow',
                    style: TextStyle(
                      color: ColorConstants.deepBlueColor,
                      fontSize: 45,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Text(
                    'A place where you can stay on top of your task.',
                    style: TextStyle(
                      color: ColorConstants.plainGreyColor,
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ]),
          ),
          Expanded(
            child: Container(
              width: w,
              padding: const EdgeInsets.only(left: 35, right: 34),
              color: Colors.yellow,
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      'Let\'s get started...',
                      style: TextStyle(
                        color: ColorConstants.plainBlackColor,
                        fontSize: 17.32,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    const SizedBox(
                      height: 18,
                    ),
                    GestureDetector(
                      onTap: () {
                        debugPrint('Sign in with Google');
                      },
                      child: Container(
                        width: w,
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
                    ),
                    const SizedBox(height: 11),
                    GestureDetector(
                      onTap: () {
                        debugPrint('Sign in with Email');
                      },
                      child: Container(
                        width: w,
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
                              child: SvgPicture.asset(
                                  'assets/images/vector.svg',
                                  fit: BoxFit.cover,
                                  colorFilter: ColorFilter.mode(
                                      ColorConstants.deepBlueColor,
                                      BlendMode.srcIn)),
                            ),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(height: 24),
                    SizedBox(
                      width: w,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Already have an account?',
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
                          Text(
                            'Login',
                            style: TextStyle(
                                color: ColorConstants.deepBlueColor,
                                fontSize: 16,
                                fontWeight: FontWeight.w700,
                                decoration: TextDecoration.underline,
                                decorationColor: ColorConstants.deepBlueColor),
                          ),
                        ],
                      ),
                    )
                  ]),
            ),
          ),
        ],
      ),
    ));
  }
}
