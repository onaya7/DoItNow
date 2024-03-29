import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:doitnow/models/user_model.dart';
import 'package:doitnow/services/connectivity.dart';
import 'package:doitnow/services/firebase_auth.dart';
import 'package:doitnow/utils/colors/color_constant.dart';
import 'package:doitnow/utils/components/already_have.dart';
import 'package:doitnow/utils/components/custom_button.dart';
import 'package:doitnow/utils/components/custom_loader.dart';
import 'package:doitnow/utils/components/custom_snackbar.dart';
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
  final FirebaseAuthService _auth = FirebaseAuthService();
  final _connectivityService = ConnectivityService();

  bool _isLoading = false;

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

  Future<void> _loginUser() async {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();
      setState(() {
        _isLoading = !_isLoading;
      });

      // check for internet connection
      var connectivityResult = await _connectivityService.connectivityResult;
      if (connectivityResult == ConnectivityResult.none) {
        if (mounted) {
          CustomSnackBar.show(context, 'No internet connection');
          setState(() {
            _isLoading = !_isLoading;
          });
        }
      } else {
        UserData? user = await _auth.signInWithEmailAndPassword(
            _emailController.text, _passwordController.text);
        setState(() {
          _isLoading = !_isLoading;
        });
        if (user != null) {
          debugPrint('User logged in');
          mounted ? Navigator.pushReplacementNamed(context, '/todo') : null;
        } else {
          debugPrint('Error logging user in');
          mounted
              ? CustomSnackBar.show(context, 'Invalid Credentials!!!')
              : null;
        }
      }
    }
  }

    void _unfocusLoader() {
    Navigator.pushReplacementNamed(context, '/login');
  }


  @override
  Widget build(BuildContext context) {
    return Stack(children: <Widget>[
      Scaffold(
          body: SingleChildScrollView(
        child: Container(
          width: Constants.deviceMaxWidth(context),
          color: ColorConstants.plainWhiteColor,
          padding: const EdgeInsets.only(top: 57, left: 35, right: 36),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              GestureDetector(
                onTap: () =>
                    Navigator.pushReplacementNamed(context, '/welcome'),
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
                            validator: (value) =>
                                LoginValidators.validateEmail(value),
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
                            validator: (value) =>
                                LoginValidators.validatePassword(value),
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
                          CustomButton(
                            buttonName: 'Login',
                            onTap: _loginUser,
                          ),
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
      )),
      if (_isLoading) CustomLoader(unfocus: _unfocusLoader),
    ]);
  }
}
