import 'package:cep_brasil/main.dart';
import 'package:cep_brasil/utils/CepArguments.dart';
import 'package:flutter/material.dart';

class Consultar extends StatelessWidget {
  GlobalKey<ScaffoldState> scaffoldKey;

  Consultar(this.scaffoldKey);

  @override
  Widget build(BuildContext context) {
    TextEditingController _controller = TextEditingController();

    return Container(
      color: Colors.white,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Padding(
              padding: EdgeInsets.symmetric(vertical: 16.0, horizontal: 16.0),
              child: TextField(
                cursorColor: Colors.green,
                controller: _controller,
                keyboardType: TextInputType.number,
                textInputAction: TextInputAction.search,
                autocorrect: false,
                maxLength: 8,
                decoration: InputDecoration(
                    hintText: 'CPF',
                    icon: Icon(
                      Icons.room,
                      color: Colors.green,
                    ),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(10.0),
                            topRight: Radius.circular(10.0)))),
              )),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.0),
            child: MaterialButton(
              color: Colors.green,
              height: 60,
              onPressed: () {
                if (_controller.text.length < 8) {
                  scaffoldKey.currentState.showSnackBar(SnackBar(
                    content: Text('CEP inválido'),
                    duration: Duration(seconds: 3),
                  ));
                } else {
                  Navigator.pushNamed(context, Main.CepResultScreen,
                      arguments: CepArguments(_controller.text));
                }
              },
              child: Text(
                'Consultar',
                style: TextStyle(color: Colors.white),
              ),
              elevation: 4,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10)),
            ),
          )
        ],
      ),
    );
  }
}
