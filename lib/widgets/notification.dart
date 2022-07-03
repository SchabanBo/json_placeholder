import 'package:flutter/material.dart';
import 'package:qlevar_router/qlevar_router.dart';

void showNotification(
  String title,
  String message, {
  NotificationType type = NotificationType.error,
}) {
  final context = QR.context!;
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      backgroundColor: type == NotificationType.error
          ? Theme.of(context).errorColor
          : Colors.green.withOpacity(0.5),
      content: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(title, style: Theme.of(context).textTheme.headline6),
            Text(message, style: Theme.of(context).textTheme.bodyText1),
          ],
        ),
      ),
      duration: const Duration(seconds: 3),
    ),
  );
}

enum NotificationType {
  error,
  success,
}
