import 'package:doitnow/utils/colors/color_constant.dart';
import 'package:doitnow/utils/components/text_input_field.dart';
import 'package:doitnow/utils/constants/constant.dart';
import 'package:doitnow/utils/controllers/focus_controllers.dart';
import 'package:doitnow/utils/controllers/text_controllers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  @override
  void dispose() {
    Controller.emailController.dispose();
    Controller.passwordController.dispose();
    Controller.nameController.dispose();
    FocusControllers.emailFocus.dispose();
    FocusControllers.nameFocus.dispose();
    FocusControllers.passwordFocus.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final GlobalKey formKey = GlobalKey<FormState>();

    return Scaffold(
        body: SingleChildScrollView(
          child: Container(
                width: Constants.deviceMaxWidth(context),
                color: ColorConstants.plainWhiteColor,
                padding: const EdgeInsets.only(top: 57, left: 35, right: 36),
                child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            SvgPicture.asset(
              'assets/images/arrow-left.svg',
              width: 38,
              height: 38,
            ),
            const SizedBox(
              height: 23,
            ),
            Text(
              'Register',
              style: TextStyle(
                  color: ColorConstants.deepBlueColor,
                  fontSize: 32,
                  fontWeight: FontWeight.w700,
                  letterSpacing: -0.35),
            ),
            const SizedBox(
              height: 19,
            ),
            SizedBox(
              width: 286,
              child: Text.rich(
                TextSpan(children: [
                  TextSpan(
                    text: 'Create an ',
                    style: TextStyle(
                        color: ColorConstants.deepGreyColor,
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                        letterSpacing: -0.18),
                  ),
                  TextSpan(
                    text: 'account',
                    style: TextStyle(
                        color: ColorConstants.deepBlueColor,
                        fontSize: 16,
                        fontWeight: FontWeight.w700,
                        letterSpacing: -0.18),
                  ),
                  TextSpan(
                    text: ' to access all the features of ',
                    style: TextStyle(
                        color: ColorConstants.deepGreyColor,
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                        letterSpacing: -0.18),
                  ),
                  TextSpan(
                    text: 'DoItNow!',
                    style: TextStyle(
                        color: ColorConstants.deepGreyColor,
                        fontSize: 16,
                        fontWeight: FontWeight.w700,
                        letterSpacing: -0.18),
                  ),
                ]),
              ),
            ),
            const SizedBox(
              height: 38,
            ),
            Form(
                key: formKey,
                child: Column(
                  children: <Widget>[
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Email',
                          style: TextStyle(
                              color: ColorConstants.deepBlackColor,
                              fontSize: 16,
                              fontWeight: FontWeight.w400,
                              letterSpacing: -0.18),
                        ),
                        const SizedBox(
                          height: 6,
                        ),
                        TextFormField(
                          autofocus: true,
                          controller: Controller.emailController,
                          textInputAction: TextInputAction.next,
                          focusNode: FocusControllers.emailFocus,
                          onFieldSubmitted: (value) {
                            FocusScope.of(context)
                                .requestFocus(FocusControllers.nameFocus);
                          },
                          decoration: TextInputField.field(
                              'vector.svg', 'Ex: abc@example.com'),
                          validator: (value) {
                            if (Controller.emailController.text.isEmpty) {
                              return 'Please enter your email';
                            }
                            return null;
                          },
                        ),
                        const SizedBox(
                          height: 28,
                        ),
                        Text(
                          'Your Name',
                          style: TextStyle(
                              color: ColorConstants.deepBlackColor,
                              fontSize: 16,
                              fontWeight: FontWeight.w400,
                              letterSpacing: -0.18),
                        ),
                        const SizedBox(
                          height: 6,
                        ),
                        TextFormField(
                          autofocus: true,
                          controller: Controller.nameController,
                          textInputAction: TextInputAction.next,
                          focusNode: FocusControllers.nameFocus,
                          onFieldSubmitted: (value) {
                            FocusScope.of(context)
                                .requestFocus(FocusControllers.passwordFocus);
                          },
                          decoration: TextInputField.field(
                              'profile.svg', 'Ex. Saul Ramirez'),
                          validator: (value) {
                            if (Controller.emailController.text.isEmpty) {
                              return 'Please enter your email';
                            }
                            return null;
                          },
                        ),
                        const SizedBox(
                          height: 28,
                        ),
                        Text(
                          'Your Password',
                          style: TextStyle(
                              color: ColorConstants.deepBlackColor,
                              fontSize: 16,
                              fontWeight: FontWeight.w400,
                              letterSpacing: -0.18),
                        ),
                        const SizedBox(
                          height: 6,
                        ),
                        TextFormField(
                          obscureText: true,
                          autofocus: true,
                          controller: Controller.passwordController,
                          focusNode: FocusControllers.passwordFocus,
                          decoration:
                              TextInputField.field('lock.svg', 'Ex. 12345678'),
                          validator: (value) {
                            if (Controller.emailController.text.isEmpty) {
                              return 'Please enter your email';
                            }
                            return null;
                          },
                        ),
                      ],
                    )
                  ],
                ))
          ],
                ),
              ),
        ));
  }
}
