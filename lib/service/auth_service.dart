import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:loader_overlay/loader_overlay.dart';

class AuthServices {
  static final auth = FirebaseAuth.instance;
  static createUser(
    BuildContext context,
    String name,
    String email,
    String pass,
  ) async {
    context.loaderOverlay.show();
    try {
      final userCredential = await auth.createUserWithEmailAndPassword(
        email: email,
        password: pass,
      );
      await userCredential.user?.updateDisplayName(name);
      Navigator.pop(context);
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        showMsg(context, e.message.toString());
      }
    }
  }

  static login(BuildContext context, String email, String pass) async {
    context.loaderOverlay.show();
    try {
      await auth.signInWithEmailAndPassword(email: email, password: pass);
    } on FirebaseAuthException catch (e) {
      if (e.code == 'Invalid Login _Credentials') {
        showMsg(context, e.message.toString());
      }
    }
    context.loaderOverlay.hide();
  }

  static showMsg(context, String msg) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(msg)));
  }
}
