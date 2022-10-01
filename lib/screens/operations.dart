import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_example/components/operation_container.dart';

class OperationsScreen extends StatefulWidget {
  const OperationsScreen({super.key});

  @override
  State<OperationsScreen> createState() => _OperationsScreenState();
}

class _OperationsScreenState extends State<OperationsScreen> {

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(8),
      children: const <Widget>[
        OperationContainer(amount: 50.0, description: "Conta de Agua", isEntry: false, date: "04/10/22"),
        OperationContainer(amount: 40.0, description: "Freela", isEntry: true, date: "14/10/22"),
        OperationContainer(amount: 85.0, description: "Conta de Luz", isEntry: false, date: "13/10/22"),
        OperationContainer(amount: 59.6, description: "Viagem", isEntry: true, date: "24/10/22"),
        OperationContainer(amount: 14.0, description: "Conta de Agua", isEntry: false, date: "24/10/22"),
        OperationContainer(amount: 450.0, description: "Conta de Agua", isEntry: false, date: "14/10/22"),
        OperationContainer(amount: 8000.0, description: "Pagamento", isEntry: true, date: "08/10/22"),
        OperationContainer(amount: 124.0, description: "Conta de Agua", isEntry: false, date: "08/10/22"),
        OperationContainer(amount: 1122.0, description: "Conta de Agua", isEntry: false, date: "09/10/22"),
        OperationContainer(amount: 900.0, description: "Conta de Agua", isEntry: true, date: "04/10/22"),
        OperationContainer(amount: 5.0, description: "Conta de Agua", isEntry: true, date: "04/10/22"),
        OperationContainer(amount: 5.0, description: "Conta de Agua", isEntry: false, date: "04/10/22"),
      ],
    );
  }
}