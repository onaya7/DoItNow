import 'package:doitnow/models/user_model.dart';
import 'package:doitnow/pages/home/home_page.dart';
import 'package:doitnow/pages/onboarding/welcome_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AuthWrapper extends StatelessWidget {
  const AuthWrapper({super.key});

  @override
  Widget build(BuildContext context) {
    final UserData? user = Provider.of<UserData?>(context);
    debugPrint('hello there ${user?.email}');
    if (user == null) {
      debugPrint('No user logged in');
      return const WelcomePage();
    } else {
      debugPrint('Logged in as ${user.email}');
      return HomePage();
    }
  }
}
