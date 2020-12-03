import 'package:flutter/material.dart';
import 'Styles.dart';

Widget checkbox({bool valor}) {
  return Container(
    height: 20.0,
    child: Row(
      children: <Widget>[
        Theme(
          data: ThemeData(unselectedWidgetColor: Colors.white),
          child: Checkbox(
            value: valor,
            checkColor: Colors.green,
            activeColor: Colors.white,
            onChanged: (value) {
              valor = value;
            },
          ),
        ),
        Text(
          'Lembrar de mim',
          style: labelStyle,
        ),
      ],
    ),
  );
}
