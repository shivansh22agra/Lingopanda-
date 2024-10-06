import 'package:boomer/views/dashBoardViews/home_page.dart';
import 'package:boomer/views/sign_in.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  bool isLoading = false;
  // Sign up method
  Future<User?> signUp(
      String email, String password, BuildContext context) async {
    try {
      UserCredential userCredential =
          await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('SuccessFully Sign Up'),
        ),
      );
      Navigator.push(
        context,
        PageRouteBuilder(
          transitionDuration: const Duration(milliseconds: 800),
          reverseTransitionDuration: const Duration(milliseconds: 800),
          pageBuilder: (_, __, ___) => FadeTransition(
            opacity: __,
            child: SignIn(),
          ),
        ),
      );
      return userCredential.user;
    } on FirebaseAuthException catch (error) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(error.message!),
        ),
      );
      return null;
    }
  }

  // Sign in method
  Future<User?> signIn(
      String email, String password, BuildContext context) async {
    try {
      UserCredential userCredential = await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('SuccessFully Sign In'),
        ),
      );
      Navigator.push(
        context,
        PageRouteBuilder(
          transitionDuration: const Duration(milliseconds: 800),
          reverseTransitionDuration: const Duration(milliseconds: 800),
          pageBuilder: (_, __, ___) => FadeTransition(
            opacity: __,
            child: const HomePage(),
          ),
        ),
      );
      return userCredential.user;
    } on FirebaseAuthException catch (e) {
      print(e.message);
      return null;
    }
  }

  // Sign out method
  Future<void> signOut() async {
    await _auth.signOut();
  }
}
