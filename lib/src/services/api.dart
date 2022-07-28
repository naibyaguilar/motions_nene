import 'dart:convert';

import 'package:http/http.dart' as http;

class API {
  static Future<List<dynamic>> getStatus() async {
    try {
      http.Response response = await http.get(Uri.parse(
          'https://nenemotions-default-rtdb.firebaseio.com/Lectura.json'));
      print(jsonDecode(response.body));
      return jsonDecode(response.body);
    } catch (e) {
      print(e);
      return [];
    }
  }
}
