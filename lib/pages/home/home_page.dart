import 'package:doitnow/models/user_model.dart';
import 'package:doitnow/services/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {
  final _auth = FirebaseAuthService();
  HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final UserData? user = Provider.of<UserData?>(context);
    return Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          title: const Text('Home Page'),
          actions: [
            IconButton(
              icon: const Icon(Icons.logout),
              onPressed: () {
                _auth.signOut();
              },
            ),
          ],
        ),
        body: Container(
          child: Center(
            child: Text('Welcome ${user?.email}'),
          ),
        ));
  }
}
