import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:health_care/screens/homepagepaste/home_page.dart'; // ignore: unused_import
import '../../../../model/user_model.dart';
import '../../../accountstypes/screens/verify_pages/utils.dart';

import 'package:health_care/screens/creatorpages/chooseregistrationpages/createaccount_page.dart';

import '../profile_page/profile_page.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({Key? key}) : super(key: key);

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

User? user = FirebaseAuth.instance.currentUser;
UserModel loggedInUser = UserModel();

class _SettingsPageState extends State<SettingsPage> {
  @override
  void initState() {
    super.initState();
    FirebaseFirestore.instance
        .collection("users")
        .doc(user!.uid)
        .get()
        .then((value) {
      loggedInUser = UserModel.fromMap(
        value.data(),
      );
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          title: const Text(
            'Configurações',
            style: TextStyle(
                fontSize: 22, color: Colors.black, fontWeight: FontWeight.bold),
          ),
          elevation: 0,
          backgroundColor: Colors.white,
          leading: IconButton(
            icon: const Icon(
              Icons.arrow_back_ios_new,
              color: Colors.black,
            ),
            onPressed: () {
              Navigator.pop(context);
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => const HomePage(),
                ),
              );
            },
          ),
        ),
        body: Stack(
          fit: StackFit.expand,
          children: <Widget>[
            SingleChildScrollView(
              padding: const EdgeInsets.all(10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Card(
                    elevation: 8.0,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10)),
                    margin: const EdgeInsets.all(8.0),
                    color: const Color.fromARGB(255, 73, 93, 184),
                    child: ListTile(
                      onTap: (() {
                        Navigator.pop(context);
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) => const ProfilePage(),
                          ),
                        );
                      }),
                      title: Text(
                        '${loggedInUser.name}',
                        style: TextStyle(
                            color: Colors.white, fontWeight: FontWeight.w500),
                      ),
                      leading: CircleAvatar(
                        backgroundColor:
                            const Color.fromARGB(255, 255, 255, 255),
                        radius: 20.0,
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
                      trailing: const Icon(
                        Icons.edit,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  const Text(
                    'Geral',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Color.fromARGB(255, 73, 93, 184),
                    ),
                  ),
                  const SizedBox(
                    height: 13,
                  ),
                  Card(
                    elevation: 4.0,
                    margin: const EdgeInsets.fromLTRB(32, 8, 32, 16),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10)),
                    child: Column(
                      children: <Widget>[
                        ListTile(
                          leading: const Icon(
                            Icons.person,
                            color: Color.fromARGB(255, 73, 93, 184),
                          ),
                          title: const Text(
                            "Sua Conta",
                            style: TextStyle(
                                fontSize: 18, fontWeight: FontWeight.w600),
                          ),
                          subtitle: const Text('Informações da conta'),
                          trailing:
                              const Icon(Icons.keyboard_arrow_right_outlined),
                          onTap: () {
                            Navigator.of(context).push(
                              MaterialPageRoute(
                                builder: (context) => const HomePage(),
                              ),
                            );
                          },
                        ),
                        Container(
                          margin: const EdgeInsets.symmetric(
                            horizontal: 8.0,
                          ),
                          width: double.infinity,
                          height: 1,
                          color: const Color.fromARGB(102, 73, 93, 184),
                        ),
                        ListTile(
                          leading: const Icon(
                            Icons.notifications,
                            color: Color.fromARGB(255, 73, 93, 184),
                          ),
                          title: const Text(
                            "Notificações",
                            style: TextStyle(
                                fontSize: 18, fontWeight: FontWeight.w600),
                          ),
                          subtitle: const Text('Atualizações do aplicativo'),
                          trailing:
                              const Icon(Icons.keyboard_arrow_right_outlined),
                          onTap: () {
                            Navigator.of(context).push(
                              MaterialPageRoute(
                                builder: (context) => const HomePage(),
                              ),
                            );
                          },
                        ),
                        Container(
                          margin: const EdgeInsets.symmetric(
                            horizontal: 8.0,
                          ),
                          width: double.infinity,
                          height: 1,
                          color: const Color.fromARGB(102, 73, 93, 184),
                        ),
                        ListTile(
                          leading: const Icon(
                            Icons.security_outlined,
                            color: Color.fromARGB(255, 73, 93, 184),
                          ),
                          title: const Text(
                            "Privacidade e Segurança",
                            style: TextStyle(
                                fontSize: 18, fontWeight: FontWeight.w600),
                          ),
                          subtitle: const Text('Informações do aplicativo'),
                          trailing:
                              const Icon(Icons.keyboard_arrow_right_outlined),
                          onTap: () {
                            Navigator.of(context).push(
                              MaterialPageRoute(
                                builder: (context) => const HomePage(),
                              ),
                            );
                          },
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 40,
                  ),
                  const Text(
                    'Feedback',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Color.fromARGB(255, 73, 93, 184),
                    ),
                  ),
                  const SizedBox(
                    height: 13,
                  ),
                  Card(
                    elevation: 4.0,
                    margin: const EdgeInsets.fromLTRB(20, 8, 20, 16),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10)),
                    child: Column(
                      children: <Widget>[
                        ListTile(
                          leading: const Icon(
                            Icons.bug_report_sharp,
                            color: Color.fromARGB(255, 73, 93, 184),
                          ),
                          title: const Text(
                            "Reportar Bug",
                            style: TextStyle(
                                fontSize: 18, fontWeight: FontWeight.w600),
                          ),
                          trailing:
                              const Icon(Icons.keyboard_arrow_right_outlined),
                          onTap: () {
                            Navigator.of(context).push(
                              MaterialPageRoute(
                                builder: (context) => const HomePage(),
                              ),
                            );
                          },
                        ),
                        Container(
                          margin: const EdgeInsets.symmetric(
                            horizontal: 8.0,
                          ),
                          width: double.infinity,
                          height: 1,
                          color: const Color.fromARGB(102, 73, 93, 184),
                        ),
                        ListTile(
                          leading: const Icon(
                            Icons.thumb_up_alt,
                            color: Color.fromARGB(255, 73, 93, 184),
                          ),
                          title: const Text(
                            "Mande Feedback",
                            style: TextStyle(
                                fontSize: 18, fontWeight: FontWeight.w600),
                          ),
                          trailing:
                              const Icon(Icons.keyboard_arrow_right_outlined),
                          onTap: () {
                            Navigator.of(context).push(
                              MaterialPageRoute(
                                builder: (context) => const HomePage(),
                              ),
                            );
                          },
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Positioned(
              bottom: -20,
              left: -20,
              child: Container(
                width: 100,
                height: 100,
                alignment: Alignment.center,
                decoration: const BoxDecoration(
                  color: Color.fromARGB(255, 73, 93, 184),
                  shape: BoxShape.circle,
                ),
              ),
            ),
            Positioned(
              bottom: 18,
              left: 6,
              child: IconButton(
                icon: const Icon(
                  Icons.logout_outlined,
                  size: 45,
                  color: Colors.white,
                ),
                onPressed: () {
                  logout(context);
                },
              ),
            )
          ],
        ),
      );
  Future<void> logout(BuildContext context) async {
    await FirebaseAuth.instance.signOut();
    Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (context) => const CreateAccount()));
  }
}
