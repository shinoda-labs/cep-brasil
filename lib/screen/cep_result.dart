import 'package:cep_brasil/api/cep_api.dart';
import 'package:cep_brasil/models/cep.dart';
import 'package:cep_brasil/utils/CepArguments.dart';
import 'package:flutter/material.dart';
import 'package:geocoder/geocoder.dart';
import 'dart:async';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class CepResult extends StatefulWidget {
  @override
  _CepResultState createState() => _CepResultState();
}

class _CepResultState extends State<CepResult> {
  CepArguments result;
  Completer<GoogleMapController> _controller = Completer();
  CameraPosition _kGooglePlex;

  Future _searchCep() async {
    return await CepApi.fetchCep(cep: result.cep);
  }

  Widget _tileCep(String title, String subtitle, IconData icon) {
    return ListTile(
        title: Text(title),
        subtitle: Text(subtitle != null ? subtitle : 'Sem dados'),
        leading: Icon(icon, color: Colors.green));
  }

  void setMapLocation(String logradouro, String bairro, String localidade, String uf) async {
    final query = '$logradouro, $bairro, $localidade, $uf';
    var addresses = await Geocoder.local.findAddressesFromQuery(query);
    var first = addresses.first;
    setState(() {
      _kGooglePlex = CameraPosition(
        target: LatLng(first.coordinates.latitude, first.coordinates.longitude),
        zoom: 14.4746,
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    setState(() {
      result = ModalRoute.of(context).settings.arguments;
    });
    return Scaffold(
      appBar: AppBar(
        title: Text('CEP Brasil - ${result.cep}'),
        centerTitle: true,
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.save, color: Colors.white),
            onPressed: () {},
          )
        ],
      ),
      body: FutureBuilder<dynamic>(
        future: _searchCep(),
        builder: (context, snapshot) {
          Cep cep = snapshot.data;
          if (snapshot.hasData) {
            setMapLocation(cep.logradouro, cep.bairro, cep.localidade, cep.uf);
            return Stack(
              alignment: Alignment.bottomCenter,
              children: <Widget>[
                GoogleMap(
                  mapType: MapType.normal,
                  initialCameraPosition: _kGooglePlex ?? _kGooglePlex,
                  onMapCreated: (GoogleMapController controller) {
                    _controller.complete(controller);
                  },
                ),
                Container(
                  padding: EdgeInsets.all(15),
                  height: MediaQuery.of(context).size.height / 2.24,
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(35.0),
                          topRight: Radius.circular(35.0)),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey,
                          blurRadius: 10.0,
                          spreadRadius: 0.05,
                        )
                      ]),
                  child: SafeArea(
                    child: Column(
                      children: <Widget>[
                        _tileCep('Endereço', cep.logradouro, Icons.location_on),
                        _tileCep('Complemento', cep.complemento,
                            Icons.collections_bookmark),
                        _tileCep('Bairro', cep.bairro, Icons.explore),
                        _tileCep('Cidade', cep.localidade, Icons.location_city),
                        _tileCep('UF', cep.uf, Icons.location_searching)
                      ],
                    ),
                  ),
                )
              ],
            );
          } else {
            return Container(
              color: Colors.white,
              child: Center(
                child: CircularProgressIndicator(
                  backgroundColor: Colors.green,
                ),
              ),
            );
          }
        },
      ),
    );
  }

}
