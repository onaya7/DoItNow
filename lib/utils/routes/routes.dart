import 'package:doitnow/pages/auth/login_page.dart';
import 'package:doitnow/pages/auth/register_page.dart';
import 'package:doitnow/pages/home/addtodo_page.dart';
import 'package:doitnow/pages/home/completedtodo_page.dart';
import 'package:doitnow/pages/home/edittodo_page.dart';
import 'package:doitnow/pages/home/todo_page.dart';
import 'package:doitnow/pages/onboarding/welcome_page.dart';
import 'package:doitnow/pages/wrapper.dart';
import 'package:flutter/material.dart';

Route routes(RouteSettings settings) {
  switch (settings.name) {
    case '/':
      return MaterialPageRoute(builder: (_) => const AuthWrapper());
    case '/welcome':
      return MaterialPageRoute(builder: (_) => const WelcomePage());
    case '/login':
      return MaterialPageRoute(builder: (_) => const LoginPage());
    case '/register':
      return MaterialPageRoute(builder: (_) => const RegisterPage());
    case '/todo':
      return MaterialPageRoute(builder: (_) => const TodoPage());
    case '/addtodo':
      return MaterialPageRoute(builder: (_) => const AddTodoPage());
    case '/edittodo':
      return MaterialPageRoute(
          builder: (_) =>
              const EditTodoPage(id:"", title: "", description: ""));
    case '/completedtodo':
      return MaterialPageRoute(builder: (_) => const CompletedTodoPage());

    default:
      return MaterialPageRoute(builder: (_) => const AuthWrapper());
  }
}
