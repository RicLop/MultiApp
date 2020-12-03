import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../components/navDrawer.dart';

class PosicaoScreen extends StatefulWidget {
  PosicaoScreen({Key key}) : super(key: key);

  @override
  _PosicaoScreenState createState() => _PosicaoScreenState();
}

class _PosicaoScreenState extends State<PosicaoScreen> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          bottom: TabBar(
            indicatorColor: Color.fromRGBO(240, 133, 33, 1),
            tabs: [
              Tab(icon: Icon(Icons.account_balance)),
              Tab(icon: Icon(Icons.store_mall_directory)),
            ],
          ),
          centerTitle: true,
          title: Text('Posição Caixas e Bancos '),
        ),
        drawer: NavDrawer(),
        body: TabBarView(
          children: [
            Padding(
              padding: EdgeInsets.all(0),
              child: DataTable(
                columns: <DataColumn>[
                  DataColumn(
                    label: Text(
                      'Banco',
                      style:
                          TextStyle(fontSize: 16, fontStyle: FontStyle.italic),
                    ),
                  ),
                  DataColumn(
                    label: Text(
                      'Agência',
                      style:
                          TextStyle(fontSize: 16, fontStyle: FontStyle.italic),
                    ),
                  ),
                  DataColumn(
                    label: Text(
                      'Conta',
                      style:
                          TextStyle(fontSize: 16, fontStyle: FontStyle.italic),
                    ),
                  ),
                  DataColumn(
                    label: Text(
                      'Descrição',
                      style:
                          TextStyle(fontSize: 16, fontStyle: FontStyle.italic),
                    ),
                  ),
                  DataColumn(
                    label: Text(
                      'Valor',
                      style:
                          TextStyle(fontSize: 16, fontStyle: FontStyle.italic),
                    ),
                  ),
                ],
                rows: [
                  DataRow(
                    cells: [
                      DataCell(Text('Bbrasil')),
                      DataCell(Text('125')),
                      DataCell(Text('123.567')),
                      DataCell(Text('Matriz')),
                      DataCell(Text('R\$ 12.345,79'))
                    ],
                  ),
                  DataRow(
                    cells: [
                      DataCell(Text('Viacredi')),
                      DataCell(Text('345')),
                      DataCell(Text('567890')),
                      DataCell(Text('Filial')),
                      DataCell(Text('R\$ 4.567,90'))
                    ],
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.all(0),
              child: DataTable(
                columns: <DataColumn>[
                  DataColumn(
                    label: Text(
                      'Caixa',
                      style:
                          TextStyle(fontSize: 16, fontStyle: FontStyle.italic),
                    ),
                  ),
                  DataColumn(
                    label: Text(
                      'Valor',
                      style:
                          TextStyle(fontSize: 16, fontStyle: FontStyle.italic),
                    ),
                  ),
                ],
                rows: [
                  DataRow(
                    cells: [
                      DataCell(Text('Caixa 1')),
                      DataCell(Text('R\$ 2.345,00'))
                    ],
                  ),
                  DataRow(
                    cells: [
                      DataCell(Text('Caixa 2')),
                      DataCell(Text('R\$ 1.520,50'))
                    ],
                  ),
                  DataRow(
                    cells: [
                      DataCell(Text('Caixa Geral')),
                      DataCell(Text('R\$ 5.789,00'))
                    ],
                  ),
                  DataRow(
                    cells: [
                      DataCell(Container(
                        width: 210,
                        child: Text('Total'),
                      )),
                      DataCell(Container(child: Text('R\$ 9.654,50')))
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
