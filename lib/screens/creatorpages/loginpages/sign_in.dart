import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../../homepagepaste/home_page.dart';

signIn(String email, String password, context) async {
  final _auth = FirebaseAuth.instance;

  String? errorMessage;

  try {
    await _auth
        .signInWithEmailAndPassword(email: email, password: password)
        .then((uid) => {
              Fluttertoast.showToast(msg: "Login Efetuado com Sucesso"),
              Navigator.of(context).pushReplacement(
                  MaterialPageRoute(builder: (context) => const HomePage())),
            });
  } on FirebaseAuthException catch (error) {
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
