import 'package:Multi/components/ChartSeries.dart';
import 'package:Multi/models/objeto.dart';
import 'package:flutter/material.dart';
import 'package:Multi/components/NavDrawer.dart';
import 'package:charts_flutter/flutter.dart' as charts;
import '../components/NavDrawer.dart';

class VendasAnoScreen extends StatefulWidget {
  VendasAnoScreen({Key key}) : super(key: key);

  @override
  _VendasAnoScreenState createState() => _VendasAnoScreenState();
}

class _VendasAnoScreenState extends State<VendasAnoScreen> {
  List<charts.Series<Objeto, String>> _seriesData;

  @override
  void initState() {
    super.initState();
    _seriesData = List<charts.Series<Objeto, String>>();
    _generateData();
  }

  _generateData() {
    var data1 = [
      new Objeto('Blumenau', 100, Colors.amber), //2018
      new Objeto('Jaraguá', 80, Colors.red),
      new Objeto('Praia Brava', 90, Colors.blue),
    ];

    var data2 = [
      new Objeto('Blumenau', 120, Colors.amber), //2019
      new Objeto('Jaraguá', 90, Colors.red),
      new Objeto('Praia Brava', 130, Colors.blue),
    ];

    var data3 = [
      new Objeto('Blumenau', 110, Colors.amber), //2020
      new Objeto('Jaraguá', 75, Colors.red),
      new Objeto('Praia Brava', 150, Colors.blue),
    ];

    _seriesData.add(newChartSerie(data1));
    _seriesData.add(newChartSerie(data2));
    _seriesData.add(newChartSerie(data3));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: <Widget>[
            Spacer(),
            Text(
              "Vendas por Ano",
            ),
            Spacer(),
            Spacer(),
          ],
        ),
      ),
      drawer: NavDrawer(),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(10, 100, 10, 200),
        child: charts.BarChart(
          _seriesData,
          barGroupingType: charts.BarGroupingType.grouped,
          animationDuration: Duration(seconds: 2),
        ),
      ),
    );
  }
}
