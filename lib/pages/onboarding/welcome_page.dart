import 'package:doitnow/utils/colors/color_constant.dart';
import 'package:doitnow/utils/components/already_have.dart';
import 'package:doitnow/utils/components/email_auth_button.dart';
import 'package:doitnow/utils/components/google_auth_button.dart';
import 'package:doitnow/utils/constants/constant.dart';
import 'package:flutter/material.dart';

class WelcomePage extends StatelessWidget {
  const WelcomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
      child: Container(
        color: ColorConstants.plainWhiteColor,
        width: Constants.deviceMaxWidth(context),
        height: Constants.deviceMaxHeight(context),
        child: Column(
          
          children: [
            Container(
              padding: const EdgeInsets.only(
                  top: 205, left: 35, right: 60, bottom: 204),
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
                        color: ColorConstants.deepGreyColor,
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ]),
            ),
            Expanded(
              child: Container(
                width: Constants.deviceMaxWidth(context),
                padding: const EdgeInsets.only(left: 35, right: 34),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        'Let\'s Get Started...',
                        style: TextStyle(
                            color: ColorConstants.plainBlackColor,
                            fontSize: 17.32,
                            fontWeight: FontWeight.w400,
                            letterSpacing: -0.19),
                      ),
                      const SizedBox(
                        height: 18,
                      ),
                      const GoogleAuthButton(),
                      const SizedBox(height: 11),
                      const EmailAuthButton(),
                      const SizedBox(height: 24),
                      const AlreadyHave(
                          text: 'Already have an account?', authName: 'Login')
                    ]),
              ),
            ),
          ],
        ),
      ),
    ));
  }
}
