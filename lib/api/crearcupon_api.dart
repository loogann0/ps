import 'package:dio/dio.dart';
import 'package:logger/logger.dart';

class CrearCupon_api {
  final Dio _dio = Dio();
  final Logger _logger = Logger();

  Future<void> cuponCont(
      {required String empresa,
      required String descuento,
      required String username,
      required String email,
      required String status,
      required String codevalid,
      required String categoria,
      required String descripsion,
      required String domicilio,
      required String telefono,
      required String cuponDesc,
      required String restricciones,
      required String imagenemp}) async {
    try {
      final response = await _dio.post(
        'https://9e41-2806-310-118-8e0e-fd68-7169-a3e5-a601.ngrok.io/api/create',
        options: Options(
          followRedirects: false,
          validateStatus: (status) {
            return status != 500;
          },
          headers: {
            'Content-Type': 'application/json',
          },
        ),
        data: {
          "empresa": empresa,
          "status": status,
          "descuento": descuento,
          "categoria": categoria,
          "descripsion": descripsion,
          "domicilio": domicilio,
          "telefono": telefono,
          "cuponDesc": cuponDesc,
          "restricciones": restricciones,
          "codeValid": codevalid,
          "username": username,
          "email": email,
          "imagenemp": imagenemp,
        },
      );
      _logger.i(response.data);
    } catch (e) {
      _logger.e(e);
    }
  }
}
