import 'package:flutter/material.dart';
import 'package:cep_brasil/screen/home.dart';

void main() => runApp(Main());

class Main extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'CEP Brasil',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: Colors.green,
        primarySwatch: Colors.yellow
      ),
      home: Home(),
    );
  }
}