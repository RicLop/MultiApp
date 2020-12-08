library config.globals;

import 'package:flutter/material.dart';
import 'package:multi/screens/homeScreen.dart';
import 'package:multi/components/Styles.dart';

void main() => runApp(MyApp());

SystemColors currentSystem = SystemColors();

class MyApp extends StatefulWidget {
  MyApp({Key key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    super.initState();
    currentSystem.addListener(() {
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'multi',
      debugShowCheckedModeBanner: false,
      theme: currentSystem.light(),
      darkTheme: currentSystem.dark(),
      themeMode: currentSystem.currentTheme(),
      home: HomeScreen(
        currentSystem: currentSystem,
      ),
    );
  }
}
