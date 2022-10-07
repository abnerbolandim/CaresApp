import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
// ignore: unused_import
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
// ignore: unused_import
import 'package:health_care/screens/homepagepaste/home_page.dart';

import '../../../../../model/user_model.dart';
import '../cares_page.dart';
import 'body.dart';

postDetailsToFirestore(context) async {
  FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
  User? user = auth.currentUser;

  UserModel userModel = UserModel();

  userModel.email = user!.email;
  userModel.uid = user.uid;
  userModel.name = CaresInputs.caresNameEditingController.text;
  userModel.location = CaresInputs.caresLocationEditingController.text;
  userModel.telefone = CaresInputs.caresTelefoneEditingController.text;

  await firebaseFirestore
      .collection("users")
      .doc(user.uid)
      .set(userModel.toMap());
  Fluttertoast.showToast(msg: "Conta criada com sucesso!");

  Navigator.pushReplacement(
    context,
    MaterialPageRoute(
      builder: (context) => const HomePage(),
    ),
  );
}
