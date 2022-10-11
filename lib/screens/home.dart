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
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  bool _isEntry = false;

  void handleIsEntry(bool inValue) {
    setState(() {
      _isEntry = inValue;
    });
  }

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
      // child: Form(
      //   key: _formKey,
      //   child: Column(
      //     children: [
      //       TextFormField(
      //         keyboardType: const TextInputType.numberWithOptions(
      //             decimal: true),
      //         validator: (String? inValue) {
      //           if (inValue != null) {
      //             if (double.parse(inValue) <= 0.0) {
      //               return "Valor inválido!";
      //             }
      //           }
      //           return null;
      //         },
      //         decoration: const InputDecoration(
      //           hintText: "00.0",
      //           labelText: "Valor da Operação",
      //         ),
      //       ),
      //       TextFormField(
      //         keyboardType: TextInputType.multiline,
      //         validator: (String? inValue) {
      //           if (inValue != null) {
      //             if (inValue.length < 3) {
      //               return "Adicione uma descrição mais detalhada!";
      //             }
      //           }
      //           return null;
      //         },
      //         decoration: const InputDecoration(
      //           hintText: "Conta de luz",
      //           labelText: "Descrição",
      //         ),
      //       ),
      //       Row(children: [
      //         const Text("Entrada"),
      //         Switch(value: _isEntry, onChanged: (bool inValue) {
      //           handleIsEntry(inValue);
      //         }),
      //         const Text("Saída"),
      //       ]),
      //       ElevatedButton(onPressed: () {
      //         if (_formKey.currentState!.validate()) {
      //           _formKey.currentState!.save();
      //         }
      //       }, child: const Text("Salvar"))
      //     ],
      //   ),
      // ),
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
