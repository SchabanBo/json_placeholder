part of 'user_cubit.dart';

@immutable
abstract class UserState {}

class UserLoading extends UserState {}

class UserLoaded extends UserState {
  final User user;
  final List<Post> posts;
  final List<Todo> todos;
  UserLoaded(this.user, this.posts, this.todos);
}

class UserError extends UserState {
  final String error;
  UserError(this.error);
}
