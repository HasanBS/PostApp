enum NetworkRoutes { POSTS }

extension NetwrokRoutesString on NetworkRoutes {
  String get sValue {
    switch (this) {
      case NetworkRoutes.POSTS:
        return 'posts';
      default:
        throw Exception('Routes Not FouND');
    }
  }
}
