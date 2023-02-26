import 'package:dio/dio.dart';
import 'package:x_app_flutter/main.dart';
import 'package:x_app_flutter/services/app_constants.dart';

class Client {
  static Dio? _dio;

  Dio get client {
    if (_dio != null) {
      return _dio!;
    } else {
      _dio = _initClient();
      return _dio!;
    }
  }

  Dio _initClient() => Dio()
    ..options.baseUrl = MyApp.appEnvironment == AppEnvironment.develop
        ? "http://localhost:3000/api/dev"
        : MyApp.appEnvironment == AppEnvironment.uat
            ? 'http://localhost:3000/api/uat'
            : 'http://localhost:3000/api/prod'
    ..options.connectTimeout = 15000 as Duration?
    ..options.receiveTimeout = 15000 as Duration?;
}
