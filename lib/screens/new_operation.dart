import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_example/model/operation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../bloc/manage_bloc.dart';

class NewOperation extends StatelessWidget {

  final GlobalKey<FormState> _formKey = GlobalKey();
  final Operation operation = Operation();

  bool _isEntry = false;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ManageBloc, ManageState>(builder: (context, state) {
      Operation operation;
      if (state is UpdateState) {
        operation = state.previousOperation;
      } else {
        operation = Operation();
      }
      return Form(
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
                 // handleIsEntry(inValue);
                }),
                const Text("Saída"),
              ]),
              ElevatedButton(onPressed: () {
                if (_formKey.currentState!.validate()) {
                  _formKey.currentState!.save();
                  BlocProvider.of<ManageBloc>(context).add(SubmitEvent(operation: operation));

                  _formKey.currentState!.reset();
                }
              }, child: const Text("Salvar"))
            ],
          ));
    });
  }
}