import 'package:dio/dio.dart';
import 'package:mobile_final/data/repositories/auth_repository.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

class ApiRepository {
  late Dio dio;
  final AuthRepository authRepository;

  ApiRepository({
    required this.authRepository,
  }) {
    final options = BaseOptions(
      baseUrl: 'https://lebaohiep.com/cs426-final',
      connectTimeout: 5000,
      receiveTimeout: 3000,
    );
    dio = Dio(options);

    dio.interceptors.add(PrettyDioLogger(
      requestHeader: true,
      requestBody: true,
      responseBody: true,
      responseHeader: false,
      error: true,
      compact: true,
      maxWidth: 90,
    ));
  }

  Future request({
    required String postfix,
    required String method,
    required data,
  }) async {
    var token = await authRepository.token;
    return dio.request(
      postfix,
      options: Options(
        method: method,
        headers: {
          'Accept': 'application/json',
          'Authorization': 'Bearer $token',
        },
      ),
      data: data,
    );
  }
}
