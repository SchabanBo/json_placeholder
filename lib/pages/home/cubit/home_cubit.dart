import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../models/post.dart';
import '../../../services/post_service.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  final PostService postRepository;
  HomeCubit(this.postRepository) : super(HomeLoading()) {
    load();
  }

  Future<void> load() async {
    emit(HomeLoading());
    try {
      final posts = await postRepository.getPosts();
      if (posts == null) {
        emit(HomeError('Failed to load posts'));
      }
      emit(HomeLoaded(posts!));
    } catch (e) {
      emit(HomeError(e.toString()));
    }
  }
}
