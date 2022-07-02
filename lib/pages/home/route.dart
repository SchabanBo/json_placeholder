import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:qlevar_router/qlevar_router.dart';

import '../../services/post_service.dart';
import 'cubit/home_cubit.dart';
import 'view/home_view.dart';

final homeRoute = QRoute(
  path: '/',
  builder: () => BlocProvider(
    create: (context) {
      final dio = RepositoryProvider.of<Dio>(context);
      return HomeCubit(
        PostService(dio),
      );
    },
    child: const HomeView(),
  ),
);
