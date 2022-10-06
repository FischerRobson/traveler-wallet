import 'package:flutter/cupertino.dart';
import 'package:flutter_example/components/currency_container.dart';

class PricesScreen extends StatefulWidget {
  const PricesScreen({super.key});

  @override
  State<PricesScreen> createState() => _PricesScreenState();
}

class _PricesScreenState extends State<PricesScreen> {

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(8),
      children: const [
        CurrencyContainer(name: "Dolar", symbol: "\$", value: 5.67, increase: 11.0),
        CurrencyContainer(name: "Euro", symbol: "E\$", value: 5.39, increase: 7.4)
      ],
    );
  }
}