import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:recipe_book/core/components/text/auto_locale_text.dart';
import 'package:recipe_book/core/constants/navigation/navigation_constants.dart';
import 'package:recipe_book/core/extensions/string_extension.dart';
import 'package:recipe_book/core/init/lang/locale_keys.g.dart';
import 'package:recipe_book/core/init/navigation/navigation_service.dart';
import 'package:recipe_book/view/post/model/post_model.dart';
import 'package:recipe_book/view/splash/cubit/splash_cubit.dart';
import '../../../core/extensions/context_extension.dart';

class HomeView extends StatelessWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const AutoLocaleText(value: LocaleKeys.home_appbar_title),
      ),
      body: BlocBuilder<SplashCubit, SplashState>(
        builder: (context, state) {
          if (state is SplashLoadSuccess) {
            return ListView.builder(
                padding: context.paddingLow,
                itemCount: state.usersModelsList.length,
                itemBuilder: (BuildContext context, int index) {
                  return _buildPages(context, state.usersModelsList[index]);

                  // return _buildCards(context, itemIndex,
                  //     state.postModels[itemIndex]!.title!);
                });
          } else if (state is SplashLoadError) {
            return const Center(
                child: AutoLocaleText(value: LocaleKeys.home_error_text));
          } else {
            return const CircularProgressIndicator();
          }
        },
      ),
    );
  }
}

Widget _buildPages(BuildContext context, List<PostModel?> modelList) {
  return Column(
    mainAxisSize: MainAxisSize.min,
    children: <Widget>[
      const Divider(),
      AutoSizeText(
        LocaleKeys.home_user.locale + modelList[0]!.userId.toString(),
        style: context.textTheme.headline5,
      ),
      SizedBox(
        height: context.height * 0.22,
        child: PageView.builder(
          itemCount: modelList.length,
          controller: PageController(viewportFraction: 0.95),
          itemBuilder: (BuildContext context, int itemIndex) {
            return _buildCard(context, modelList[itemIndex]!, itemIndex);
          },
        ),
      )
    ],
  );
}

Widget _buildCard(BuildContext context, PostModel model, int itemIndex) {
  return Padding(
    padding: context.paddingNormal,
    child: ElevatedButton(
      onPressed: () async {
        await NavigationService.instance
            .navigateToPage(path: NavigationConstants.POSTPAGE, data: model);
      },
      style: ElevatedButton.styleFrom(
        side: BorderSide.none,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(context.normalRadius), // <-- Radius
        ),
        shadowColor: Colors.transparent,
      ),
      child: Container(
          padding: context.paddingNormal,
          alignment: Alignment.center,
          decoration: BoxDecoration(
            color: context.oneTo10Color(model.userId!),
            borderRadius: BorderRadius.all(context.normalRadius),
          ),
          child: AutoSizeText(
            model.title!,
            style: context.textTheme.headline5!
                .copyWith(color: context.colorScheme.primary),
          )),
    ),
  );
}
