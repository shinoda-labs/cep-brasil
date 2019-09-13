import 'package:flutter/material.dart';
import 'package:cep_brasil/tabs/consultar.dart';
import 'package:cep_brasil/tabs/historico.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> with SingleTickerProviderStateMixin {
  TabController _tabController;
  TextEditingController _controller = TextEditingController();
  GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  @override
  void initState() {
    _tabController = new TabController(length: 2, vsync: this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        title: Text('CEP Brasil'),
        backgroundColor: Colors.green,
        bottomOpacity: 1,
        bottom: TabBar(
          unselectedLabelColor: Colors.white,
          labelColor: Colors.yellow,
          controller: _tabController,
          indicatorSize: TabBarIndicatorSize.tab,
          indicatorColor: Colors.yellow,
          tabs: <Widget>[
            Tab(
              text: 'Consultar',
            ),
            Tab(
              text: 'Histórico',
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        backgroundColor: Colors.green,
        icon: Icon(
          Icons.search,
          color: Colors.white,
        ),
        isExtended: true,
        label: Text(
          'Consultar',
          style: TextStyle(color: Colors.white),
        ),
        onPressed: () {
          if (_controller.text.length < 8) {
            _scaffoldKey.currentState.showSnackBar(SnackBar(
              content: Text('CEP inválido'),
              duration: Duration(seconds: 3),
            ));
          }
        },
      ),
      body: TabBarView(
        controller: _tabController,
        children: <Widget>[
          Container(
            color: Colors.white,
            child: Padding(
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
          ),
          Historico()
        ],
      ),
    );
  }
}
