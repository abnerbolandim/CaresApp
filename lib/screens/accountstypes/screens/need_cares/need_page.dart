import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'components/bottom.dart';
import 'components/app_bar.dart';
import 'components/body.dart';

class NeedCarePage extends StatefulWidget {
  const NeedCarePage({Key? key}) : super(key: key);

  @override
  State<NeedCarePage> createState() => _NeedCarePage();
}

final auth = FirebaseAuth.instance;
final formKey = GlobalKey<FormState>();

class _NeedCarePage extends State<NeedCarePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBarNeedCarePage(context),
      body: const BuildBodyNeedCarePage(),
      bottomNavigationBar: const BuildBottomNeedCarePage(),
    );
  }
}
