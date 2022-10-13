import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:health_care/screens/accountstypes/screens/need_cares/components/body.dart';

import '../../../../homepagepaste/home_page.dart';
import '../need_page.dart';
import 'post_details.dart';

void signUp(String email, String password, context) async {
  try {
    await auth
        .createUserWithEmailAndPassword(
            email: NeedInputs.needEmailController.text.trim(),
            password: NeedInputs.needPasswordController.text.trim())
        .then(
          (value) => {
            postDetailsToFirestore(context),
          },
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
        errorMessage = "Seu endereço de e-mail parece estar incorreto.";
        break;
      case "wrong-password":
        errorMessage = "Sua senha está errada.";
        break;
      case "user-not-found":
        errorMessage = "O usuário com este e-mail não existe.";
        break;
      case "user-disabled":
        errorMessage = "O usuário com este e-mail foi desativado.";
        break;
      case "too-many-requests":
        errorMessage = "Muitos pedidos.";
        break;
      case "operation-not-allowed":
        errorMessage = "Entrar com e-mail e senha não está ativado.";
        break;
      default:
        errorMessage = "Ocorreu um erro indefinido.";
    }
    Fluttertoast.showToast(msg: errorMessage);
    debugPrint(error.code);
  }
}
