
import 'package:doitnow/pages/auth/login_page.dart';
import 'package:doitnow/pages/auth/register_page.dart';
import 'package:doitnow/pages/auth/welcome_page.dart';
import 'package:doitnow/pages/auth/wrapper.dart';
import 'package:flutter/material.dart';

Route routes(RouteSettings settings) {
  switch (settings.name) {
    case '/wrapper':
      return MaterialPageRoute(builder: (_) => const Wrapper());
    case '/login':
      return MaterialPageRoute(builder: (_) => const LoginPage());
    case '/register':
      return MaterialPageRoute(builder: (_) => const RegisterPage());
    default:
      return MaterialPageRoute(builder: (_) => const WelcomePage());
  }
}
