import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:health_care/model/user_model.dart';
import 'package:health_care/screens/creatorpages/chooseregistrationpages/createaccount_page.dart';
import 'package:health_care/screens/homepagepaste/screens/search_page/search_page.dart';
import 'package:health_care/screens/homepagepaste/screens/settings/screens/switchnotification_page.dart';
import 'package:health_care/screens/homepagepaste/screens/settings/settings_page.dart';

import 'screens/profile_page/profile_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

User? user = FirebaseAuth.instance.currentUser;
UserModel loggedInUser = UserModel();

class _HomePageState extends State<HomePage> {
  User? user = FirebaseAuth.instance.currentUser;

  @override
  void initState() {
    super.initState();
    FirebaseFirestore.instance
        .collection("users")
        .doc(user!.uid)
        .get()
        .then((value) {
      loggedInUser = UserModel.fromMap(value.data());
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    final globalKey = GlobalKey<ScaffoldState>();

    final size = MediaQuery.of(context).size;

    return Scaffold(
      key: globalKey,
      drawer: Drawer(
        backgroundColor: const Color.fromRGBO(24, 34, 71, 1),
        child: Column(
          children: [
            SizedBox(
              height: size.height,
              child: Column(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    children: const [
                      informacoesConta(),
                      ConteudoMeio(),
                    ],
                  ),
                  logoutBtn(context),
                ],
              ),
            )
          ],
        ),
      ),
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 12.0, top: 12.0),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(50.0),
              child: InkWell(
                onTap: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => const ProfilePage(),
                    ),
                  );
                },
                child: CircleAvatar(
                  backgroundColor: const Color.fromARGB(255, 255, 255, 255),
                  radius: 20.0,
                  child: CircleAvatar(
                    radius: 80.0,
                    child: Image.asset("./assets/images/user.png"),
                    backgroundColor: Colors.transparent,
                  ),
                ),
              ),
            ),
          ),
        ],
        leading: IconButton(
          icon: const Icon(
            Icons.menu,
            color: Color.fromARGB(255, 73, 93, 184),
          ),
          onPressed: () {
            globalKey.currentState?.openDrawer();
          },
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              width: size.width / 1.1,
              child: Text(
                "Olá, \n${loggedInUser.name}",
                style: GoogleFonts.sen(
                  textStyle: TextStyle(
                    fontSize: 20,
                    color: Colors.black87,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ),
            SizedBox(
              height: size.height / 35,
            ),
            SizedBox(
              width: size.width / 1.1,
              child: const Text(
                "Ache agora mesmo\num doutor",
                style: TextStyle(
                  fontSize: 32,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 30.0),
              child: searchField(size),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 20.0),
              child: SizedBox(
                width: size.width / 1.1,
                child: const Text(
                  "Como podemos ajudá-lo?",
                  style: TextStyle(fontSize: 25, fontWeight: FontWeight.w600),
                ),
              ),
            ),
            Row(
              children: [
                Container(
                  height: size.height / 7,
                  width: size.width / 3.5,
                  margin: const EdgeInsets.symmetric(horizontal: 9),
                  decoration: BoxDecoration(
                      color: const Color.fromARGB(255, 73, 93, 184),
                      borderRadius: BorderRadius.circular(20),
                      boxShadow: const [
                        BoxShadow(
                            color: Color.fromARGB(255, 109, 179, 237),
                            blurRadius: 10,
                            offset: Offset(2, 3)),
                      ]),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      IconButton(
                        padding: EdgeInsets.zero,
                        icon: const Icon(
                          Icons.free_breakfast_outlined,
                          size: 50,
                          color: Colors.white,
                        ),
                        onPressed: () {
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) => const SearchPage(),
                            ),
                          );
                        },
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Text(
                        'Ajudante',
                        style: GoogleFonts.sen(
                          textStyle: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                Container(
                  height: size.height / 7,
                  width: size.width / 3.5,
                  margin: const EdgeInsets.symmetric(horizontal: 9),
                  decoration: BoxDecoration(
                      color: const Color.fromARGB(255, 73, 93, 184),
                      borderRadius: BorderRadius.circular(20),
                      boxShadow: const [
                        BoxShadow(
                            color: Color.fromARGB(255, 109, 179, 237),
                            blurRadius: 10,
                            offset: Offset(2, 3)),
                      ]),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      IconButton(
                        padding: EdgeInsets.zero,
                        icon: const Icon(
                          Icons.medical_services_outlined,
                          size: 50,
                          color: Colors.white,
                        ),
                        onPressed: () {
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) => const SearchPage(),
                            ),
                          );
                        },
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      const Text(
                        'Médico',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                        ),
                      )
                    ],
                  ),
                ),
                Container(
                  height: size.height / 7,
                  width: size.width / 3.5,
                  margin: const EdgeInsets.symmetric(horizontal: 9),
                  decoration: BoxDecoration(
                      color: const Color.fromARGB(255, 73, 93, 184),
                      borderRadius: BorderRadius.circular(20),
                      boxShadow: const [
                        BoxShadow(
                            color: Color.fromARGB(255, 109, 179, 237),
                            blurRadius: 10,
                            offset: Offset(2, 3)),
                      ]),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      IconButton(
                        padding: EdgeInsets.zero,
                        icon: const Icon(
                          Icons.medication_liquid_sharp,
                          size: 50,
                          color: Colors.white,
                        ),
                        onPressed: () {
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) => const SearchPage(),
                            ),
                          );
                        },
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      const Text(
                        'Cuidador',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(height: size.height / 25),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 30),
              child: Text(
                'Melhores Doutores',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                  fontSize: 20,
                ),
              ),
            ),
            SizedBox(
              height: size.height / 100,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15.0),
              child: DecoratedBox(
                decoration: BoxDecoration(
                  color: Colors.blue.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(18),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(10),
                  child: ListTile(
                    leading: Image.asset('assets/images/doctorHome01.png'),
                    title: const Text(
                      'Dr. Roberto Romano',
                      style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    subtitle: const Text(
                      'Especialista no ramo de cuidador.',
                      style: TextStyle(color: Colors.black45),
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: size.height / 100,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15.0),
              child: DecoratedBox(
                decoration: BoxDecoration(
                  color:
                      const Color.fromARGB(255, 255, 230, 0).withOpacity(0.1),
                  borderRadius: BorderRadius.circular(18),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(10),
                  child: ListTile(
                    leading: Image.asset('assets/images/doctorHome02.png'),
                    title: const Text(
                      'Dra. Deolane da Silva',
                      style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    subtitle: const Text(
                      'Especialista no ramo de psicologia.',
                      style: TextStyle(color: Colors.black45),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  ListTile logoutBtn(BuildContext context) {
    return ListTile(
      contentPadding: const EdgeInsets.symmetric(horizontal: 24, vertical: 8),
      leading: const Icon(
        Icons.logout_outlined,
        color: Colors.white,
      ),
      title: const Text(
        'Finalizar sessão',
        style: TextStyle(
          fontSize: 18,
          color: Colors.white,
        ),
      ),
      onTap: () {
        logout(context);
      },
    );
  }

  Widget searchField(Size size) {
    return Container(
      height: size.height / 14,
      width: size.width / 1.10,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20), color: Colors.grey[300]),
      child: Row(
        children: [
          const Padding(
            padding: EdgeInsets.all(15.0),
            child: Icon(Icons.search),
          ),
          Expanded(
            child: TextField(
              decoration: InputDecoration(
                border: InputBorder.none,
                hintText: "Procure uma localização...",
                hintStyle: GoogleFonts.sen(
                  textStyle: TextStyle(
                    fontSize: 17,
                    color: Colors.black,
                    fontWeight: FontWeight.w300,
                  ),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: Container(
              height: size.height / 10,
              width: size.height / 20,
              decoration: BoxDecoration(
                  color: const Color.fromRGBO(55, 82, 178, 1),
                  borderRadius: BorderRadius.circular(50)),
              child: IconButton(
                padding: EdgeInsets.zero,
                icon: const Icon(
                  Icons.search,
                  size: 25,
                  color: Colors.white,
                ),
                onPressed: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => const SearchPage(),
                    ),
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }

  Future<void> logout(BuildContext context) async {
    await FirebaseAuth.instance.signOut();
    Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (context) => const CreateAccount()));
  }
}

class ConteudoMeio extends StatelessWidget {
  const ConteudoMeio({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListTile(
          contentPadding:
              const EdgeInsets.symmetric(horizontal: 24, vertical: 8),
          leading: const Icon(
            Icons.person_outline_sharp,
            color: Colors.white,
          ),
          title: const Text(
            'Perfil',
            style: TextStyle(fontSize: 18, color: Colors.white),
          ),
          onTap: () {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => const ProfilePage(),
              ),
            );
          },
        ),
        ListTile(
          contentPadding:
              const EdgeInsets.symmetric(horizontal: 24, vertical: 8),
          leading: const Icon(
            Icons.notifications_none,
            color: Colors.white,
          ),
          title: const Text(
            'Notificação',
            style: TextStyle(
              fontSize: 18,
              color: Colors.white,
            ),
          ),
          onTap: () {
            Navigator.of(context).push(
                MaterialPageRoute(builder: (_) => SwitchNotificationPage()));
          },
        ),
        ListTile(
          contentPadding:
              const EdgeInsets.symmetric(horizontal: 24, vertical: 8),
          leading: const Icon(
            Icons.miscellaneous_services_outlined,
            color: Colors.white,
          ),
          title: const Text(
            'Configuração',
            style: TextStyle(
              fontSize: 18,
              color: Colors.white,
            ),
          ),
          onTap: () {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => const SettingsPage(),
              ),
            );
          },
        ),
      ],
    );
  }
}

// ignore: camel_case_types
class informacoesConta extends StatelessWidget {
  const informacoesConta({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return UserAccountsDrawerHeader(
      decoration: const BoxDecoration(
        color: Color.fromRGBO(0, 185, 228, 1),
      ),
      currentAccountPicture: CircleAvatar(
        backgroundColor: const Color.fromARGB(255, 255, 255, 255),
        radius: 85.0,
        child: uImage != null
            ? CircleAvatar(
                radius: 80.0,
                backgroundImage: FileImage(uImage!),
              )
            : const CircleAvatar(
                radius: 80.0,
                backgroundImage: NetworkImage(
                    "https://fopiess.org.br/wp-content/uploads/2018/01/default1.jpg"),
                backgroundColor: Colors.transparent,
              ),
      ),
      accountName: Text(
        '${loggedInUser.name}',
        style: GoogleFonts.sen(
          textStyle: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
      ),
      accountEmail: Text('${loggedInUser.email}',
          style: GoogleFonts.sen(
            textStyle: TextStyle(fontSize: 15, fontWeight: FontWeight.w500),
          )),
    );
  }
}
