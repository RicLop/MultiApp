import 'package:flutter/material.dart';

final hintTextStyle = TextStyle(
  fontFamily: 'OpenSans',
);

final labelStyle = TextStyle(
  fontWeight: FontWeight.bold,
  fontFamily: 'OpenSans',
);

final boxDecorationStyle = BoxDecoration(
  borderRadius: BorderRadius.circular(10.0),
  boxShadow: [
    BoxShadow(
      blurRadius: 6.0,
      offset: Offset(0, 2),
    ),
  ],
);

class SystemColors with ChangeNotifier {
  bool _isDark = true;

  Color textColor1 = Color(0xFF000000);
  Color textColor2 = Color(0xFFFFFFFF);

  Color backgroundColor1 = Color(0xFFFFFFFF);
  Color backgroundColor2 = Color(0xFF191919);

  Color saudeColor1 = Color(0xFF5BD44D);
  Color roupaColor1 = Color(0xFFDDDB47);
  Color comidaColor1 = Color(0xFFFD2121);
  Color petColor1 = Color(0xFF2268FD);

  Color saudeColor2 = Color(0xFF93F088);
  Color roupaColor2 = Color(0xFFECEB7E);
  Color comidaColor2 = Color(0xFFF1687B);
  Color petColor2 = Color(0xFF9467E9);

  Color saudeColor() {
    return _isDark ? this.saudeColor2 : this.saudeColor1;
  }

  Color roupaColor() {
    return _isDark ? this.roupaColor2 : this.roupaColor1;
  }

  Color comidaColor() {
    return _isDark ? this.comidaColor2 : this.comidaColor1;
  }

  Color petColor() {
    return _isDark ? this.petColor2 : this.petColor1;
  }

  ThemeMode currentTheme() {
    return _isDark ? ThemeMode.dark : ThemeMode.light;
  }

  void switchTheme() {
    _isDark = !_isDark;
    notifyListeners();
  }

  ThemeData light() {
    return ThemeData(
      brightness: Brightness.light,
      accentColor: this.backgroundColor2,
      appBarTheme: AppBarTheme(
          iconTheme: IconThemeData(color: this.backgroundColor2),
          color: this.backgroundColor1),
      scaffoldBackgroundColor: this.backgroundColor1,
      textTheme: TextTheme(
          bodyText1: TextStyle(color: this.textColor1),
          bodyText2: TextStyle(color: this.textColor1)),
    );
  }

  ThemeData dark() {
    return ThemeData(
      brightness: Brightness.dark,
      accentColor: this.backgroundColor2,
      appBarTheme: AppBarTheme(
          iconTheme: IconThemeData(color: this.backgroundColor1),
          color: this.backgroundColor2),
      scaffoldBackgroundColor: this.backgroundColor2,
      textTheme: TextTheme(
          bodyText1: TextStyle(color: this.textColor2),
          bodyText2: TextStyle(color: this.textColor2)),
    );
  }
}
