import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:health_care/screens/creatorpages/loginpages/sign_in.dart';
import '../chooseregistrationpages/createaccount_page.dart';
import '../reset_page.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();

  String? errorMessage;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new),
          onPressed: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => const CreateAccount()));
          },
          color: Colors.black,
        ),
        title: RichText(
          textAlign: TextAlign.center,
          text: const TextSpan(
            text: 'Entre ',
            style: TextStyle(
              fontSize: 35,
              color: Colors.black,
              fontWeight: FontWeight.bold,
            ),
            children: [
              TextSpan(
                text: 'Agora',
                style: TextStyle(
                  fontSize: 35,
                  color: Colors.black,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
        ),
        elevation: 0,
        backgroundColor: Colors.transparent,
        centerTitle: true,
      ),
      body: Center(
        child: SingleChildScrollView(
            padding: const EdgeInsets.all(16),
            child: Form(
              key: _formKey,
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      'assets/images/loginPage01.png',
                      height: 280,
                      width: 280,
                    ),

                    const Text(
                      'OLÁ NOVAMENTE',
                      style:
                          TextStyle(fontSize: 35, fontWeight: FontWeight.bold),
                      textAlign: TextAlign.center,
                    ),

                    const SizedBox(
                      height: 15,
                    ),

                    const Text(
                      'Bem-vindo de volta, você nos fez falta!',
                      style:
                          TextStyle(fontSize: 15, fontWeight: FontWeight.w500),
                      textAlign: TextAlign.center,
                    ),

                    const SizedBox(
                      height: 10,
                    ),

                    //email

                    TextFormField(
                      decoration: const InputDecoration(
                        hintText: 'nome@email.com',
                        labelText: 'E-mail',
                        prefixIcon: Icon(Icons.mail),
                        border: OutlineInputBorder(),
                      ),
                      controller: LoginInputs.loginEmailController,
                      keyboardType: TextInputType.emailAddress,
                      validator: (email) {
                        if (email == null || email.isEmpty) {
                          return 'Por favor, digite seu e-mail';
                        } else if (!RegExp(
                                r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                            .hasMatch(LoginInputs.loginEmailController.text)) {
                          return 'Por favor, digite um e-mail correto';
                        }
                        return null;
                      },
                    ),

                    const SizedBox(
                      height: 15,
                    ),

                    //senha

                    TextFormField(
                      decoration: const InputDecoration(
                        labelText: 'Senha',
                        prefixIcon: Icon(Icons.lock_rounded),
                        border: OutlineInputBorder(),
                      ),
                      controller: LoginInputs.loginPasswordController,
                      obscureText: true,
                      keyboardType: TextInputType.text,
                      validator: (senha) {
                        RegExp regex = RegExp(r'^.{6,}$');
                        if (senha == null || senha.isEmpty) {
                          return 'Por favor, digite sua senha';
                        }
                        if (!regex.hasMatch(senha)) {
                          return 'Por favor, digite uma senha maior que 6 caracteres';
                        }
                        return null;
                      },
                    ),

                    const SizedBox(
                      height: 25,
                    ),

                    TextButton(
                      style: TextButton.styleFrom(
                        foregroundColor: Colors.white,
                        textStyle: const TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                        backgroundColor: const Color.fromRGBO(0, 101, 156, 1),
                        padding: const EdgeInsets.symmetric(
                            horizontal: 95, vertical: 20),
                      ),
                      onPressed: () {
                        if (LoginInputs.loginEmailController.text.isEmpty ||
                            LoginInputs.loginPasswordController.text.isEmpty) {
                          Fluttertoast.showToast(
                              msg: "Preencha todos os campos");
                        } else {
                          signIn(
                            LoginInputs.loginEmailController.text,
                            LoginInputs.loginPasswordController.text,
                            context,
                          );
                        }
                      },
                      child: const Text('Entrar'),
                    ),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        TextButton(
                          child: const Text('Esqueci minha senha'),
                          onPressed: () => Navigator.of(context).push(
                              MaterialPageRoute(
                                  builder: (context) => const ResetPage())),
                        )
                      ],
                    )
                  ]),
            )),
      ),
      bottomNavigationBar: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text(
            'Ainda não tem um conta?',
            style: TextStyle(
              fontSize: 17,
              fontWeight: FontWeight.bold,
            ),
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
              'Cadastre-se',
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
}

class LoginInputs {
  static TextEditingController loginEmailController = TextEditingController();
  static TextEditingController loginPasswordController =
      TextEditingController();
}
