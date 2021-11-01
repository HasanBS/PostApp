import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:recipe_book/view/splash/cubit/splash_cubit.dart';

import 'core/constants/app/app_constants.dart';
import 'core/init/lang/lang_manager.dart';
import 'core/init/navigation/navigation_route.dart';
import 'core/init/navigation/navigation_service.dart';
import 'core/init/theme/cubit/theme_cubit.dart';
import 'core/init/theme/dark/app_theme_dark.dart';
import 'core/init/theme/light/app_theme_light.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  runApp(MultiBlocProvider(
    providers: [
      BlocProvider<ThemeCubit>(
        create: (context) => ThemeCubit(),
      ),
      BlocProvider(
        create: (context) => SplashCubit()..initOperations(),
      )
    ],
    child: EasyLocalization(
        supportedLocales: LanguageManager.instance.supportedLocales,
        path: AppConstants.LANG_PATH,
        child: MyApp()),
  ));
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      localizationsDelegates: context.localizationDelegates,
      supportedLocales: context.supportedLocales,
      locale: context.locale,
      debugShowCheckedModeBanner: false,
      onGenerateRoute: NavigationRoute.instance.generateRoute,
      navigatorKey: NavigationService.instance.navigatorKey,
      theme: AppThemeLight.instance.theme,
      darkTheme: AppThemeDark.instance.theme,
      themeMode:
          context.select((ThemeCubit themeCubit) => themeCubit.state.themeMode),
    );
  }
}
