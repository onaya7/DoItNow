import 'package:doitnow/models/user_model.dart';
import 'package:doitnow/services/firebase_auth.dart';
import 'package:doitnow/utils/colors/color_constant.dart';
import 'package:doitnow/utils/constants/constant.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class AuthButton extends StatefulWidget {
  final String buttonName;
  final String emailControllervalue;
  final String? nameControllervalue;
  final String passwordControllervalue;
  final GlobalKey<FormState> formKey;

  const AuthButton({
    required this.buttonName,
    required this.emailControllervalue,
    this.nameControllervalue,
    required this.passwordControllervalue,
    required this.formKey,
    super.key,
  });

  @override
  State<AuthButton> createState() => _AuthButtonState();
}

class _AuthButtonState extends State<AuthButton> {
  final FirebaseAuthService _auth = FirebaseAuthService();
  bool _isloading = false;

  toogleLoading() {
    setState(() {
      _isloading = !_isloading;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: Constants.deviceMaxWidth(context),
      decoration: ShapeDecoration(
          color: ColorConstants.deepBlueColor,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(16))),
      child: ElevatedButton(
        style: ButtonStyle(
            padding: MaterialStateProperty.all<EdgeInsets>(
                const EdgeInsets.symmetric(
              vertical: 16,
            )),
            backgroundColor:
                MaterialStateProperty.all<Color>(ColorConstants.deepBlueColor),
            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16.0),
            ))),
        child: Text(
          widget.buttonName,
          style: TextStyle(
              letterSpacing: -0.18,
              fontWeight: FontWeight.w700,
              color: ColorConstants.plainWhiteColor),
        ),
        onPressed: () async {
          if (widget.formKey.currentState!.validate()) {
            if (widget.buttonName == 'Login') {
              Navigator.pushNamed(context, '/home');
            } else if (widget.buttonName == 'Register') {
              UserData? result = await _auth.registerWithEmailAndPassword(
                  widget.emailControllervalue, widget.passwordControllervalue);
              if (result != null) {
                debugPrint("hello ${result.email}");
                debugPrint('Register success');
              }
            } else {
              debugPrint('No user');
            }

            debugPrint('Button pressed');
          }
        },
      ),
    );
  }
}
