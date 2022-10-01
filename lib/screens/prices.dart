import 'package:flutter/cupertino.dart';

class PricesScreen extends StatefulWidget {
  const PricesScreen({super.key});

  @override
  State<PricesScreen> createState() => _PricesScreenState();
}

class _PricesScreenState extends State<PricesScreen> {

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          Text("Prices"),
        ],
      ),
    );
  }
}