import 'package:flutter/material.dart';
import 'package:health_care/screens/accountstypes/screens/cares_page/components/sign_up.dart';

import '../cares_page.dart';

Center buildBodyCaresPage(context) {
  return Center(
    child: SingleChildScrollView(
      padding: const EdgeInsets.symmetric(horizontal: 25.0),
      child: Form(
        key: formKey,
        child: Column(
          children: [
            const SizedBox(
              height: 40,
            ),

            //nome
            TextFormField(
              autofocus: false,
              controller: CaresInputs.caresNameEditingController,
              keyboardType: TextInputType.name,
              validator: (value) {
                RegExp regex = RegExp(r'^.{3,}$');
                if (value!.isEmpty) {
                  return ("First Name cannot be Empty");
                }
                if (!regex.hasMatch(value)) {
                  return ("Enter Valid name(Min. 3 Character)");
                }
                return null;
              },
              onSaved: (value) {
                CaresInputs.caresNameEditingController.text = value!;
              },
              textInputAction: TextInputAction.next,
              decoration: const InputDecoration(
                prefixIcon: Icon(Icons.person),
                hintText: "Ex: João da Silva",
                labelText: 'Nome/sobrenome',
                border: OutlineInputBorder(),
              ),
            ),

            const SizedBox(
              height: 20,
            ),

            //email
            TextFormField(
              autofocus: false,
              controller: CaresInputs.caresEmailController,
              keyboardType: TextInputType.emailAddress,
              validator: (value) {
                if (value!.isEmpty) {
                  return ("Please Enter Your Email");
                }
                // reg expression for email validation
                if (!RegExp("^[a-zA-Z0-9+_.-]+@[a-zA-Z0-9.-]+.[a-z]")
                    .hasMatch(value)) {
                  return ("Please Enter a valid email");
                }
                return null;
              },
              onSaved: (value) {
                CaresInputs.caresNameEditingController.text = value!;
              },
              textInputAction: TextInputAction.next,
              decoration: const InputDecoration(
                prefixIcon: Icon(Icons.mail),
                labelText: 'E-mail',
                hintText: "name@example.com",
                border: OutlineInputBorder(),
              ),
            ),

            const SizedBox(
              height: 20,
            ),

            //senha
            TextFormField(
              autofocus: false,
              controller: CaresInputs.caresPasswordController,
              obscureText: true,
              validator: (value) {
                RegExp regex = RegExp(r'^.{6,}$');
                if (value!.isEmpty) {
                  return ("Password is required for login");
                }
                if (!regex.hasMatch(value)) {
                  return ("Enter Valid Password(Min. 6 Character)");
                }
                return null;
              },
              onSaved: (senha) {
                CaresInputs.caresNameEditingController.text = senha!;
              },
              textInputAction: TextInputAction.next,
              decoration: const InputDecoration(
                prefixIcon: Icon(Icons.lock_rounded),
                labelText: "Senha",
                border: OutlineInputBorder(),
              ),
            ),

            const SizedBox(
              height: 20,
            ),

            //senha dnv
            TextFormField(
              autofocus: false,
              controller: CaresInputs.caresConfirmPasswordController,
              obscureText: true,
              validator: (value) {
                if (CaresInputs.caresConfirmPasswordController.text !=
                    CaresInputs.caresConfirmPasswordController.text) {
                  return "Password don't match";
                }
                return null;
              },
              onSaved: (value) {
                CaresInputs.caresConfirmPasswordController.text = value!;
              },
              textInputAction: TextInputAction.done,
              decoration: const InputDecoration(
                prefixIcon: Icon(Icons.lock_rounded),
                labelText: "Confirme a senha",
                border: OutlineInputBorder(),
              ),
            ),

            const SizedBox(
              height: 40,
            ),

            TextButton(
              style: TextButton.styleFrom(
                textStyle: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
                backgroundColor: const Color.fromRGBO(0, 101, 156, 1),
                primary: Colors.white,
                padding:
                    const EdgeInsets.symmetric(horizontal: 120, vertical: 25),
              ),
              onPressed: () {
                signUp(
                  CaresInputs.caresEmailController.text,
                  CaresInputs.caresPasswordController.text,
                  context,
                );
              },
              child: const Text('Criar Conta'),
            ),

            const SizedBox(
              height: 300,
            )
          ],
        ),
      ),
    ),
  );
}

class CaresInputs {
  static TextEditingController caresNameEditingController =
      TextEditingController();
  static TextEditingController caresEmailController = TextEditingController();
  static TextEditingController caresPasswordController =
      TextEditingController();
  static TextEditingController caresConfirmPasswordController =
      TextEditingController();
}
