import 'package:doitnow/models/user_model.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class FirebaseAuthService {
  final _auth = FirebaseAuth.instance;

  UserData? _userFromFirebaseUser(User? user) {
    return user != null
        ? UserData(uid: user.uid, email: user.email, name: user.displayName)
        : null;
  }

   Stream<UserData?> get user {
    return _auth.authStateChanges().map(_userFromFirebaseUser); 
  }

  Future<UserData?> registerWithEmailAndPassword(
      String email, String password) async {
    try {
      final UserCredential userCredential =
          await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      User? user = userCredential.user;
      return _userFromFirebaseUser(user);
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        debugPrint('The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        debugPrint('The account already exists for that email.');
      }
    } catch (e) {
      debugPrint('$e');
    }
    return null;
  }


  Future<UserData?> signInWithEmailAndPassword(
      String email, String password) async {
    try {
      final UserCredential userCredential =
          await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      User? user = userCredential.user;
      return _userFromFirebaseUser(user);
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        debugPrint('No user found for that email.');
      } else if (e.code == 'wrong-password') {
        debugPrint('Wrong password provided for that user.');
      }
    }
    return null;
  }


  Future<void> signOut() async {
    await _auth.signOut();
  }




}

