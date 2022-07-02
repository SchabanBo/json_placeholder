import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../widgets/loading.dart';
import '../cubit/user_cubit.dart';

class TodoTab extends StatelessWidget {
  const TodoTab({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<UserCubit, UserState>(
      builder: (context, state) {
        if (state is! UserLoaded) {
          return const LoadingWidget();
        }
        final todos = (state).todos;
        return ListView.builder(
          itemCount: todos.length,
          itemBuilder: (context, index) {
            final todo = todos[index];
            return CheckboxListTile(
              onChanged: (value) {},
              title: Text('${todo.id} ${todo.title}'),
              value: todo.completed,
            );
          },
        );
      },
    );
  }
}
