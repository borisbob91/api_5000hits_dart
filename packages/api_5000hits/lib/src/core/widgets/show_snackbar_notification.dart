import 'package:flutter/material.dart';

enum MessageType { success, error, warning }

void ShowSnackBarNotification({
  required BuildContext context,
  required String message,
  required MessageType type,
}) {
  Color backgroundColor;

  switch (type) {
    case MessageType.success:
      backgroundColor = Colors.green;
      break;
    case MessageType.error:
      backgroundColor = Colors.red;
      break;
    case MessageType.warning:
      backgroundColor = Colors.orange;
      break;
  }

  final snackBar = SnackBar(
    content: Text(message),
    showCloseIcon: true,
    dismissDirection: DismissDirection.horizontal,
    backgroundColor: backgroundColor,
    duration: Duration(seconds: 5),
    behavior: SnackBarBehavior.floating,
    
  );

  ScaffoldMessenger.of(context).showSnackBar(snackBar);
}
