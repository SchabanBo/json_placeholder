import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:qlevar_router/qlevar_router.dart';

import '../../services/post_service.dart';
import 'cubit/post_cubit.dart';
import 'view/post_view.dart';

final postRoute = QRoute(
  path: '/posts/:postId',
  builder: () => BlocProvider(
    create: (context) {
      final dio = RepositoryProvider.of<Dio>(context);
      return PostCubit(PostService(dio));
    },
    child: const PostView(),
  ),
);
