import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:charts_flutter/flutter.dart' as charts;
import 'package:flutter_example/components/operation_series.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  @override
  Widget build(BuildContext context) {

    final List<OperationSeries> data = [
      OperationSeries("conta de luz", 150, false),
      OperationSeries("salario", 4550, true),
      OperationSeries("conta de agua", 120, false),
      OperationSeries("hora extra", 600, true),
    ];

    List<charts.Series<OperationSeries, String>> series = [
      charts.Series(
          id: "operations",
          data: data,
          domainFn: (OperationSeries series, _) => series.name,
          measureFn: (OperationSeries series, _) => series.valor,
          colorFn: (OperationSeries series, _) => series.barColor
      )
    ];

    return Container(
      padding: const EdgeInsets.all(40),
      child: Expanded(
        child: charts.BarChart(series, animate: true, domainAxis: const charts.OrdinalAxisSpec(
          renderSpec: charts.SmallTickRendererSpec(
            labelStyle: charts.TextStyleSpec(
                fontSize: 10, // size in Pts.
                color: charts.MaterialPalette.white
            ),
          )
        ),),
      ),
    );
  }
}
