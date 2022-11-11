import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

AppBar buildAppBarCaresPage(BuildContext context) {
  return AppBar(
    leading: IconButton(
      icon: const Icon(Icons.arrow_back_ios_new),
      onPressed: () {
        Navigator.of(context).pop();
      },
      color: Colors.black,
    ),
    title: RichText(
      textAlign: TextAlign.center,
      text: TextSpan(
        text: 'Crie uma nova\n',
        style: GoogleFonts.sen(
          textStyle: TextStyle(
            fontSize: 28,
            color: Colors.black,
            fontWeight: FontWeight.w500,
          ),
        ),
        children: [
          TextSpan(
            text: 'Conta',
            style: GoogleFonts.sen(
              textStyle: TextStyle(
                fontSize: 30,
                color: Colors.black,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
    ),
    elevation: 0,
    backgroundColor: Colors.transparent,
    centerTitle: true,
  );
}
