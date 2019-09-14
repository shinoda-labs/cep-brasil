import 'package:http/http.dart' as http;
import 'package:cep_brasil/models/cep.dart';

class CepApi {
  static Future<dynamic> fetchCep({String cep}) async {
    final response = await http.get('https://viacep.com.br/ws/$cep/json/');
    if (response.statusCode == 200) {
      return Cep.fromJson(response.body);
    } else {
      throw Exception('Requisição inválida');
    }
  }
}
