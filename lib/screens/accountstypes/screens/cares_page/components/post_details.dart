import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../../../../../model/user_model.dart';
import '../../verify_pages/verify_pages.dart';
import '../cares_page.dart';
import 'body.dart';

postDetailsToFirestore(context) async {
  FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
  User? user = auth.currentUser;

  UserModel userModel = UserModel();

  userModel.email = user!.email;
  userModel.uid = user.uid;
  userModel.name = CaresInputs.caresNameEditingController.text;

  await firebaseFirestore
      .collection("users")
      .doc(user.uid)
      .set(userModel.toMap());
  Fluttertoast.showToast(msg: "Conta criada com sucesso!");

  Navigator.pushAndRemoveUntil((context),
      MaterialPageRoute(builder: (context) => VerifyPage()), (route) => false);
}