import 'dart:convert';

import 'package:multi/components/Button.dart';
import 'package:multi/components/dialog.dart';
import 'package:multi/models/empresa.dart';
import 'package:multi/screens/homeScreen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:http/http.dart' as http;
import 'package:multi/components/textField.dart';
import 'package:multi/models/usuario.dart';

class LoginScreen extends StatefulWidget {
  static Usuario usuarioLogado = new Usuario();

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  var usuario = new Usuario();

  final _formKey = GlobalKey<FormState>();

  bool rememberMe = false;
  StatefulWidget screen = LoginScreen();

  emailChange(String value) {
    usuario.email = value;
  }

  senhaChange(String value) {
    usuario.senha = value;
  }

  Future pushToDashBoardScreen(Object obj) async {
    var loggedUser = await logar(obj);

    if (loggedUser != null) {
      return Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => HomeScreen()),
      );
    } else {
      dialog(context, "Atenção!",
          "Falha na autenticação. Informações de Usuario incorretas.");
    }
  }

  Future<Usuario> logar(Usuario usuario) async {
    http.Response response = await http.post(
      'http://mestre-mobile.herokuapp.com/v1/login',
      headers: {
        'Content-Type': 'application/json',
      },
      body: jsonEncode(<String, String>{
        'email': usuario.email,
        'senha': usuario.senha,
      }),
    );

    var json = jsonDecode(response.body);
    LoginScreen.usuarioLogado = Usuario.fromJson(json["usuario"]);

    for (var empresa in json["empresas"]) {
      LoginScreen.usuarioLogado.empresas.add(Empresa.fromJson(empresa));
    }

    return LoginScreen.usuarioLogado;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AnnotatedRegion<SystemUiOverlayStyle>(
        value: SystemUiOverlayStyle.light,
        child: GestureDetector(
          onTap: () => FocusScope.of(context).unfocus(),
          child: Stack(
            children: <Widget>[
              Container(
                height: double.infinity,
                width: double.infinity,
              ),
              Form(
                key: _formKey,
                child: SingleChildScrollView(
                  physics: AlwaysScrollableScrollPhysics(),
                  padding: EdgeInsets.symmetric(
                    horizontal: 40.0,
                    vertical: 120.0,
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      SizedBox(
                        height: 155.0,
                        child: Image.asset(
                          "lib/assets/logo_mestre.png",
                          fit: BoxFit.contain,
                        ),
                      ),
                      SizedBox(height: 40.0),
                      textField(
                          icon: Icon(Icons.email, color: Colors.black).icon,
                          hintText: "Email",
                          isRequired: true,
                          keyboardType: TextInputType.emailAddress,
                          autoFill: AutofillHints.email,
                          onChange: emailChange),
                      SizedBox(height: 20.0),
                      textField(
                          icon: Icon(Icons.lock, color: Colors.black).icon,
                          hintText: "Senha",
                          obscureText: true,
                          isRequired: true,
                          keyboardType: TextInputType.visiblePassword,
                          autoFill: AutofillHints.password,
                          onChange: senhaChange),
                      SizedBox(height: 40.0),
                      CustomButton(
                          label: "ENTRAR",
                          onPressed: pushToDashBoardScreen,
                          obj: usuario,
                          formKey: _formKey),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
