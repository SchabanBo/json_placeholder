import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:qlevar_router/qlevar_router.dart';

import '../../../widgets/loading.dart';
import '../cubit/user_cubit.dart';

class PostsTab extends StatelessWidget {
  const PostsTab({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<UserCubit, UserState>(
      builder: (context, state) {
        if (state is! UserLoaded) {
          return const LoadingWidget();
        }
        final posts = (state).posts;
        return ListView.builder(
          itemCount: posts.length,
          itemBuilder: (context, index) {
            final post = posts[index];
            return Card(
              child: ListTile(
                onTap: () {
                  // send the post to the next page so we don't need to fetch it again
                  QR.params['post'] = post;
                  QR.to('/posts/${post.id}');
                },
                leading: Text('${post.id}'),
                title: Text(post.title),
              ),
            );
          },
        );
      },
    );
  }
}
