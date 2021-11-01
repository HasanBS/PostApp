import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:recipe_book/core/constants/navigation/navigation_constants.dart';
import 'package:recipe_book/core/init/navigation/navigation_service.dart';
import 'package:recipe_book/view/post/model/post_model.dart';
import 'package:recipe_book/view/splash/service/splash_service.dart';

part 'splash_state.dart';

class SplashCubit extends Cubit<SplashState> {
  SplashCubit() : super(SplashLoadInProgress());

  List<List<PostModel?>> usersModelsList = [];

  Future<void> _getPosts(List<PostModel?> postModels) async {
    List<PostModel?> listt = postModels;
    int i = 1;
    while (true) {
      if (listt.isEmpty) {
        break;
      }
      final userData = listt.where((element) => element!.userId == i).toList();
      listt.removeWhere((element) => element!.userId == i);
      usersModelsList.add(userData);
      i++;
    }
  }

  Future<void> initOperations() async {
    await Future.delayed(const Duration(milliseconds: 2000));
    final postService = SplashService.instance.postService;
    final response = await postService.fechPostList();

    if (response.error == null) {
      await _getPosts(response.data!);
      emit(SplashLoadSuccess(usersModelsList));
      await NavigationService.instance
          .navigateToPageClear(path: NavigationConstants.HOME);
    } else {
      emit(SplashLoadError());
      await NavigationService.instance
          .navigateToPageClear(path: NavigationConstants.HOME);
    }
  }
}
