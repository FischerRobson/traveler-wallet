import 'package:charts_flutter/flutter.dart' as charts;
import 'package:flutter/material.dart';

class OperationSeries {
  final String name;
  final int valor;
  final bool isEntry;
  charts.Color barColor;

  OperationSeries(
     this.name,
     this.valor,
     this.isEntry,
  ): barColor = isEntry ? charts.ColorUtil.fromDartColor(Colors.green) : charts.ColorUtil.fromDartColor(Colors.red);


}