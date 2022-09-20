import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:health_care/screens/accountstypes/screens/cares_page/components/body.dart';
import 'package:health_care/screens/homepagepaste/home_page.dart';

import '../../../../creatorpages/registerpages/register_page.dart';
import '../cares_page.dart';
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

    /*
      quando selecionar cuidador, dar setState na variavel cuidador como true

      quando selecionar paciente, dar setState na variavel cuidador como false
    */

    Cuidador == true
        ? Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) => const teste(),
            ),
          )
        : Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) => const HomePage(),
            ),
          );

    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) => const HomePage(),
      ),
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

class teste extends StatefulWidget {
  const teste({Key? key}) : super(key: key);

  @override
  State<teste> createState() => _testeState();
}

class _testeState extends State<teste> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(child: Text('teste')),
    );
  }
}
