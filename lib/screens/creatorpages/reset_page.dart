import 'package:fluttertoast/fluttertoast.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:health_care/screens/homepagepaste/home_page.dart';

import 'chooseregistrationpages/createaccount_page.dart';

class ResetPage extends StatefulWidget {
  const ResetPage({Key? key}) : super(key: key);

  @override
  State<ResetPage> createState() => _ResetPageState();
}

class _ResetPageState extends State<ResetPage> {
  final _formKey = GlobalKey<FormState>();

  final _resetEmailController = TextEditingController();

  final _auth = FirebaseAuth.instance;

  String? errorMessage;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new),
          onPressed: () {
            Navigator.of(context).pop();
          },
          color: Colors.black,
        ),
        elevation: 0,
        backgroundColor: Colors.transparent,
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SingleChildScrollView(
                padding: const EdgeInsets.all(16),
                child: Form(
                  key: _formKey,
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        RichText(
                          textAlign: TextAlign.center,
                          text: const TextSpan(
                            text: 'Resetar ',
                            style: TextStyle(
                              fontSize: 35,
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                            ),
                            children: [
                              TextSpan(
                                text: 'a Senha',
                                style: TextStyle(
                                  fontSize: 35,
                                  color: Colors.black,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ],
                          ),
                        ),

                        const SizedBox(
                          height: 30,
                        ),

                        const Text(
                          'Informe o e-mail utilizado na sua conta:',
                          style: TextStyle(
                              fontSize: 15, fontWeight: FontWeight.w500),
                          textAlign: TextAlign.center,
                        ),

                        const SizedBox(
                          height: 30,
                        ),

                        //email

                        TextFormField(
                          decoration: const InputDecoration(
                            hintText: 'name@example.com',
                            labelText: 'E-mail',
                            prefixIcon: Icon(Icons.mail),
                            border: OutlineInputBorder(),
                          ),
                          controller: _resetEmailController,
                          keyboardType: TextInputType.emailAddress,
                          validator: (email) {
                            if (email == null || email.isEmpty) {
                              return 'Por favor, digite seu e-mail';
                            } else if (!RegExp(
                                    r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                                .hasMatch(_resetEmailController.text)) {
                              return 'Por favor, digite um e-mail correto';
                            }
                            return null;
                          },
                        ),

                        const SizedBox(
                          height: 15,
                        ),

                        const SizedBox(
                          height: 25,
                        ),

                        TextButton(
                          style: TextButton.styleFrom(
                            textStyle: const TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                            backgroundColor:
                                const Color.fromRGBO(0, 101, 156, 1),
                            primary: Colors.white,
                            padding: const EdgeInsets.symmetric(
                                horizontal: 95, vertical: 20),
                          ),
                          onPressed: () {
                            FirebaseAuth.instance
                                .sendPasswordResetEmail(
                                    email: _resetEmailController.text.trim())
                                .then((value) => Navigator.of(context).pop());
                          },
                          child: const Text('Redefinir Senha'),
                        ),

                        const SizedBox(
                          height: 10,
                        ),
                      ]),
                )),
          ],
        ),
      ),
      bottomNavigationBar: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text(
            'Você não tem conta?',
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
              'Crie uma Conta',
              style: TextStyle(
                fontSize: 17,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
    );
  }

  void signIn(String email, String password) async {
    if (_formKey.currentState!.validate()) {
      try {
        await _auth
            .signInWithEmailAndPassword(email: email, password: password)
            .then((uid) => {
                  Fluttertoast.showToast(msg: "Login Efetuado com Sucesso"),
                  Navigator.of(context).pushReplacement(MaterialPageRoute(
                      builder: (context) => const HomePage())),
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
        Fluttertoast.showToast(msg: errorMessage!);
        debugPrint(error.code);
      }
    }
  }
}
