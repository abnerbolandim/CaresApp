import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:health_care/screens/accountstypes/screens/cares_page/components/body.dart';

import '../need_page.dart';
import 'post_details.dart';

void signUp(String email, String password, context) async {
  try {
    await auth
        .createUserWithEmailAndPassword(
            email: CaresInputs.caresEmailController.text.trim(),
            password: CaresInputs.caresPasswordController.text.trim())
        .then(
          (value) => {
            postDetailsToFirestore(context),
          },
        );
  } on FirebaseAuthException catch (error) {
    String? errorMessage;

    switch (error.code) {
      case "invalid-email":
        errorMessage = "Your email address appears to be malformed.";
        break;
      case "wrong-password":
        errorMessage = "Your password is wrong.";
        break;
      case "user-not-found":
        errorMessage = "User with this email doesn't exist.";
        break;
      case "user-disabled":
        errorMessage = "User with this email has been disabled.";
        break;
      case "too-many-requests":
        errorMessage = "Too many requests";
        break;
      case "operation-not-allowed":
        errorMessage = "Signing in with Email and Password is not enabled.";
        break;
      default:
        errorMessage = "An undefined Error happened.";
    }
    Fluttertoast.showToast(msg: errorMessage);
    debugPrint(error.code);
  }
}
