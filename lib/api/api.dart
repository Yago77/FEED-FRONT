import 'package:http/http.dart' as http;

import '../models/dados_api.dart';

class Api {
  static String url = "https://guarded-headland-27674.herokuapp.com";
  static Map<String, String> headers = {
    'Content-Type': 'aplication/json',
  };
}

Future<void> findAll() async {
  try {
    var response = await http.get(Uri.parse(Api.url), headers: Api.headers);
  } catch (e) {
    print(e);
  }
}
