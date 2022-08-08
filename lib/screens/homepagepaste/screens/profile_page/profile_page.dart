import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:health_care/model/user_model.dart';
import 'package:health_care/screens/homepagepaste/home_page.dart';
import 'package:path/path.dart';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path_provider/path_provider.dart';

import '../edit_page/edit_page.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

File? uImage;

class _ProfilePageState extends State<ProfilePage> {
  Future getImage(ImageSource source) async {
    try {
      final image = await ImagePicker().pickImage(source: source);

      if (image == null) return;

      final imagePermanent = await saveFilePermanently(image.path);

      setState(() {
        uImage = imagePermanent;
      });
    } on PlatformException catch (e) {
      debugPrint('Failed to pick image: $e');
    }
  }

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

  Future<File> saveFilePermanently(String imagePath) async {
    final directory = await getApplicationDocumentsDirectory();
    final name = basename(imagePath);
    final image = File('${directory.path}/$name');

    return File(imagePath).copy(image.path);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: const Color.fromARGB(255, 73, 93, 184),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new),
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
      body: Stack(alignment: Alignment.center, children: [
        CustomPaint(
          child: SizedBox(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
          ),
          painter: HeaderCurvedContainer(),
        ),
        Column(
          children: [
            const Padding(
              padding: EdgeInsets.all(20),
              child: Text(
                'Perfil de Usuário',
                style: TextStyle(
                  fontSize: 35,
                  letterSpacing: 1.5,
                  color: Colors.white,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            CircleAvatar(
              backgroundColor: Colors.white,
              radius: 85.0,
              child: uImage != null
                  ? CircleAvatar(
                      radius: 80.0,
                      backgroundImage: FileImage(uImage!),
                    )
                  : const CircleAvatar(
                      radius: 80.0,
                      backgroundImage:
                          NetworkImage("https://picsum.photos/250?image=9"),
                      backgroundColor: Colors.transparent,
                    ),
            ),
          ],
        ),
        Padding(
          padding: const EdgeInsets.only(bottom: 270, left: 135),
          child: CircleAvatar(
            backgroundColor: Colors.blue[700],
            child: IconButton(
              icon: const Icon(Icons.edit),
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return AlertDialog(
                      title: const Text(
                        'Escolha uma opção',
                        style: TextStyle(
                            fontWeight: FontWeight.w600, color: Colors.blue),
                      ),
                      content: SingleChildScrollView(
                          child: ListBody(
                        children: [
                          InkWell(
                            onTap: () {
                              getImage(ImageSource.camera);
                            },
                            splashColor: Colors.blue,
                            child: Row(
                              children: const [
                                Padding(
                                  padding: EdgeInsets.all(8),
                                  child: Icon(
                                    Icons.camera,
                                    color: Colors.blue,
                                  ),
                                ),
                                Text(
                                  'Câmera',
                                  style: TextStyle(
                                    fontSize: 18,
                                    color: Colors.blue,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          InkWell(
                            onTap: () {
                              getImage(ImageSource.gallery);
                            },
                            splashColor: Colors.blue,
                            child: Row(
                              children: const [
                                Padding(
                                  padding: EdgeInsets.all(8),
                                  child: Icon(
                                    Icons.image_outlined,
                                    color: Colors.blue,
                                  ),
                                ),
                                Text(
                                  'Galeria',
                                  style: TextStyle(
                                    fontSize: 18,
                                    color: Colors.blue,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ],
                            ),
                          )
                        ],
                      )),
                    );
                  },
                );
              },
            ),
          ),
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Container(
              height: 450,
              width: double.infinity,
              margin: const EdgeInsets.symmetric(horizontal: 10),
              child: Column(
                children: [
                  Material(
                    elevation: 4,
                    shadowColor: Colors.grey,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: TextField(
                      enabled: false,
                      decoration: InputDecoration(
                        hintText: '${loggedInUser.name}',
                        hintStyle: const TextStyle(
                          letterSpacing: 3,
                          color: Colors.black54,
                          fontWeight: FontWeight.bold,
                        ),
                        fillColor: Colors.white30,
                        filled: true,
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10.0),
                            borderSide: BorderSide.none),
                      ),
                    ),
                  ),
                  SizedBox(height: 20),
                  Material(
                    elevation: 4,
                    shadowColor: Colors.grey,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: TextField(
                      enabled: false,
                      decoration: InputDecoration(
                          hintText: '${loggedInUser.email}',
                          hintStyle: const TextStyle(
                            letterSpacing: 3,
                            color: Colors.black54,
                            fontWeight: FontWeight.bold,
                          ),
                          fillColor: Colors.white30,
                          filled: true,
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10.0),
                              borderSide: BorderSide.none)),
                    ),
                  ),
                  SizedBox(height: 20),

                  Material(
                    elevation: 4,
                    shadowColor: Colors.grey,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: TextField(
                      enabled: false,
                      decoration: InputDecoration(
                          hintText: 'AMERICANA - SP',
                          hintStyle: const TextStyle(
                            letterSpacing: 3,
                            color: Colors.black54,
                            fontWeight: FontWeight.bold,
                          ),
                          fillColor: Colors.white30,
                          filled: true,
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10.0),
                              borderSide: BorderSide.none)),
                    ),
                  ),
                  SizedBox(height: 20),

                  Material(
                    elevation: 4,
                    shadowColor: Colors.grey,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: TextFormField(
                      enabled: false,
                      minLines: 1,
                      maxLines: 8,
                      decoration: InputDecoration(
                        hintText: 'Sobre mim...',
                        hintStyle: const TextStyle(
                          letterSpacing: 3,
                          color: Colors.black54,
                          fontWeight: FontWeight.bold,
                        ),
                        fillColor: Colors.white30,
                        filled: true,
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10.0),
                            borderSide: BorderSide.none),
                      ),
                    ),
                  ),

                  // SizedBox(
                  //   height: 55,
                  //   width: double.infinity,
                  //   child: ElevatedButton(
                  //     onPressed: () {},
                  //     child: const Center(
                  //       child: Text(
                  //         "Atualizar",
                  //         style: TextStyle(
                  //           fontSize: 23,
                  //           color: Colors.white,
                  //         ),
                  //       ),
                  //     ),
                  //   ),
                  // )
                ],
              ),
            )
          ],
        ),
      ]),
      floatingActionButton: FloatingActionButton(
        onPressed: () => {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) => const EditPage(),
            ),
          )
        },
        backgroundColor: const Color.fromARGB(255, 73, 93, 184),
        child: const Icon(Icons.edit),
      ),
    );
  }
}

class HeaderCurvedContainer extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()..color = const Color.fromARGB(255, 73, 93, 184);
    Path path = Path()
      ..relativeLineTo(0, 150)
      ..quadraticBezierTo(size.width / 2, 225, size.width, 150)
      ..relativeLineTo(0, -150)
      ..close();
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}
