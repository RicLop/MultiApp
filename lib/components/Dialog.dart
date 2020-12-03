import 'dart:async';

import 'package:flutter/material.dart';

Future<void> dialog(BuildContext context, String title, String message) {
  return showDialog<void>(
    context: context,
    barrierDismissible: false, // user must tap button!
    builder: (BuildContext context) {
      return AlertDialog(
        title: Text(title),
        content: SingleChildScrollView(
          child: Text(message),
        ),
      );
    },
  );
}
