import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:doitnow/data/todo_item.dart';
import 'package:doitnow/models/user_model.dart';
import 'package:doitnow/services/connectivity.dart';
import 'package:doitnow/services/firebase_auth.dart';
import 'package:doitnow/services/hiveservice.dart';
import 'package:doitnow/utils/colors/color_constant.dart';
import 'package:doitnow/utils/components/custom_snackbar.dart';
import 'package:doitnow/utils/routes/routes.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:provider/provider.dart';

import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  await Hive.initFlutter();
  Hive.registerAdapter(TodoItemAdapter());
  await HiveService.openTodoBox;
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final _auth = FirebaseAuthService();
  final _connectivityService = ConnectivityService();

  MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: ColorConstants.deepBlueColor, // Set status bar color
      statusBarIconBrightness: Brightness.light, // Set status bar icon color
      systemNavigationBarColor:
          ColorConstants.plainWhiteColor, // Set navigation bar color
      systemNavigationBarIconBrightness: Brightness.light,
    ));
    return StreamProvider<UserData?>(
      create: (context) => _auth.userChanges,
      initialData: null,
      child: StreamProvider<ConnectivityResult>.value(
          value: _connectivityService.connectivityStream,
          initialData: ConnectivityResult.none,
          child: MaterialApp(
            debugShowCheckedModeBanner: false,
            initialRoute: '/',
            theme: ThemeData(
                useMaterial3: true,
                fontFamily: 'Inter',
                scrollbarTheme: ScrollbarThemeData(
                    thumbColor:
                        MaterialStateProperty.all(ColorConstants.iconColor),
                    trackColor: MaterialStateProperty.all(
                        ColorConstants.deepBlueColor.withOpacity(0.2)),
                    thickness: MaterialStateProperty.all(8.0),
                    radius: const Radius.circular(10))),
            onGenerateRoute: routes,
            builder: (context, child) => SafeArea(
              child: Scaffold(
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
                      } else {
                        WidgetsBinding.instance.addPostFrameCallback((_) {
                          CustomSnackBar.show(
                              context, 'Internet connection restored');
                        });
                      }
                      return const SizedBox();
                    }),
              ),
            ),
          )),
    );
  }
}
