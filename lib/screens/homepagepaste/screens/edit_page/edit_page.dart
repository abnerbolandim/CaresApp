import 'package:flutter/material.dart';
import 'package:health_care/screens/homepagepaste/screens/profile_page/profile_page.dart';

import '../../home_page.dart';

class EditPage extends StatelessWidget {
  const EditPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: const Color.fromARGB(255, 73, 93, 184),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new),
          onPressed: () => {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => const ProfilePage(),
              ),
            )
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
                      const Text(
                        'Perfil de Usuário',
                        style: TextStyle(
                          fontSize: 35,
                          letterSpacing: 1.5,
                          color: Colors.white,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      SizedBox(
                        width: MediaQuery.of(context).size.width,
                      ),
                    ],
                  ),
                  painter: HeaderCurvedContainer(),
                ),
                Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 80.0),
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
                                    borderRadius: BorderRadius.circular(10.0),
                                    borderSide: BorderSide.none),
                              ),
                            ),
                          ),
                        ],
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
                                borderRadius: BorderRadius.circular(10.0),
                                borderSide: BorderSide.none)),
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
                                borderRadius: BorderRadius.circular(10.0),
                                borderSide: BorderSide.none)),
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
                        maxLength: 170,
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
                            borderSide: BorderSide.none,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}

class HeaderCurvedContainer extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()..color = const Color.fromARGB(255, 73, 93, 184);
    Path path = Path()
      ..relativeLineTo(0, 70)
      ..quadraticBezierTo(size.width / 2, 105, size.width, 70)
      ..relativeLineTo(0, -150)
      ..close();
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}
