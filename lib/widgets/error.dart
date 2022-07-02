import 'package:flutter/material.dart';

import '../helpers/extensions/context_extensions.dart';

class ErrorMessageWidget extends StatelessWidget {
  final String message;
  const ErrorMessageWidget({required this.message, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        message,
        style: context.textTheme.headline4!
            .copyWith(color: context.theme.errorColor),
      ),
    );
  }
}
