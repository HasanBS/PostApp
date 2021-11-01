part of 'splash_cubit.dart';

abstract class SplashState extends Equatable {
  const SplashState();

  @override
  List<Object> get props => [];
}

class SplashLoadInProgress extends SplashState {}

class SplashLoadSuccess extends SplashState {
  final List<List<PostModel?>> usersModelsList;

  const SplashLoadSuccess(
    this.usersModelsList,
  );
}

class SplashLoadError extends SplashState {}
