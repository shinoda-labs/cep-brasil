import 'package:flutter/material.dart';

class Historico extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Center(
        child: CircularProgressIndicator(backgroundColor: Colors.green)
      ),
    );
  }
}