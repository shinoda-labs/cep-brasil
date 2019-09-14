import 'package:cep_brasil/api/cep_api.dart';
import 'package:cep_brasil/screen/cep_result.dart';
import 'package:cep_brasil/utils/CepArguments.dart';
import 'package:flutter/material.dart';
import 'package:cep_brasil/tabs/consultar.dart';
import 'package:cep_brasil/tabs/historico.dart';

import '../main.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> with SingleTickerProviderStateMixin {
  static const CepResultScreen = '/CepResultScreen';
  String _result;
  bool _loading = false;
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
      body: TabBarView(
        controller: _tabController,
        children: <Widget>[
          Consultar(),
          Historico()
        ],
      ),
    );
  }
}
