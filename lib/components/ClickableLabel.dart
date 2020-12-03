import 'package:flutter/material.dart';

Widget clickableLabel({
  BuildContext context,
  String label,
  String labelBold,
  Function onTap,
}) {
  return GestureDetector(
    onTap: () => onTap(),
    child: RichText(
      text: TextSpan(
        children: [
          TextSpan(
            text: label,
            style: TextStyle(
              color: Colors.white,
              fontSize: 18.0,
              fontWeight: FontWeight.w400,
            ),
          ),
          TextSpan(
            text: " " + labelBold,
            style: TextStyle(
              color: Colors.white,
              fontSize: 18.0,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    ),
  );
}
