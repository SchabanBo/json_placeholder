import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../widgets/error.dart';
import '../../../widgets/loading.dart';
import '../cubit/home_cubit.dart';
import 'posts_widget.dart';

class HomeView extends StatelessWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Posts'),
        centerTitle: true,
      ),
      body: BlocBuilder<HomeCubit, HomeState>(
        builder: (context, state) {
          if (state is HomeLoading) return const LoadingWidget();
          if (state is HomeError) {
            return ErrorMessageWidget(message: state.message);
          }

          return const Padding(
            padding: EdgeInsets.all(8.0),
            child: PostsWidget(),
          );
        },
      ),
    );
  }
}
