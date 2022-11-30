import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class OperationContainer extends StatelessWidget {
  final int amount;
  final String description;
  final bool isEntry;
  final String date;

  const OperationContainer({
    super.key,
    required this.amount,
    required this.description,
    required this.isEntry,
    required this.date
  });

  @override
  Widget build(BuildContext context) {
    return  Container(
      padding: const EdgeInsets.all(4),
      height: 50,
      margin: const EdgeInsets.only(bottom: 8),
      color: (isEntry ? Colors.green[500] : Colors.red[300]),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(description),
              Text("RS $amount"),
            ],
          ),
          Row(
            children: [
              Text(date),
            ],
          ),
        ],
      ),
    );
  }
}