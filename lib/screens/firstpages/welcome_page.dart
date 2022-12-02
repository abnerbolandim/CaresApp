import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:health_care/screens/creatorpages/chooseregistrationpages/createaccount_page.dart';

import '../accountstypes/screens/cares_page/cares_page.dart';

class WelcomePage extends StatefulWidget {
  const WelcomePage({Key? key}) : super(key: key);

  @override
  State<WelcomePage> createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Seja bem-vindo ao\nCares',
              style: GoogleFonts.sen(
                textStyle: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 40,
                ),
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(
              height: 15,
            ),
            Text(
              'O aplicativo voltado a cuidadores e\npessoas necessitadas de cuidados!',
              style: GoogleFonts.sen(
                textStyle: TextStyle(
                  fontWeight: FontWeight.w400,
                  fontSize: 20,
                ),
              ),
              textAlign: TextAlign.center,
            ),
            Image.asset(
              'assets/images/welcomePage01.png',
              height: 350,
              width: 350,
            ),
            TextButton(
              style: TextButton.styleFrom(
                primary: Colors.white,
                textStyle: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
                backgroundColor: const Color.fromRGBO(0, 101, 156, 1),
                padding:
                    const EdgeInsets.symmetric(horizontal: 100, vertical: 30),
              ),
              onPressed: () {
                Navigator.of(context).pushReplacement(
                  MaterialPageRoute(
                    builder: (context) => const CreateAccount(),
                  ),
                );
              },
              child: Text(
                'Vamos Começar!',
                style: GoogleFonts.sen(
                  textStyle: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 20,
                  ),
                ),
                textAlign: TextAlign.center,
              ),
            ),
          ],
        ),
      ),
      bottomSheet: bottomCliqueAqui(),
    );
  }
}

// ignore: camel_case_types
class bottomCliqueAqui extends StatelessWidget {
  const bottomCliqueAqui({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          'Você é um Cuidador?',
          style: GoogleFonts.sen(
            textStyle: TextStyle(
              fontSize: 17,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        const SizedBox(
          width: 2,
        ),
        TextButton(
          onPressed: () {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => const CaresPage(),
              ),
            );
          },
          child: const Text(
            'Clique Aqui!',
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
