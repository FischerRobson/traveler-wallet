import 'package:flutter/material.dart';
import 'package:flutter_example/screens/home.dart';
import 'package:flutter_example/screens/new_operation.dart';
import 'package:flutter_example/screens/operations_view.dart';
import 'package:flutter_example/screens/prices.dart';
import 'bloc/manage_bloc.dart';
import 'bloc/monitor_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {

    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => ManageBloc()),
        BlocProvider(create: (_) => MonitorBloc()),
      ],
      child: Builder(
        builder: (context) => Scaffold(
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
          body: TabBarView(
              children: [
                const HomeScreen(),
                OperationsView(),
                const PricesScreen(),
              ]),
          floatingActionButton: FloatingActionButton(
            onPressed: () {
              showModalBottomSheet(
                  context: context,
                  builder: (modalContext) => BlocProvider.value(
                    value: BlocProvider.of<ManageBloc>(context),
                    child: NewOperation(),
                  ));
            },
            hoverColor: Colors.white,
            backgroundColor: Colors.white10,
            child: const Icon(Icons.add, color: Colors.lightBlue,),
          ),
        ),
      ));
  }
}
