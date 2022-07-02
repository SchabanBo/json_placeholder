part of 'home_cubit.dart';

enum HomeStatus {
  loading,
  loaded,
}

@immutable
abstract class HomeState {}

class HomeLoading extends HomeState {}

class HomeLoaded extends HomeState {
  final List<Post> posts;
  HomeLoaded(this.posts);
}

class HomeError extends HomeState {
  final String message;
  HomeError(this.message);
}
