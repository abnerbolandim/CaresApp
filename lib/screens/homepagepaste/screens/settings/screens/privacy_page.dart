import 'package:flutter/material.dart';
import 'package:health_care/screens/homepagepaste/screens/settings/settings_page.dart';

class PrivacyPage extends StatefulWidget {
  const PrivacyPage({Key? key}) : super(key: key);

  @override
  State<PrivacyPage> createState() => _PrivacyPageState();
}

class _PrivacyPageState extends State<PrivacyPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Privacidade e Segurança',
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
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              Text(
                'Cares Política de Privacidade',
                style: TextStyle(
                  fontWeight: FontWeight.w700,
                  fontSize: 35,
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                'Última atualização: September 01, 2022',
                style: TextStyle(
                  fontWeight: FontWeight.w400,
                  fontSize: 15,
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(
                height: 15,
              ),
              Text(
                '               Cares Inc. ("Cares", "Empresa", "nós") respeita a privacidade de seus usuários ("você) e desenvolveu esta Política de Privacidade para mostrar o quão seguro está em questão da coleta, uso, processo, transferência, armazenamento e a divulgação sempre que você usar ou interagir conosco por meio de sites, aplicativos móveis, qualquer um de nossos produtos e serviços online e links. Além disso, acordos ou avisos associados a um determinado produto, serviço, software ou site da Cares (“Aplicação Cares”) podem fornecer informações adicionais sobre o processamento de suas informações pessoais pela Cares. Ao usar nossos Serviços, você está aceitando as práticas descritas nesta Política de Privacidade.',
                style: TextStyle(fontSize: 15, fontWeight: FontWeight.w500),
                textAlign: TextAlign.center,
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                '       Por favor, leia e revise esta Política de Privacidade cuidadosamente antes de usar ou acessar nossos Serviços e verifique nossa Política de Serviço e Privacidade de tempos em tempos para se informar sobre quaisquer alterações nesta Política de Privacidade ou quaisquer outras políticas ou acordos. Se você tiver alguma dúvida sobre nossas práticas de privacidade, consulte o "Reportar Bug" na página anterior e nos informe sobre o erro.',
                style: TextStyle(fontSize: 15, fontWeight: FontWeight.w500),
                textAlign: TextAlign.center,
              ),
              SizedBox(
                height: 80,
              ),
              Text(
                'Política de Privacidade | Termos de Serviço',
                style: TextStyle(fontSize: 17, fontWeight: FontWeight.w400),
              ),
              SizedBox(
                height: 5,
              ),
              Text(
                '© 2022 Cares Inc.',
                style: TextStyle(fontSize: 13),
              )
            ],
          ),
        ),
      ),
    );
  }
}
