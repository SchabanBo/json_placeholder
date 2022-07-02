part of 'post_cubit.dart';

@immutable
abstract class PostState {}

class PostLoading extends PostState {}

class PostLoaded extends PostState {
  final Post post;
  final List<Comment> comments;
  PostLoaded(this.post, this.comments);
}

class PostError extends PostState {
  final String error;
  PostError(this.error);
}
