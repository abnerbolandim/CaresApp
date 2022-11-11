import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:health_care/screens/creatorpages/chooseregistrationpages/createaccount_page.dart';

import '../../accountstypes/screens/cares_page/cares_page.dart';
import '../../accountstypes/screens/need_cares/need_page.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({Key? key}) : super(key: key);

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

// ignore: non_constant_identifier_names
bool Cuidador = false;

class _RegisterPageState extends State<RegisterPage> {
  @override
  Widget build(BuildContext context) {
    double maxWidth = MediaQuery.of(context).size.width;
    double maxHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: AppBar(
        toolbarHeight: maxHeight * 0.10,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new),
          onPressed: () {
            Navigator.pushReplacement(context,
                MaterialPageRoute(builder: (context) => const CreateAccount()));
          },
          color: Colors.white,
        ),
        title: RichText(
          textAlign: TextAlign.center,
          text: TextSpan(
            text: 'Escolha ',
            style: GoogleFonts.sen(
              textStyle: TextStyle(
                fontSize: 23,
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
            children: [
              TextSpan(
                text: 'o que pretende ser\nno APP Cares',
                style: GoogleFonts.sen(
                  textStyle: TextStyle(
                    fontSize: 23,
                    color: Colors.white,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ],
          ),
        ),
        backgroundColor: Color.fromARGB(255, 73, 93, 184),
        centerTitle: true,
      ),
      body: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(10),
          child: Column(
            children: [
              SizedBox(
                width: maxWidth * 0.90,
                height: maxHeight * 0.38,
                child: Material(
                  color: Color.fromARGB(255, 73, 93, 184),
                  elevation: 8,
                  borderRadius: BorderRadius.circular(28),
                  clipBehavior: Clip.antiAliasWithSaveLayer,
                  child: InkWell(
                    splashColor: const Color.fromARGB(83, 23, 147, 249),
                    onTap: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => const NeedCarePage(),
                        ),
                      );

                      setState(() {
                        Cuidador = false;
                      });
                    },
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Ink.image(
                          image: const AssetImage(
                              'assets/images/registerPage01.png'),
                          height: 250,
                          width: 250,
                          fit: BoxFit.cover,
                        ),
                        const Text(
                          'Necessita de Cuidados',
                          style: TextStyle(
                              fontSize: 30,
                              color: Colors.white,
                              fontWeight: FontWeight.w500),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 40,
              ),
              SizedBox(
                width: maxWidth * 0.90,
                height: maxHeight * 0.38,
                child: Material(
                  color: Color.fromARGB(255, 73, 93, 184),
                  elevation: 8,
                  borderRadius: BorderRadius.circular(28),
                  clipBehavior: Clip.antiAliasWithSaveLayer,
                  child: InkWell(
                    splashColor: const Color.fromARGB(83, 23, 147, 249),
                    onTap: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => const CaresPage(),
                        ),
                      );

                      setState(() {
                        Cuidador = true;
                      });
                    },
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Ink.image(
                          image: const AssetImage(
                              'assets/images/registerPage02.png'),
                          height: 250,
                          width: 250,
                          fit: BoxFit.cover,
                        ),
                        const Text(
                          'Cuidador',
                          style: TextStyle(
                              fontSize: 30,
                              color: Colors.white,
                              fontWeight: FontWeight.w500),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
