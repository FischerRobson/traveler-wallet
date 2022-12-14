import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_example/components/operation_container.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_example/model/operations.dart';
import '../bloc/monitor_bloc.dart';

class OperationsView extends StatelessWidget {
  OperationsView({Key? key}): super(key: key);

  @override
  Widget build(BuildContext context){
    return BlocBuilder<MonitorBloc, MonitorState>(
      builder: (context, state) => getOperationListView(state.operationsCollection),
    );
  }

  ListView getOperationListView(OperationsCollection operationsCollection){
    if(operationsCollection.length() > 0) {
      print(operationsCollection.getOperationAtIndex(0).amount);
      print(operationsCollection.getOperationAtIndex(0).description);
    }
    return ListView.builder(
      padding: const EdgeInsets.all(10),
      itemCount: operationsCollection.length(),
      itemBuilder: (context, position) => OperationContainer(
          amount: operationsCollection.getOperationAtIndex(position).amount,
          description: operationsCollection.getOperationAtIndex(position).description,
          isEntry: operationsCollection.getOperationAtIndex(position).isEntry,
          date: operationsCollection.getOperationAtIndex(position).date),
    );
  }
}