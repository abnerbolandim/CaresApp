import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:health_care/screens/accountstypes/screens/cares_page/components/body.dart';
import 'package:health_care/screens/accountstypes/screens/verify_pages/verify_pages.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

import '../cares_page/components/sign_up.dart';

class VerifyOTP extends StatefulWidget {
  const VerifyOTP({Key? key}) : super(key: key);

  @override
  State<VerifyOTP> createState() => _VerifyOTPState();
}

class _VerifyOTPState extends State<VerifyOTP> {
  User? user = FirebaseAuth.instance.currentUser;

  @override
  void initState() {
    setState(() {
      number = countryDial + CaresInputs.caresTelefoneController.text;
    });

    verifyPhone(number);

    super.initState();
  }

  String otpPin = " ";
  String verID = " ";
  String number = "";

  Future<void> verifyPhone(String number) async {
    await FirebaseAuth.instance.verifyPhoneNumber(
      phoneNumber: number,
      timeout: const Duration(seconds: 30),
      verificationCompleted: (PhoneAuthCredential credential) {
        Fluttertoast.showToast(msg: "Verificação Concluída!");
      },
      verificationFailed: (FirebaseException e) {
        Fluttertoast.showToast(msg: "Verificação Falhou!");
      },
      codeSent: (String verificationId, int? resendToken) {
        Fluttertoast.showToast(msg: "Código Enviado!");
        verID = verificationId;
      },
      codeAutoRetrievalTimeout: (String verificationId) {
        Fluttertoast.showToast(msg: "Tempo de Verificação Expirou!");
      },
    );
  }

  smsOTP() async {
    await FirebaseAuth.instance
        .signInWithCredential(
      PhoneAuthProvider.credential(
        verificationId: verID,
        smsCode: otpPin,
      ),
    )
        .whenComplete(() {
      signUp(
        CaresInputs.caresEmailController.text,
        CaresInputs.caresPasswordController.text,
        context,
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          RichText(
            textAlign: TextAlign.center,
            text: TextSpan(
              children: [
                const TextSpan(
                  text: "Enviamos o código para\n",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 16,
                  ),
                ),
                TextSpan(
                  text: sms
                      ? CaresInputs.caresTelefoneController.text
                      : CaresInputs.caresEmailController.text,
                  style: const TextStyle(
                    color: Colors.black,
                    fontSize: 16,
                  ),
                ),
                const TextSpan(
                  text: "\n\n\nInsira o código para continuar!",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 16,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: MediaQuery.of(context).size.width / 12,
            ),
            child: PinCodeTextField(
              keyboardType: TextInputType.number,
              appContext: context,
              length: 6,
              onChanged: (value) {
                if (value.length == 6) {
                  setState(() {
                    otpPin = value;
                  });

                  //TODO: sms ? smsOTP() : emailOTP();

                  smsOTP();
                }
              },
              pinTheme: PinTheme(
                activeColor: Colors.blue,
                selectedColor: Colors.blue,
                inactiveColor: Colors.black26,
              ),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                "Não recebeu o código?",
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 16,
                ),
              ),
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: const Text(
                  "Reenviar",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 16,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
