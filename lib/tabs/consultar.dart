import 'package:flutter/material.dart';

class Consultar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 16.0, horizontal: 16.0),
        child: TextField(
            decoration: InputDecoration(
              fillColor: Colors.grey,
                border: UnderlineInputBorder(
                    borderRadius: BorderRadius.circular(15.0),
                ),
                hintText: 'CEP')),
      ),
    );
  }
}
