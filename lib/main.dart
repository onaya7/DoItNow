import 'package:doitnow/services/firebase_auth.dart';
import 'package:doitnow/utils/routes/routes.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    final FirebaseAuthService auth = FirebaseAuthService();
    return StreamProvider.value(
      initialData: auth.user,
      value: auth.user,
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        initialRoute: '/',
        theme: ThemeData(useMaterial3: true, fontFamily: 'Inter'),
        onGenerateRoute: routes,
      ),
    );
  }
}
