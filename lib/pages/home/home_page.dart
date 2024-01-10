import 'package:doitnow/services/firebase_auth.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  final _auth = FirebaseAuthService();
  HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
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
          child: const Center(
            child: Text('Home Page'),
          ),
        ));
  }
}
