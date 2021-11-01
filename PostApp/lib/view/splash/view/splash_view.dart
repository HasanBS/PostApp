import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:recipe_book/view/splash/cubit/splash_cubit.dart';

import '../../../core/components/lottie/lottie_widget.dart';
import '../../../core/constants/image/image_constatns.dart';
import '../../../core/extensions/context_extension.dart';

class SplashView extends StatelessWidget {
  const SplashView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return _buildScaffoldBody(context);
  }

  Widget _buildScaffoldBody(BuildContext context) {
    return BlocBuilder<SplashCubit, SplashState>(
      builder: (context, state) {
        return Scaffold(
            body: Container(
          color: context.colorScheme.primary,
          child: SafeArea(
            child: Stack(
              children: [
                _buildAnimatedLottie(context),
              ],
            ),
          ),
        ));
      },
    );
  }

  Widget _buildAnimatedLottie(BuildContext context) {
    return AnimatedAlign(
      alignment: Alignment.center,
      duration: context.durationSlow,
      child: LottieWidget(
        path: ImageConstants.instance.iconLoti,
        repeat: false,
      ),
    );
  }
}
