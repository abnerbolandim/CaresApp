import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:health_care/model/user_model.dart';
import 'package:health_care/screens/homepagepaste/home_page.dart';
import 'package:path/path.dart';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path_provider/path_provider.dart';

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
      loggedInUser = UserModel.fromMap(
        value.data(),
      );
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
      body: Stack(
        alignment: Alignment.center,
        children: [
          SingleChildScrollView(
            child: Column(
              children: [
                CustomPaint(
                  child: Column(
                    children: [
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
                          SizedBox(
                            width: 180,
                            height: 180,
                            child: Stack(
                              children: [
                                SizedBox(
                                  width: 200,
                                  height: 200,
                                  child: CircleAvatar(
                                    backgroundColor: Colors.white,
                                    child: uImage != null
                                        ? CircleAvatar(
                                            radius: 80.0,
                                            backgroundImage: FileImage(uImage!),
                                          )
                                        : const CircleAvatar(
                                            radius: 80.0,
                                            backgroundImage: NetworkImage(
                                              "https://picsum.photos/250?image=9",
                                            ),
                                            backgroundColor: Colors.transparent,
                                          ),
                                  ),
                                ),
                                Align(
                                  alignment: Alignment.bottomRight,
                                  child: Material(
                                    type: MaterialType.transparency,
                                    child: Ink(
                                      decoration: const BoxDecoration(
                                        color: Color.fromARGB(255, 73, 93, 184),
                                        shape: BoxShape.circle,
                                      ),
                                      child: InkWell(
                                        onTap: () {},
                                        child: const Padding(
                                          padding: EdgeInsets.all(10),
                                          child: Icon(
                                            Icons.edit,
                                            color: Colors.white,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Container(
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
                                          borderRadius:
                                              BorderRadius.circular(10.0),
                                          borderSide: BorderSide.none),
                                    ),
                                  ),
                                ),
                                const SizedBox(height: 20),
                                Material(
                                  elevation: 4,
                                  shadowColor: Colors.grey,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  child: TextField(
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
                                          borderRadius:
                                              BorderRadius.circular(10.0),
                                          borderSide: BorderSide.none),
                                    ),
                                  ),
                                ),
                                const SizedBox(height: 20),
                                Material(
                                  elevation: 4,
                                  shadowColor: Colors.grey,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  child: TextField(
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
                                          borderRadius:
                                              BorderRadius.circular(10.0),
                                          borderSide: BorderSide.none),
                                    ),
                                  ),
                                ),
                                const SizedBox(height: 20),
                                Material(
                                  elevation: 4,
                                  shadowColor: Colors.grey,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  child: TextFormField(
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
                                          borderRadius:
                                              BorderRadius.circular(10.0),
                                          borderSide: BorderSide.none),
                                    ),
                                  ),
                                ),
                                const SizedBox(
                                  height: 20,
                                )
                              ],
                            ),
                          )
                        ],
                      ),
                    ],
                  ),
                  painter: HeaderCurvedContainer(),
                ),
              ],
            ),
          ),
        ],
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            primary: const Color.fromARGB(255, 73, 93, 184),
            minimumSize: const Size(0, 45),
          ),
          onPressed: () {},
          child: const Text(
            "Atualizar",
            style: TextStyle(
              fontSize: 20,
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}

// floatingActionButton: FloatingActionButton(
//   onPressed: () => {
//     Navigator.of(context).push(
//       MaterialPageRoute(
//         builder: (context) => const EditPage(),
//       ),
//     )
//   },
//   backgroundColor: const Color.fromARGB(255, 73, 93, 184),
//   child: const Icon(Icons.edit),
// ),

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
