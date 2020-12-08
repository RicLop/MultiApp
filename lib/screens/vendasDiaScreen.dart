import 'dart:convert';

import 'package:multi/components/ChartSeries.dart';
import 'package:multi/models/objeto.dart';
import 'package:flutter/material.dart';
import 'package:multi/components/NavDrawer.dart';
import 'package:charts_flutter/flutter.dart' as charts;
import '../components/NavDrawer.dart';

class VendasDiaScreen extends StatefulWidget {
  VendasDiaScreen({Key key}) : super(key: key);

  @override
  _VendasDiaScreenState createState() => _VendasDiaScreenState();
}

class _VendasDiaScreenState extends State<VendasDiaScreen> {
  List<charts.Series<Objeto, int>> _seriesLineData;

  @override
  void initState() {
    super.initState();
    _seriesLineData = List<charts.Series<Objeto, int>>();
    _generateData();
  }

  _generateData() {
    var lineObjetodata = [
      new Objeto("1", 45, Color.fromRGBO(7, 77, 102, 1)),
      new Objeto("2", 50, Color.fromRGBO(7, 77, 102, 1)),
      new Objeto("3", 55, Color.fromRGBO(7, 77, 102, 1)),
      new Objeto("4", 60, Color.fromRGBO(7, 77, 102, 1)),
      new Objeto("5", 65, Color.fromRGBO(7, 77, 102, 1)),
    ];

    _seriesLineData.add(
      charts.Series(
        colorFn: (__, _) => charts.ColorUtil.fromDartColor(Color(0xff990099)),
        id: 'Air Pollution',
        data: lineObjetodata,
        domainFn: (Objeto obj, _) => int.parse(obj.domain),
        measureFn: (Objeto obj, _) => obj.measure,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: <Widget>[
            Spacer(),
            Text(
              "Vendas por Dia",
            ),
            Spacer(),
            Spacer(),
          ],
        ),
      ),
      drawer: NavDrawer(),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(10, 100, 10, 200),
        child: charts.LineChart(_seriesLineData,
            defaultRenderer:
                new charts.LineRendererConfig(includeArea: true, stacked: true),
            behaviors: [
              new charts.ChartTitle('Dias',
                  behaviorPosition: charts.BehaviorPosition.bottom,
                  titleOutsideJustification:
                      charts.OutsideJustification.middleDrawArea),
              new charts.ChartTitle('Vendas',
                  behaviorPosition: charts.BehaviorPosition.start,
                  titleOutsideJustification:
                      charts.OutsideJustification.middleDrawArea)
            ]),
      ),
    );
  }
}
