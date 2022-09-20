import 'package:flutter/material.dart';
import 'package:intl_phone_field/intl_phone_field.dart';

import '../../verify_pages/verify_pages.dart';
import '../need_page.dart';

class BuildBodyNeedCarePage extends StatefulWidget {
  const BuildBodyNeedCarePage({Key? key}) : super(key: key);

  @override
  State<BuildBodyNeedCarePage> createState() => _BuildBodyNeedCarePageState();
}

String countryDial = "+55";

class _BuildBodyNeedCarePageState extends State<BuildBodyNeedCarePage> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
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

            //telefone
            IntlPhoneField(
              validator: (value) {
                if (value.toString().isEmpty) {
                  return ("Phone Number cannot be Empty");
                }
                return null;
              },
              controller: CaresInputs.caresTelefoneController,
              showCountryFlag: false,
              showDropdownIcon: false,
              initialValue: countryDial,
              keyboardType: TextInputType.phone,
              onCountryChanged: (country) {
                setState(() {
                  countryDial = "+" + country.dialCode;
                });
              },
              decoration: const InputDecoration(
                counterText: "",
                prefixIcon: Icon(Icons.person),
                hintText: "(99) 99999-9999",
                labelText: 'Telefone',
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
                    CaresInputs.caresPasswordController.text) {
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
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const VerifyPage(),
                  ),
                );
              },
              child: const Text('Criar Conta'),
            ),
          ],
        ),
      ),
    );
  }
}

class CaresInputs {
  static TextEditingController caresNameEditingController =
      TextEditingController();
  static TextEditingController caresEmailController = TextEditingController();
  static TextEditingController caresPasswordController =
      TextEditingController();
  static TextEditingController caresConfirmPasswordController =
      TextEditingController();
  static TextEditingController caresTelefoneController =
      TextEditingController();
}
