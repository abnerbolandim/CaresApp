import 'package:flutter/material.dart';
import 'components/app_bar.dart';
import 'components/body.dart';
import 'components/bottom.dart';

class NeedCarePage extends StatelessWidget {
  const NeedCarePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBarNeedCares(context),
      body: const BuildBodyNeedCares(),
      bottomNavigationBar: const BuildBottomNeedCares(),
    );
  }
}
