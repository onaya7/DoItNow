import 'package:doitnow/utils/colors/color_constant.dart';
import 'package:doitnow/utils/components/already_have.dart';
import 'package:doitnow/utils/components/button.dart';
import 'package:doitnow/utils/components/text_input_field.dart';
import 'package:doitnow/utils/constants/constant.dart';
import 'package:doitnow/utils/validators/validators.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  RegisterPageState createState() => RegisterPageState();
}

class RegisterPageState extends State<RegisterPage> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  late FocusNode _nameFocusNode;
  late FocusNode _emailFocusNode;
  late FocusNode _passwordFocusNode;

  @override
  void initState() {
    super.initState();
    _nameFocusNode = FocusNode();
    _emailFocusNode = FocusNode();
    _passwordFocusNode = FocusNode();
  }

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _nameFocusNode.dispose();
    _emailFocusNode.dispose();
    _passwordFocusNode.dispose();
    super.dispose();
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
                          nextFocus: _nameFocusNode,
                          iconPath: 'assets/images/vector.svg',
                          hintText: 'Ex: abc@example.com',
                          obscureText: false,
                          action: TextInputAction.next,
                          validator: (value) {
                            return Validators.validateEmail(value);
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
                        TextInputField(
                          controller: _nameController,
                          currentFocus: _nameFocusNode,
                          nextFocus: _passwordFocusNode,
                          iconPath: 'assets/images/profile.svg',
                          hintText: 'Ex. Saul Ramirez',
                          obscureText: false,
                          action: TextInputAction.next,
                          validator: (value) {
                            return Validators.validateName(value);
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
                            return Validators.validatePassword(value);
                          },
                        ),
                        const SizedBox(
                          height: 59,
                        ),
                        Button(buttonName: 'Register', formKey: _formKey),
                        const SizedBox(
                          height: 16,
                        ),
                        const AlreadyHave(authName: 'Login')
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
