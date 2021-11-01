import 'dart:io';

import 'package:dio/adapter.dart';
import 'package:dio/dio.dart';
import '../../base/model/ibase_model.dart';
import '../../constants/enum/http_request_enum.dart';

import '../../base/model/base_error.dart';
import '../../extensions/network_extension.dart';
import 'icore_dio.dart';
import 'iresponse_model.dart';

part './network_core/core_operations.dart';

class CoreDio with DioMixin implements Dio, ICoreDio {
  @override
  final BaseOptions options;

  CoreDio(this.options) {
    options = options;
    interceptors.add(InterceptorsWrapper());
    httpClientAdapter = DefaultHttpClientAdapter();
  }

  @override
  Future<IResponseModel<R>> send<R, T extends IBaseModel>(String path,
      {required HttpTypes type,
      required T parseModel,
      dynamic data,
      Map<String, dynamic>? queryParameters,
      void Function(int, int)? onReceiveProgress}) async {
    final response = await request(path,
        data: data, options: Options(method: type.enumValue));
    switch (response.statusCode) {
      case HttpStatus.ok:
      case HttpStatus.accepted:
        final model = _responseParser<R, T>(parseModel, response.data);
        return ResponseModel<R>(data: model);
      default:
        return ResponseModel(
            error: BaseError(response.statusMessage ?? " Error :( "));
    }
  }
}
