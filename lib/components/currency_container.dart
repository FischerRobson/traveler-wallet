import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CurrencyContainer extends StatelessWidget {
  final String name;
  final String symbol;
  final double value;
  final double increase;

  const CurrencyContainer({
    super.key,
    required this.name,
    required this.symbol,
    required this.value,
    required this.increase,
  });



  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(4),
      height: 70,
      margin: const EdgeInsets.only(bottom: 12),
      color: Colors.green[700],
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(symbol, style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24)),
              Text("RS $value", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24))
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(name),
              Row(
                children: [
                  Icon(Icons.arrow_upward),
                  Text("$increase", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14)),
                ],
              )
            ],
          )
        ],
      )
    );
  }
}