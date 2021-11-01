import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:recipe_book/core/components/text/auto_locale_text.dart';
import 'package:recipe_book/core/init/lang/locale_keys.g.dart';
import 'package:recipe_book/view/post/model/post_model.dart';
import '../../../core/extensions/context_extension.dart';
import 'package:recipe_book/core/extensions/string_extension.dart';

class PostView extends StatelessWidget {
  final PostModel model;

  const PostView({Key? key, required this.model}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _appBar(context),
      body: _pageBody(context),
    );
  }

  AppBar _appBar(BuildContext context) {
    return AppBar(
      leading: BackButton(
        color: context.colorScheme.secondary,
      ),
      title: const AutoLocaleText(
        value: LocaleKeys.page_appbar_title,
      ),
    );
  }

  Column _pageBody(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        _postTitle(context),
        _postBody(context),
      ],
    );
  }

  Column _postTitle(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        AutoSizeText(
          LocaleKeys.page_user.locale + model.userId.toString(),
          textAlign: TextAlign.center,
          style: context.textTheme.headline5!
              .copyWith(color: context.colorScheme.secondary),
        ),
        AutoSizeText(
          "${LocaleKeys.page_title.locale}\n${model.title!}",
          textAlign: TextAlign.center,
          maxLines: 3,
          style: context.textTheme.headline5!
              .copyWith(color: context.colorScheme.secondary),
        ),
      ],
    );
  }

  Padding _postBody(BuildContext context) {
    return Padding(
      padding: context.paddingMedium,
      child: Container(
          height: context.height * 0.6,
          padding: context.paddingNormal,
          alignment: Alignment.center,
          decoration: BoxDecoration(
            color: context.oneTo10Color(model.userId!),
            borderRadius: BorderRadius.all(context.normalRadius),
          ),
          child: AutoSizeText(
            model.body!,
            style: context.textTheme.headline5!
                .copyWith(color: context.colorScheme.primary),
          )),
    );
  }
}
