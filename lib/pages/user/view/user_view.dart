import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:qlevar_router/qlevar_router.dart';

import '../../../widgets/error.dart';
import '../../../widgets/loading.dart';
import '../cubit/user_cubit.dart';

final List<String> userTabs = [
  "Info Page",
  "Posts Page",
  "Todo Page",
];

class UserView extends StatefulWidget {
  final QRouter router;
  const UserView({required this.router, Key? key}) : super(key: key);

  @override
  State<UserView> createState() => _UserViewState();
}

class _UserViewState extends State<UserView> {
  @override
  void initState() {
    super.initState();
    // We need to add listener here so the bottomNavigationBar
    // get updated (the selected tab) when we navigate to new page
    widget.router.navigator.addListener(update);
  }

  void update() => setState(() {});

  @override
  void dispose() {
    // remove listener when we dispose
    widget.router.navigator.removeListener(update);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('User ${QR.params['userId']!}'),
        centerTitle: true,
      ),
      body: BlocBuilder<UserCubit, UserState>(
        builder: (context, state) {
          if (state is UserLoading) return const LoadingWidget();
          if (state is UserError) {
            return ErrorMessageWidget(message: state.error);
          }
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: widget.router,
          );
        },
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.info), label: 'Information'),
          BottomNavigationBarItem(icon: Icon(Icons.post_add), label: 'Posts'),
          BottomNavigationBarItem(icon: Icon(Icons.toc), label: 'Todos'),
        ],
        currentIndex: userTabs.indexWhere((e) => e == widget.router.routeName),
        onTap: (v) => QR.toName(userTabs[v]),
      ),
    );
  }
}
