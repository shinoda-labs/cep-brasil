import 'package:cep_brasil/screen/About.dart';
import 'package:cep_brasil/screen/cep_result.dart';
import 'package:flutter/material.dart';
import 'package:cep_brasil/screen/home.dart';

void main() => runApp(Main());

class Main extends StatelessWidget {
  static const CepResultScreen = '/CepResultScreen';
  static const AboutScreen = '/AboutScreen';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'CEP Brasil',
      debugShowCheckedModeBanner: false,
      theme:
          ThemeData(primaryColor: Colors.green, primarySwatch: Colors.yellow),
      home: Home(),
      routes: <String, WidgetBuilder>{
        CepResultScreen: (BuildContext context) => new CepResult(),
        AboutScreen: (BuildContext context) => new About()
      },
    );
  }
}
