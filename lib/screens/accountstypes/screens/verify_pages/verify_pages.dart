import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:health_care/screens/accountstypes/screens/verify_pages/verify_otp.dart';
import 'package:health_care/screens/creatorpages/chooseregistrationpages/createaccount_page.dart';
import 'package:health_care/screens/creatorpages/registerpages/register_page.dart';
import '../../../../model/user_model.dart';
import '../cares_page/components/body.dart';
import '../cares_page/components/sign_up.dart';

// ignore: use_key_in_widget_constructors
bool sms = false;

class VerifyPage extends StatefulWidget {
  const VerifyPage({Key? key}) : super(key: key);

  @override
  State<VerifyPage> createState() => _VerifyPageState();
}

class _VerifyPageState extends State<VerifyPage> {
  UserModel loggedInUser = UserModel();
  Timer? timer;
  User? user = FirebaseAuth.instance.currentUser;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const RegisterPage(),
              ),
            );
          },
          color: Colors.black,
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                'assets/images/verifyScreen01.png',
                width: size.width / 1.4,
              ),
              const SizedBox(
                height: 30,
              ),
              const Text(
                'AUTENTICAÇÃO',
                style: TextStyle(fontSize: 40, fontWeight: FontWeight.w700),
                textAlign: TextAlign.center,
              ),
              const SizedBox(
                height: 10,
              ),
              const Text(
                'Agora precisamos que você\nnos confirme quem é!\n\nComo quer que seja?',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
                textAlign: TextAlign.center,
              ),
              const SizedBox(
                height: 5,
              ),
              const SizedBox(height: 20),
              ElevatedButton.icon(
                style: ElevatedButton.styleFrom(
                  // ignore: deprecated_member_use
                  primary: const Color.fromARGB(255, 73, 93, 184),
                  minimumSize: const Size.fromHeight(50),
                ),
                icon: const Icon(Icons.email_outlined, size: 32),
                label: const Text(
                  'E-Mail',
                  style: TextStyle(fontSize: 25),
                ),
                onPressed: () => {
                  setState(() {
                    sms = false;
                  }),
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const VerifyOTP(),
                    ),
                  ),
                },
              ),
              const SizedBox(
                height: 15,
              ),
              ElevatedButton.icon(
                style: ElevatedButton.styleFrom(
                  // ignore: deprecated_member_use
                  primary: const Color.fromARGB(255, 73, 93, 184),
                  minimumSize: const Size.fromHeight(50),
                ),
                icon: const Icon(Icons.message, size: 32),
                label: const Text(
                  'Mensagem SMS',
                  style: TextStyle(fontSize: 25),
                ),
                onPressed: () => {
                  setState(() {
                    sms = true;
                  }),

                  signUp(
                    CaresInputs.caresEmailController.text,
                    CaresInputs.caresPasswordController.text,
                    context,
                  )
                  // Navigator.push(
                  //   context,
                  //   MaterialPageRoute(
                  //     // builder: (context) => const VerifyOTP(),
                  //     builder: (context) => const (),
                  //   ),
                  // ),
                },
              ),
              const SizedBox(
                height: 15,
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            // ignore: deprecated_member_use
            primary: Colors.white,
            minimumSize: const Size.fromHeight(50),
            side: const BorderSide(
              color: Color.fromRGBO(0, 101, 156, 1),
            ),
          ),
          onPressed: () {
            Navigator.of(context).pushReplacement(
              MaterialPageRoute(
                builder: (context) => const CreateAccount(),
              ),
            );
          },
          child: const Text(
            "Cancelar",
            style: TextStyle(
              fontSize: 25,
              color: Color.fromRGBO(0, 101, 156, 1),
            ),
          ),
        ),
      ),
    );
  }
}
