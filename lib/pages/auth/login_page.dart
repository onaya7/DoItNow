import 'package:doitnow/utils/colors/color_constant.dart';
import 'package:doitnow/utils/components/already_have.dart';
import 'package:doitnow/utils/components/auth_button.dart';
import 'package:doitnow/utils/components/google_auth_button.dart';
import 'package:doitnow/utils/components/text_input_field.dart';
import 'package:doitnow/utils/constants/constant.dart';
import 'package:doitnow/utils/validators/validators.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  late FocusNode _emailFocusNode;
  late FocusNode _passwordFocusNode;

  @override
  void initState() {
    super.initState();
    _emailFocusNode = FocusNode();
    _passwordFocusNode = FocusNode();
  }

  @override
  void dispose() {
    super.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _emailFocusNode.dispose();
    _passwordFocusNode.dispose();
  }

  @override
  Widget build(BuildContext context) {
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
              'Login',
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
                    text:
                        'Login now to manage all your tasks effortlessly in one place! ',
                    style: TextStyle(
                        color: ColorConstants.deepGreyColor,
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                        letterSpacing: -0.18),
                  ),
                ]),
              ),
            ),
            const SizedBox(
              height: 38,
            ),
            Form(
                key: _formKey,
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
                          controller: _emailController,
                          currentFocus: _emailFocusNode,
                          nextFocus: _passwordFocusNode,
                          iconPath: 'assets/images/vector.svg',
                          hintText: 'Ex: abc@example.com',
                          obscureText: false,
                          action: TextInputAction.next,
                          validator: (value) {
                            return LoginValidators.validateEmail(value);
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
                        TextInputField(
                          controller: _passwordController,
                          currentFocus: _passwordFocusNode,
                          iconPath: 'assets/images/lock.svg',
                          hintText: 'Ex. 12345678',
                          action: TextInputAction.done,
                          obscureText: true,
                          validator: (value) {
                            return LoginValidators.validatePassword(value);
                          },
                        ),
                        const SizedBox(
                          height: 6,
                        ),
                        Text(
                          'Forgot Password?',
                          style: TextStyle(
                              decoration: TextDecoration.underline,
                              decorationColor: ColorConstants.deepBlueColor,
                              color: ColorConstants.deepBlueColor,
                              fontSize: 12,
                              fontWeight: FontWeight.w400,
                              letterSpacing: -0.13),
                        ),
                        const SizedBox(
                          height: 28,
                        ),
                        AuthButton(
                            buttonName: 'Login',
                            formKey: _formKey,
                            emailControllervalue: _emailController.text,
                            passwordControllervalue: _passwordController.text),
                        const SizedBox(
                          height: 29,
                        ),
                        Divider(
                          color: ColorConstants.plainBlackColor,
                          thickness: 1,
                        ),
                        const SizedBox(
                          height: 29,
                        ),
                        const GoogleAuthButton(),
                        const SizedBox(
                          height: 40,
                        ),
                        const AlreadyHave(
                            text: 'Don\'t have an account?',
                            authName: 'Register')
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
