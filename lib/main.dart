import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:doitnow/models/user_model.dart';
import 'package:doitnow/services/connectivity.dart';
import 'package:doitnow/services/firebase_auth.dart';
import 'package:doitnow/utils/components/custom_snackbar.dart';
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
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final _auth = FirebaseAuthService();
  final _connectivityService = ConnectivityService();

  MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return StreamProvider<UserData?>(
      create: (context) => _auth.userChanges,
      initialData: null,
      child: StreamProvider<ConnectivityResult>.value(
          value: _connectivityService.connectivityStream,
          initialData: ConnectivityResult.none,
          child: MaterialApp(
            debugShowCheckedModeBanner: false,
            initialRoute: '/',
            theme: ThemeData(useMaterial3: true, fontFamily: 'Inter'),
            onGenerateRoute: routes,
            builder: (context, child) => Scaffold(
              body: child,
              bottomNavigationBar: StreamBuilder<ConnectivityResult>(
                  stream: _connectivityService.connectivityStream,
                  builder: (context, snapshot) {
                    if (snapshot.data == ConnectivityResult.none) {
                      WidgetsBinding.instance.addPostFrameCallback((_) {
                        CustomSnackBar.show(
                          context,
                          'No internet connection',
                        );
                      });
                    }
                    return const SizedBox
                        .shrink(); // Return an empty widget if there's an internet connection
                  }),
            ),
          )),
    );
  }
}
