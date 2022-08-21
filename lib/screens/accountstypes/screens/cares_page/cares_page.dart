import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'components/bottom.dart';
import 'components/app_bar.dart';
import 'components/body.dart';

class CaresPage extends StatefulWidget {
  const CaresPage({Key? key}) : super(key: key);

  @override
  State<CaresPage> createState() => _CaresPage();
}

final auth = FirebaseAuth.instance;
final formKey = GlobalKey<FormState>();

class _CaresPage extends State<CaresPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBarCaresPage(context),
      body: const BuildBodyCaresPage(),
      bottomNavigationBar: const BuildBottomCaresPage(),
    );
  }
}
