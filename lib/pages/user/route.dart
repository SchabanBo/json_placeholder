import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:qlevar_router/qlevar_router.dart';

import '../../services/user_service.dart';
import 'cubit/user_cubit.dart';
import 'view/info_tab.dart';
import 'view/posts_tab.dart';
import 'view/todo_tab.dart';
import 'view/user_view.dart';

final userRoute = QRoute.withChild(
  path: '/users/:userId',
  initRoute: '/info',
  builderChild: (router) => BlocProvider(
    create: (context) {
      final dio = RepositoryProvider.of<Dio>(context);
      return UserCubit(UserService(dio));
    },
    child: UserView(router: router),
  ),
  children: [
    QRoute(
      name: userTabs[0],
      pageType: const QSlidePage(),
      path: '/info',
      builder: () => const InfoTab(),
    ),
    QRoute(
      name: userTabs[1],
      pageType: const QSlidePage(),
      path: '/posts',
      builder: () => const PostsTab(),
    ),
    QRoute(
      name: userTabs[2],
      pageType: const QSlidePage(),
      path: '/todos',
      builder: () => const TodoTab(),
    ),
  ],
);
