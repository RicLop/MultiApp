import 'package:multi/models/objeto.dart';
import 'package:charts_flutter/flutter.dart' as charts;

charts.Series<Objeto, String> newChartSerie(List data) {
  return charts.Series(
      domainFn: (dynamic obj, _) => obj.domain,
      measureFn: (dynamic obj, _) => obj.measure,
      colorFn: (dynamic obj, _) => charts.ColorUtil.fromDartColor(obj.color),
      id: 'Id',
      data: data);
  //labelAccessorFn: (dynamic row, _) => '${row.domai}');
}

charts.Series<Objeto, int> newLineChartSerie(List data) {
  return charts.Series(
      domainFn: (dynamic obj, _) => obj.domain,
      measureFn: (dynamic obj, _) => obj.measure,
      colorFn: (dynamic obj, _) => charts.ColorUtil.fromDartColor(obj.color),
      id: 'Id',
      data: data);
  //labelAccessorFn: (dynamic row, _) => '${row.domai}');
}
