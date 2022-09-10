import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
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
  int _counter = 0;

  bool _isEntry = false;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  void handleIsEntry(bool inValue) {
    setState(() {
      _isEntry = inValue;
    });
  }

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
      body: Center(
        child:  Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                keyboardType: const TextInputType.numberWithOptions(decimal: true),
                validator: (String? inValue ) {
                  if (inValue != null) {
                    if (double.parse(inValue) <= 0.0) {
                      return "Valor inválido!";
                    }
                  }
                  return null;
                },
                decoration: const InputDecoration(
                  hintText: "00.0",
                  labelText: "Valor da Operação",
                ),
              ),
              TextFormField(
                keyboardType: TextInputType.multiline,
                validator: (String? inValue) {
                  if (inValue != null) {
                    if(inValue.length < 3) {
                      return "Adicione uma descrição mais detalhada!";
                    }
                  }
                  return null;
                },
                decoration: const InputDecoration(
                  hintText: "Conta de luz",
                  labelText: "Descrição",
                ),
              ),
              Row(children: [
                const Text("Entrada"),
                Switch(value: _isEntry, onChanged: (bool inValue) {
                  handleIsEntry(inValue);
                }),
                const Text("Saída"),
              ]),
              ElevatedButton(onPressed: () {
                if (_formKey.currentState!.validate()) {
                  _formKey.currentState!.save();
                }
              }, child: const Text("Salvar"))
            ],
          ),
        )
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}
