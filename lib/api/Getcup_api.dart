import 'package:http/http.dart' as http;

class UsCupApi {
  final String endpoint = 'http://10.0.2.2/api/getcup';

  Future obtenerCupon() {
    return http.get(Uri.parse(
        "https://9e41-2806-310-118-8e0e-fd68-7169-a3e5-a601.ngrok.io/api/getcup"));
  }
}
