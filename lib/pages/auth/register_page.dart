import 'package:doitnow/utils/colors/color_constant.dart';
import 'package:doitnow/utils/components/text_input_field.dart';
import 'package:doitnow/utils/constants/constant.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  late TextEditingController emailController;
  late TextEditingController nameController;
  late TextEditingController passwordController;
  late FocusNode emailFocus;
  late FocusNode nameFocus;
  late FocusNode passwordFocus;
  @override
  void initState() {
    super.initState();
    emailController = TextEditingController();
    nameController = TextEditingController();
    passwordController = TextEditingController();
    emailFocus = FocusNode();
    nameFocus = FocusNode();
    passwordFocus = FocusNode();
  }

  @override
  void dispose() {
    emailController.dispose();
    nameController.dispose();
    passwordController.dispose();
    emailFocus.dispose();
    nameFocus.dispose();
    passwordFocus.dispose();
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
            GestureDetector(
              onTap: () => Navigator.pop(context),
              child: SvgPicture.asset(
                'assets/images/arrow-left.svg',
                width: 38,
                height: 38,
              ),
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
                        TextInputField(
                          controller: emailController,
                          focus: emailFocus,
                          iconPath: 'assets/images/vector.svg',
                          hintText: 'Ex: abc@example.com',
                          obscureText: false,
                          action: TextInputAction.next,
                          requestFocus: nameFocus,
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
                        TextInputField(
                          controller: nameController,
                          focus: nameFocus,
                          iconPath: 'assets/images/profile.svg',
                          hintText: 'Ex. Saul Ramirez',
                          obscureText: false,
                          action: TextInputAction.none,
                          requestFocus: passwordFocus,
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
                        TextInputField(
                            controller: passwordController,
                            focus: passwordFocus,
                            iconPath: 'assets/images/lock.svg',
                            hintText: 'Ex. 12345678',
                            action: TextInputAction.none,
                            obscureText: true),
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
