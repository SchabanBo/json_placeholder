import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:qlevar_router/qlevar_router.dart';

import '../../../widgets/error.dart';
import '../../../widgets/loading.dart';
import '../cubit/post_cubit.dart';
import 'post_widget.dart';

class PostView extends StatelessWidget {
  const PostView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Post ${QR.params['postId']!}'),
        centerTitle: true,
      ),
      body: BlocBuilder<PostCubit, PostState>(
        builder: (context, state) {
          if (state is PostLoading) return const LoadingWidget();
          if (state is PostError) {
            return ErrorMessageWidget(message: state.error);
          }
          return const Padding(
            padding: EdgeInsets.all(8.0),
            child: PostWidget(),
          );
        },
      ),
    );
  }
}
