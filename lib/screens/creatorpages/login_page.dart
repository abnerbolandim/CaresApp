import 'package:fluttertoast/fluttertoast.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:health_care/screens/homepagepaste/home_page.dart';
import 'createaccount_page.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();

  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  final _auth = FirebaseAuth.instance;

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
                        hintText: 'name@example.com',
                        labelText: 'E-mail',
                        prefixIcon: Icon(Icons.mail),
                        border: OutlineInputBorder(),
                      ),
                      controller: _emailController,
                      keyboardType: TextInputType.emailAddress,
                      validator: (email) {
                        if (email == null || email.isEmpty) {
                          return 'Por favor, digite seu e-mail';
                        } else if (!RegExp(
                                r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                            .hasMatch(_emailController.text)) {
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
                      controller: _passwordController,
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
                        textStyle: const TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                        backgroundColor: const Color.fromRGBO(0, 101, 156, 1),
                        primary: Colors.white,
                        padding: const EdgeInsets.symmetric(
                            horizontal: 95, vertical: 20),
                      ),
                      onPressed: () {
                        signIn(_emailController.text, _passwordController.text);
                      },
                      child: const Text('Login'),
                    ),

                    const SizedBox(
                      height: 10,
                    ),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const [
                        Text(
                          'Forget Password?',
                          style: TextStyle(
                            fontSize: 17,
                            color: Color.fromARGB(255, 20, 98, 161),
                            fontWeight: FontWeight.bold,
                          ),
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
            'You Have Don`t Account?',
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
              'Create Account',
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
        print(error.code);
      }
    }
  }
}
