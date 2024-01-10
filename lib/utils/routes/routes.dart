import 'package:doitnow/pages/auth/login_page.dart';
import 'package:doitnow/pages/auth/register_page.dart';
import 'package:doitnow/pages/onboarding/welcome_page.dart';
import 'package:doitnow/pages/wrapper.dart';
import 'package:flutter/material.dart';

Route routes(RouteSettings settings) {
  switch (settings.name) {
    case '/welcome':
      return MaterialPageRoute(builder: (_) => const WelcomePage());
    case '/login':
      return MaterialPageRoute(builder: (_) => const LoginPage());
    case '/register':
      return MaterialPageRoute(builder: (_) => const RegisterPage());
    default:
      return MaterialPageRoute(builder: (_) => const Wrapper());
  }
}
