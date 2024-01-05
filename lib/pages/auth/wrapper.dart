import 'package:flutter/material.dart';

class Wrapper extends StatelessWidget {
  const Wrapper({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AppBar(
        title: const Text('Wrapper Page'),
      ),
    );
  }
}
