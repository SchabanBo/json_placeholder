import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:qlevar_router/qlevar_router.dart';

import '../../../models/comment.dart';
import '../../../models/post.dart';
import '../cubit/post_cubit.dart';

class PostWidget extends StatelessWidget {
  const PostWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: const [
        _PostInfo(),
        SizedBox(height: 8),
        Expanded(child: Card(elevation: 5, child: _Comments())),
      ],
    );
  }
}

class _PostInfo extends StatelessWidget {
  const _PostInfo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocSelector<PostCubit, PostState, Post>(
      selector: (state) => (state as PostLoaded).post,
      builder: (context, post) => Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              post.title,
              style: const TextStyle(fontSize: 18),
            ),
            Text(
              post.body,
              style: Theme.of(context).textTheme.bodyText2,
            ),
            Align(
              alignment: Alignment.centerRight,
              child: InkWell(
                onTap: () => QR.to('/users/${post.userId}/info'),
                child: const Text(
                  'Show user information',
                  style: TextStyle(
                    color: Colors.indigo,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _Comments extends StatelessWidget {
  const _Comments({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocSelector<PostCubit, PostState, List<Comment>>(
      selector: (state) => (state as PostLoaded).comments,
      builder: (context, comments) => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              const Icon(Icons.comment),
              const SizedBox(width: 8),
              Text(
                '${comments.length} Comments',
                style: Theme.of(context).textTheme.bodyLarge,
              ),
            ],
          ),
          const SizedBox(height: 8),
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: [for (final comment in comments) _Comment(comment)],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _Comment extends StatelessWidget {
  final Comment comment;
  const _Comment(this.comment, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 4),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(comment.name, style: const TextStyle(fontSize: 18)),
            const SizedBox(height: 8),
            Text(comment.body),
            const Divider()
          ],
        ),
      ),
    );
  }
}
