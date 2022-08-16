import 'package:flutter/material.dart';

import '../../../../creatorpages/registerpages/createaccount_page.dart';

class BuildBottomNeedCares extends StatelessWidget {
  const BuildBottomNeedCares({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text(
          'Você já possui uma conta? ',
          style: TextStyle(
            fontSize: 17,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(
          width: 2,
        ),
        TextButton(
          onPressed: () {
            Navigator.of(context).pushReplacement(
              MaterialPageRoute(
                builder: (context) => const CreateAccount(),
              ),
            );
          },
          child: const Text(
            'Entre aqui!',
            style: TextStyle(
              fontSize: 17,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ],
    );
  }
}
