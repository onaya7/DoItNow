import 'package:doitnow/models/user_model.dart';
import 'package:doitnow/pages/home/home_page.dart';
import 'package:doitnow/pages/onboarding/welcome_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Wrapper extends StatelessWidget {
  const Wrapper({super.key});

  @override
  Widget build(BuildContext context) {
    final UserData? user = Provider.of<UserData?>(context);
    debugPrint('hello there $user');
    if (user != null) {
      return HomePage();
    } else {
      return const WelcomePage();
    }
  }
}
