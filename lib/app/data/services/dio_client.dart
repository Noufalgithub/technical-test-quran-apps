import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';

class DioClient {
  static final Dio _dio =
      Dio(
          BaseOptions(
            baseUrl: 'https://open-api.my.id/api/quran',
            connectTimeout: const Duration(seconds: 15),
            receiveTimeout: const Duration(seconds: 15),
            responseType: ResponseType.json,
          ),
        )
        ..interceptors.addIf(
          kDebugMode,
          LogInterceptor(
            request: true,
            requestBody: true,
            responseBody: true,
            responseHeader: false,
            error: true,
            requestHeader: false,
          ),
        );

  static Dio get instance => _dio;
}

extension on Interceptors {
  void addIf(bool condition, Interceptor interceptor) {
    if (condition) add(interceptor);
  }
}
