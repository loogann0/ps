import 'dart:convert';

import 'package:http/http.dart' as http;

const String baseUrl =
    'https://9e41-2806-310-118-8e0e-fd68-7169-a3e5-a601.ngrok.io/api';

class BaseCkient {
  var client = http.Client();

  Future<dynamic> put(dynamic object, String api) async {
    var url = Uri.parse(baseUrl + api);
    var Array = jsonEncode(object);
    var _headers = {'Content-Type': 'application/json; charset=UTF-8'};

    var response = await client.put(url, body: Array, headers: _headers);
    if (response.statusCode == 200) {
      return response.body;
    } else {}
  }
}
