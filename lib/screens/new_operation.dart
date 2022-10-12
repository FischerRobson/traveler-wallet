import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class NewOperation extends StatefulWidget {

  @override
  State<NewOperation> createState() => _NewOperationState();
}

class _NewOperationState extends State<NewOperation> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  bool _isEntry = false;

  void handleIsEntry(bool inValue) {
    setState(() {
      _isEntry = inValue;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      child: Form(
        key: _formKey,
        child: Column(
          children: [
            TextFormField(
              keyboardType: const TextInputType.numberWithOptions(
                  decimal: true),
              validator: (String? inValue) {
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
                  if (inValue.length < 3) {
                    return "Addiction uma descrição mais detalhada!";
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
      ),
    );
  }
}