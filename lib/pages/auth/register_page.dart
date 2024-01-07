import 'package:doitnow/utils/colors/color_constant.dart';
import 'package:doitnow/utils/components/text_input_field.dart';
import 'package:doitnow/utils/constants/constant.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  RegisterPageState createState() => RegisterPageState();
}

class RegisterPageState extends State<RegisterPage> {
  final GlobalKey formKey = GlobalKey<FormState>();
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

  void _shiftFocus(FocusNode currentFocus, FocusNode nextFocus) {
    currentFocus.unfocus();
    FocusScope.of(context).requestFocus(nextFocus);
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
                          controller: _emailController,
                          currentFocus: _emailFocusNode,
                          nextFocus: _nameFocusNode,
                          iconPath: 'assets/images/vector.svg',
                          hintText: 'Ex: abc@example.com',
                          obscureText: false,
                          action: TextInputAction.next,
                          // requestFocus: nameFocus,
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
                            obscureText: true),
                        const SizedBox(
                          height: 59,
                        ),
                        SizedBox(
                          width: Constants.deviceMaxWidth(context),
                          child: ElevatedButton(
                            style: ButtonStyle(
                                padding: MaterialStateProperty.all<EdgeInsets>(
                                    const EdgeInsets.symmetric(
                                  vertical: 16,
                                )),
                                backgroundColor:
                                    MaterialStateProperty.all<Color>(
                                        ColorConstants.deepBlueColor),
                                shape: MaterialStateProperty.all<
                                        RoundedRectangleBorder>(
                                    RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(16.0),
                                ))),
                            onPressed: () {},
                            child: Text(
                              "Register",
                              style: TextStyle(
                                  letterSpacing: -0.18,
                                  fontWeight: FontWeight.w700,
                                  color: ColorConstants.plainWhiteColor),
                            ),
                          ),
                        ),

                        // child: Container(
                        //   width: Constants.deviceMaxWidth(context),
                        //   alignment: Alignment.center,
                        //   padding: const EdgeInsets.symmetric(vertical: 16),
                        //   decoration: ShapeDecoration(
                        //       color: ColorConstants.deepBlueColor,
                        //       shape: RoundedRectangleBorder(
                        //           borderRadius: BorderRadius.circular(16))),
                        // child: Text("Register",

                        // style: TextStyle(

                        //   letterSpacing: -0.18,
                        //   fontWeight: FontWeight.w700,
                        //   color: ColorConstants.plainWhiteColor
                        // ),),
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
