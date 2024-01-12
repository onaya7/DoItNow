import 'package:doitnow/models/user_model.dart';
import 'package:doitnow/services/firebase_auth.dart';
import 'package:doitnow/utils/components/custom_loader.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class TodoPage extends StatefulWidget {
  const TodoPage({super.key});

  @override
  State<TodoPage> createState() => _TodoPageState();
}

class _TodoPageState extends State<TodoPage> {
  final _auth = FirebaseAuthService();
  bool _isLoading = false;

  void _logoutUser() async {
    setState(() {
      _isLoading = !_isLoading;
    });
    // await _auth.signOut();
    // setState(() {
    //   _isLoading = !_isLoading;
    // });
    // mounted ? Navigator.pushReplacementNamed(context, '/welcome') : null;
  }

    void _unfocusLoader() {
    Navigator.pushReplacementNamed(context, '/todo');
  }

  @override
  Widget build(BuildContext context) {
    final UserData? user = Provider.of<UserData?>(context);
    return Stack(
      children: <Widget>[
        Scaffold(
            appBar: AppBar(
              automaticallyImplyLeading: false,
              title: const Text('Home Page'),
              actions: [
                IconButton(
                    icon: const Icon(Icons.logout), onPressed: _logoutUser),
              ],
            ),
            body: Container(
              child: Center(
                child: Text('Welcome ${user?.email}'),
              ),
            )),
        if (_isLoading) CustomLoader(unfocus: _unfocusLoader),
      ],
    );
  }
}
