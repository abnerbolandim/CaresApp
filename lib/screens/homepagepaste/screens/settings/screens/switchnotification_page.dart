import 'package:flutter/material.dart';

import '../settings_page.dart';

class SwitchNotificationPage extends StatefulWidget {
  static const String id = 'sample1';
  static const String title = 'Sample1';

  const SwitchNotificationPage({Key? key}) : super(key: key);

  @override
  _SwitchNotificationPageState createState() => _SwitchNotificationPageState();
}

class _SwitchNotificationPageState extends State<SwitchNotificationPage> {
  bool _toggled1 = false;
  bool _toggled2 = false;
  bool _toggled3 = false;
  bool _toggled4 = false;
  bool _toggledAll = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Página de Notificações',
          style: TextStyle(
              fontSize: 22, color: Colors.white, fontWeight: FontWeight.bold),
        ),
        elevation: 0,
        backgroundColor: const Color.fromARGB(255, 73, 93, 184),
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back_ios_new,
            color: Colors.white,
          ),
          onPressed: () {
            Navigator.pop(context);
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => const SettingsPage(),
              ),
            );
          },
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text(
            'Opcões do Aplicativo',
            style: TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.bold,
              color: Color.fromARGB(255, 73, 93, 184),
            ),
          ),
          const SizedBox(
            height: 45,
          ),
          SwitchListTile(
            title: const Text(
              'Selecione tudo',
              style: TextStyle(
                  color: Color.fromARGB(255, 73, 93, 184),
                  fontWeight: FontWeight.w600),
            ),
            secondary: const Icon(
              Icons.all_inbox_outlined,
              color: Color.fromARGB(255, 73, 93, 184),
            ), // Point to Check
            onChanged: (bool value) => setState(() {
              _toggledAll = value;
              _toggled1 = value;
              _toggled2 = value;
              _toggled3 = value;
              _toggled4 = value;
            }),
            value: _toggledAll,
          ),
          const SizedBox(
            height: 15,
          ),
          SwitchListTile(
            title: const Text(
              'Notificações tela inicial',
              style: TextStyle(fontWeight: FontWeight.w600),
            ),
            secondary: const Icon(Icons.home_outlined), // Point to Check
            value: _toggled1,
            onChanged: (value) {
              setState(() => _toggled1 = value);
            },
          ),
          const SizedBox(
            height: 15,
          ),
          SwitchListTile(
            title: const Text(
              'Notificações de mensagem',
              style: TextStyle(
                  color: Color.fromARGB(255, 73, 93, 184),
                  fontWeight: FontWeight.w600),
            ),
            secondary: const Icon(
              Icons.chat_bubble_outline_outlined,
              color: Color.fromARGB(255, 73, 93, 184),
            ), // Point to Check
            value: _toggled2,
            onChanged: (value) {
              setState(() => _toggled2 = value);
            },
          ),
          const SizedBox(
            height: 15,
          ),
          SwitchListTile(
            title: const Text(
              'Notificações de atualizações',
              style: TextStyle(fontWeight: FontWeight.w600),
            ),
            secondary: const Icon(Icons.update_outlined), // Point to Check
            value: _toggled3,
            onChanged: (value) {
              setState(() => _toggled3 = value);
            },
          ),
          const SizedBox(
            height: 15,
          ),
          SwitchListTile(
            title: const Text(
              'Notificações de Cuidadores/Necessitados',
              style: TextStyle(
                  color: Color.fromARGB(255, 73, 93, 184),
                  fontWeight: FontWeight.w600),
            ),
            secondary: const Icon(
              Icons.medication_outlined,
              color: Color.fromARGB(255, 73, 93, 184),
            ), // Point to Check
            value: _toggled4,
            onChanged: (value) {
              setState(() => _toggled4 = value);
            },
          ),
        ],
      ),
    );
  }
}
