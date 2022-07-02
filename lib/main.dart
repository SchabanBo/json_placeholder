import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:qlevar_router/qlevar_router.dart';

import 'pages/home/route.dart';
import 'pages/post/route.dart';
import 'pages/user/route.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final routes = [
      homeRoute,
      postRoute,
      userRoute,
    ];
    return RepositoryProvider.value(
      // Add one instance of Dio to the RepositoryProvider. to use it in the whole app.
      value: Dio(BaseOptions(baseUrl: 'https://jsonplaceholder.typicode.com')),
      child: MaterialApp.router(
        // Add the theme
        theme: ThemeData(
          brightness: Brightness.light,
          colorSchemeSeed: Colors.indigo,
        ),
        // Add the routes with qlevar router
        routeInformationParser: const QRouteInformationParser(),
        routerDelegate: QRouterDelegate(routes),
      ),
    );
  }
}
