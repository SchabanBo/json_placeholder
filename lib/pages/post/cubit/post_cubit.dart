import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:qlevar_router/qlevar_router.dart';

import '../../../models/comment.dart';
import '../../../models/post.dart';
import '../../../services/post_service.dart';

part 'post_state.dart';

class PostCubit extends Cubit<PostState> {
  final PostService postRepository;
  PostCubit(this.postRepository) : super(PostLoading()) {
    loadPost();
  }

  Future<void> loadPost() async {
    emit(PostLoading());
    try {
      final postId = QR.params['postId']!.asInt!;
      final post = await postRepository.getPost(postId);
      final comments = await postRepository.getComments(postId);

      if (post == null || comments == null) {
        emit(PostError('Error loading post'));
      } else {
        emit(PostLoaded(post, comments));
      }
    } catch (e) {
      emit(PostError(e.toString()));
    }
  }

  Future<Post?> getPost() async {
    try {
      // if we have the post in the params, use it
      // otherwise, get it from the repository
      if (QR.params['post'] != null) {
        return QR.params['post'] as Post;
      }
      final postId = QR.params['postId']!.asInt!;
      final post = await postRepository.getPost(postId);
      return post;
    } catch (e) {
      return null;
    }
  }
}
