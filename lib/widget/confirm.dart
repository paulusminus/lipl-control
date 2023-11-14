import 'package:flutter/material.dart';

Future<bool> confirm(
  BuildContext context, {
  required String title,
  required String content,
  required String textOK,
  required String textCancel,
}) async {
  final bool? isConfirm = await showDialog<bool>(
    context: context,
    builder: (_) => WillPopScope(
      child: AlertDialog(
        title: Text(title),
        content: Text(content),
        actions: <Widget>[
          TextButton(
            child: Text(textCancel),
            onPressed: () => Navigator.pop(context, false),
          ),
          TextButton(
            child: Text(textOK),
            onPressed: () => Navigator.pop(context, true),
          ),
        ],
      ),
      onWillPop: () async {
        Navigator.pop(context, false);
        return true;
      },
    ),
  );

  return isConfirm ?? false;
}
