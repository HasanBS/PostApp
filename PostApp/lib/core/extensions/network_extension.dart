import '../constants/enum/http_request_enum.dart';

extension NetworkTypeExtension on HttpTypes? {
  String get enumValue {
    switch (this) {
      case HttpTypes.GET:
        return 'GET';
      case HttpTypes.POST:
        return 'POST';
      default:
        throw 'ERROR TYPE';
    }
  }
}
