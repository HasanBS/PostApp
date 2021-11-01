// ignore: unused_import
import 'dart:html';

import 'package:dio/dio.dart';

import 'core_dio.dart';
import 'icore_dio.dart';

class NetworkManager {
  static NetworkManager? _instance;

  static NetworkManager? get instance {
    return _instance ??= NetworkManager._init();
  }

  ICoreDio? coreDio;

  NetworkManager._init() {
    final baseOptions =
        BaseOptions(baseUrl: "https://jsonplaceholder.typicode.com/");

    coreDio = CoreDio(baseOptions);
  }
}
