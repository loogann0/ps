import 'package:dio/dio.dart';
import 'package:logger/logger.dart';

class RegistroApi {
  final Dio _dio = Dio();
  final Logger _logger = Logger();

  Future<void> register({
    required String username,
    required String email,
    required String password,
    required String codeValid,
  }) async {
    try {
      final response = await _dio.post(
        'https://9e41-2806-310-118-8e0e-fd68-7169-a3e5-a601.ngrok.io/api/register',
        options: Options(
          headers: {
            'Content-Type': 'application/json',
          },
        ),
        data: {
          "username": username,
          "email": email,
          "password": password,
          "codeValid": codeValid,
        },
      );
      _logger.i(response.data);
    } catch (e) {
      _logger.e(e);
    }
  }

  Future<void> loginOk({
    required String email,
    required String password,
  }) async {
    try {
      final response = await _dio.post(
        'http://192.168.0.100:8000/api/auth/login',
        options: Options(
          headers: {
            'Content-Type': 'application/json',
          },
        ),
        data: {
          "email": email,
          "password": password,
        },
      );
      _logger.i(response.data);
    } catch (e) {
      _logger.e(e);
    }
  }
}
