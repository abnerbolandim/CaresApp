import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:health_care/screens/homepagepaste/home_page.dart';
import 'package:health_care/screens/homepagepaste/profilepagepaste/profile_page.dart';
import 'screens/firstpages/welcome_page.dart';
import 'package:shared_preferences/shared_preferences.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  final prefs = await SharedPreferences.getInstance();
  final showHome = prefs.getBool('showHome') ?? false;
  runApp(MyApp(showHome: showHome));
}

class MyApp extends StatelessWidget {
  final bool showHome;

  const MyApp({
    Key? key,
    required this.showHome,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Cares',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: showHome ? const WelcomePage() : const HomePage(),
    );
  }
}
