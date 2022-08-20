import 'package:flutter/material.dart';

import '../../../../creatorpages/chooseregistrationpages/createaccount_page.dart';

class BuildBodyNeedCares extends StatelessWidget {
  const BuildBodyNeedCares({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(
          height: 40,
        ),

        //nome
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(50),
          ),
          child: const Padding(
            padding: EdgeInsets.symmetric(horizontal: 25),
            child: TextField(
              decoration: InputDecoration(
                hintText: 'Ex: João da Silva',
                labelText: 'Digite nome/sobrenome',
                prefixIcon: Icon(Icons.person),
                border: OutlineInputBorder(),
              ),
            ),
          ),
        ),

        const SizedBox(
          height: 20,
        ),

        //numero
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(50),
          ),
          child: const Padding(
            padding: EdgeInsets.symmetric(horizontal: 25),
            child: TextField(
              decoration: InputDecoration(
                hintText: 'Ex: +55 (12) 34567-8901',
                labelText: 'Número',
                prefixIcon: Icon(Icons.phone),
                border: OutlineInputBorder(),
              ),
            ),
          ),
        ),

        const SizedBox(
          height: 20,
        ),

        //email
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 25),
          child: TextField(
            decoration: InputDecoration(
              hintText: 'name@example.com',
              labelText: 'E-mail',
              prefixIcon: Icon(Icons.mail),
              border: OutlineInputBorder(),
            ),
          ),
        ),

        const SizedBox(
          height: 20,
        ),

        //senha
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(50),
          ),
          child: const Padding(
            padding: EdgeInsets.symmetric(horizontal: 25),
            child: TextField(
              obscureText: true,
              decoration: InputDecoration(
                labelText: 'Senha',
                prefixIcon: Icon(Icons.lock_rounded),
                border: OutlineInputBorder(),
              ),
            ),
          ),
        ),

        const SizedBox(
          height: 20,
        ),

        //senha dnv
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(50),
          ),
          child: const Padding(
            padding: EdgeInsets.symmetric(horizontal: 25),
            child: TextField(
              obscureText: true,
              decoration: InputDecoration(
                labelText: 'Senha novamente',
                prefixIcon: Icon(Icons.lock_rounded),
                border: OutlineInputBorder(),
              ),
            ),
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
            padding: const EdgeInsets.symmetric(horizontal: 125, vertical: 25),
          ),
          onPressed: () {
            Navigator.of(context).pushReplacement(
              MaterialPageRoute(
                builder: (context) => const CreateAccount(),
              ),
            );
          },
          child: const Text('Criar Conta'),
        ),
      ],
    );
  }
}
