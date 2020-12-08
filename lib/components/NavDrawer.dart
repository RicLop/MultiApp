import 'package:multi/screens/homeScreen.dart';
import 'package:multi/screens/posicaoScreen.dart';
import 'package:multi/screens/vendasAnoScreen.dart';
import 'package:multi/screens/vendasDiaScreen.dart';
import 'package:flutter/material.dart';

import '../screens/dashBoardScreen.dart';
import '../screens/loginScreen.dart';

class NavDrawer extends StatefulWidget {
  NavDrawer({Key key}) : super(key: key);

  @override
  _NavDrawerState createState() => _NavDrawerState();
}

class _NavDrawerState extends State<NavDrawer> {
  List<DropdownMenuItem<String>> companies = [];
  var _value = '1';

  @override
  void initState() {
    super.initState();
    companies.add(DropdownMenuItem(
      value: '1',
      child: Text('Filial Blumenau'),
    ));
    companies.add(DropdownMenuItem(
      value: '2',
      child: Text('Filial Jaraguá'),
    ));
    companies.add(DropdownMenuItem(
      value: '3',
      child: Text('Filial Praia Brava'),
    ));
    companies.add(DropdownMenuItem(
      value: '4',
      child: Text('Matriz'),
    ));
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          DrawerHeader(
            child: SizedBox(
              height: 155.0,
              child: Image.asset(
                "lib/assets/logo_multi.png",
                fit: BoxFit.contain,
              ),
            ),
          ),
          ListTile(
            leading: Icon(
              Icons.message,
            ),
            title: DropdownButton(
                style: new TextStyle(
                  color: Colors.black,
                  fontSize: 18.0,
                ),
                value: _value,
                items: companies,
                underline: SizedBox(
                  height: 0,
                ),
                onChanged: (value) {
                  setState(() {
                    _value = value;
                  });
                }),
          ),
          ListTile(
            leading: Icon(
              Icons.home,
            ),
            title: Text('Home'),
            onTap: () => Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => HomeScreen()),
            ),
          ),
          ListTile(
            leading: Icon(
              Icons.dashboard,
            ),
            title: Text('Dashboard'),
            onTap: () => Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => DashBoardScreen()),
            ),
          ),
          ListTile(
            leading: Icon(
              Icons.account_box,
            ),
            title: Text('Posições'),
            onTap: () => Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => PosicaoScreen()),
            ),
          ),
          ListTile(
            leading: Icon(
              Icons.date_range,
            ),
            title: Text('Vendas por Ano'),
            onTap: () => Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => VendasAnoScreen()),
            ),
          ),
          ListTile(
            leading: Icon(
              Icons.date_range,
            ),
            title: Text('Vendas por Dia'),
            onTap: () => Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => VendasDiaScreen()),
            ),
          ),
          Container(
            color: Color.fromRGBO(255, 81, 72, 1),
            child: ListTile(
              leading: Icon(
                Icons.exit_to_app,
                color: Colors.white,
              ),
              title: Text(
                'Sair',
                style: TextStyle(color: Colors.white),
              ),
              onTap: () => Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => LoginScreen()),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
