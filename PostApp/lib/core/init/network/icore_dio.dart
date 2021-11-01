import '../../constants/enum/http_request_enum.dart';
import '../../base/model/ibase_model.dart';
import 'iresponse_model.dart';

abstract class ICoreDio {
  Future<IResponseModel<R>> send<R, T extends IBaseModel>(String path,
      {required HttpTypes type,
      required T parseModel,
      dynamic data,
      Map<String, Object>? queryParameters,
      void Function(int, int)? onReceiveProgress});
}

// MARK: Nul SAfety
abstract class ICoreDioFull extends ICoreDio {
  Future<IResponseModel<R>> fetchNoNetwork<R, T extends IBaseModel>(String path,
      {required HttpTypes type,
      required T parseModel,
      dynamic data,
      Map<String, Object>? queryParameters,
      void Function(int, int)? onReceiveProgress});
}
