import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:recipe_book/view/post/model/post_model.dart';
import 'package:recipe_book/view/post/view/post_view.dart';
import 'package:recipe_book/view/post/view/home_view.dart';
import 'package:recipe_book/view/splash/view/splash_view.dart';

import '../../components/card/notfound_navigation_widget.dart';
import '../../constants/navigation/navigation_constants.dart';

class NavigationRoute {
  static final NavigationRoute _instance = NavigationRoute._init();
  static NavigationRoute get instance => _instance;

  NavigationRoute._init();

  Route<dynamic> generateRoute(RouteSettings args) {
    switch (args.name) {
      case NavigationConstants.DEFAULT:
        return normalNavigate(const SplashView());

      case NavigationConstants.HOME:
        return normalNavigate(const HomeView());

      case NavigationConstants.POSTPAGE:
        return normalNavigate(PostView(
          model: args.arguments! as PostModel,
        ));

      default:
        return MaterialPageRoute(
          builder: (context) => NotFoundNavigationWidget(),
        );
    }
  }

  MaterialPageRoute normalNavigate(Widget widget) {
    return MaterialPageRoute(
      builder: (context) => widget,
    );
  }
}
