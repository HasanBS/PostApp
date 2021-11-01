import 'package:recipe_book/core/init/network/vexena_manager.dart';
import 'package:recipe_book/view/post/service/post_service.dart';

class SplashService {
  static SplashService? _instance;

  static SplashService get instance {
    if (_instance != null) return _instance!;
    _instance = SplashService._init();
    return _instance!;
  }

  VexanaManager? vexanaManager = VexanaManager.instance;

  SplashService._init() {
    postService = PostService(vexanaManager!.networkManager);
  }

  late PostService postService;
}
