import 'package:flutter/material.dart';

import 'screens/loginScreen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Multi',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          brightness: Brightness.light,
          primaryColor: Color.fromRGBO(7, 77, 102, 1),
          accentColor: Color.fromRGBO(7, 77, 102, 1),
          buttonColor: Color.fromRGBO(240, 133, 33, 1),
          inputDecorationTheme: InputDecorationTheme(
            focusColor: Colors.black,
            labelStyle: TextStyle(
              color: Colors.black54,
            ),
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(
                color: Colors.black,
              ),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(
                color: Colors.black,
                width: 2.0,
              ),
            ),
          )),
      home: LoginScreen(),
    );
  }
}
