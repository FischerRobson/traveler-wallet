import 'package:flutter/material.dart';
import 'package:flutter_example/screens/home.dart';
import 'package:flutter_example/screens/operations.dart';
import 'package:flutter_example/screens/prices.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData.dark(),
      home: const DefaultTabController(
        length: 3,
        child:  MyHomePage(title: "Traveler Wallet"),
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Row(children: [
          const Icon(Icons.wallet),
          Text(widget.title),
        ]),
        bottom: const TabBar(tabs: [
          Tab(icon: Icon(Icons.home)),
          Tab(icon: Icon(Icons.compare_arrows)),
          Tab(icon: Icon(Icons.monetization_on))
        ]),
      ),
      body: const TabBarView(children: [
        HomeScreen(),
        OperationsScreen(),
        PricesScreen(),
      ]),
      floatingActionButton: FloatingActionButton(
        onPressed: () {  },
        hoverColor: Colors.white,
        backgroundColor: Colors.white10,
        child: const Icon(Icons.add, color: Colors.lightBlue,),
      ),
    );
  }
}
