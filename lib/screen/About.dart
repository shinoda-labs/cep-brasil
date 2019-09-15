import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class About extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: Text('Sobre'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Container(
              padding: EdgeInsets.symmetric(vertical: 20.0),
              child: Column(
                children: <Widget>[
                  Container(
                    decoration: BoxDecoration(color: Colors.white, boxShadow: [
                      BoxShadow(
                        color: Colors.grey,
                        blurRadius: 10.0,
                        spreadRadius: 0.05,
                      )
                    ]),
                    child: Image.asset('images/icon.png',
                        height: 100.0, width: 100.0),
                  )
                ],
              ),
            ),
            Text(
              'CEP Brasil - © 2019',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.w300),
            ),
            Card(
              elevation: 2.0,
              child: Column(
                children: <Widget>[
                  tileTitle('Autor'),
                  tileData('Desenvolvedor', 'Rodrigo Shinoda', Icons.person,
                      () => _launchURL('https://github.com/rodrigordgfs')),
                  tileData('Contato', '+55 51 99623-6798', Icons.phone_android,
                      () => _launchURL('tel:51996236798'))
                ],
              ),
            ),
            Card(
              elevation: 2.0,
              child: Column(
                children: <Widget>[
                  tileTitle('Projeto'),
                  tileData(
                      'Repositório',
                      'GitHub - CEP Brasil',
                      Icons.folder_shared,
                      () => _launchURL(
                          'https://github.com/shinoda-labs/cep-brasil')),
                  tileData('Colaboração', 'Fluttership', Icons.phone_android,
                      () => _launchURL('https://fluttership.com.br/'))
                ],
              ),
            ),
            Card(
              elevation: 2.0,
              child: Column(
                children: <Widget>[
                  tileTitle('Informações'),
                  tileData('Versão', '1.0.2', Icons.verified_user, null),
                  tileData('API', 'Via CEP', Icons.settings_ethernet,
                      () => _launchURL('https://viacep.com.br/')),
                  tileData('Inicio do Desenvolvimento', '12/09/2019', Icons.date_range, null)
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget tileTitle(String title) {
    return ListTile(
      title: Text(title, style: TextStyle(fontWeight: FontWeight.w400)),
    );
  }

  Widget tileData(
      String title, String subtitle, IconData icon, Function event) {
    return ListTile(
      title: Text(
        title,
        style: TextStyle(fontWeight: FontWeight.w300),
      ),
      subtitle: Text(
        subtitle,
        style: TextStyle(fontWeight: FontWeight.w300),
      ),
      leading: Icon(
        icon,
        color: Colors.green,
      ),
      trailing: Icon(Icons.arrow_forward_ios, color: Colors.green),
      onTap: event,
    );
  }

  void _launchURL(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Não foi possivel abrir $url';
    }
  }
}
