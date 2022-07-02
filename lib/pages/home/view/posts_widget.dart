import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:qlevar_router/qlevar_router.dart';

import '../../../models/post.dart';
import '../cubit/home_cubit.dart';

class PostsWidget extends StatelessWidget {
  const PostsWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocSelector<HomeCubit, HomeState, List<Post>>(
      selector: (state) => (state as HomeLoaded).posts,
      builder: (context, posts) {
        return ListView.builder(
          itemCount: posts.length,
          itemBuilder: (context, index) => _PostItem(post: posts[index]),
        );
      },
    );
  }
}

class _PostItem extends StatelessWidget {
  final Post post;
  const _PostItem({required this.post, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        onTap: () {
          // send the post to the next page so we don't need to fetch it again
          QR.params['post'] = post;
          QR.to('/posts/${post.id}');
        },
        leading: Text('${post.id}'),
        title: Text(post.title),
        trailing: IconButton(
          onPressed: () => QR.to('/users/${post.userId}/info'),
          icon: const Icon(Icons.person, color: Colors.indigo),
        ),
      ),
    );
  }
}
