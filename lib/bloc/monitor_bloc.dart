import 'package:flutter_bloc/flutter_bloc.dart';

import '../model/operations.dart';
import '../provider/local_db.dart';

class MonitorBloc extends Bloc<MonitorEvent, MonitorState> {
  OperationsCollection operationsCollection = OperationsCollection();

  MonitorBloc() : super(MonitorState(operationsCollection: OperationsCollection())) {
    LocalDatabase.helper.stream.listen((event) {
      String noteId = event[0];

      if (event[1] == null) {
        operationsCollection.deleteOperationOfId(noteId);
      } else {
        operationsCollection.updateOperationOfId(noteId, event[1]);
      }
      add(UpdateList());
    });

    on<AskNewList>((event, emit) async {
      operationsCollection = await LocalDatabase.helper.getOperationList();
      emit(MonitorState(operationsCollection: operationsCollection));
    });

    on<UpdateList>((event, emit) {
      emit(MonitorState(operationsCollection: operationsCollection));
    });
    add(AskNewList());
  }
}

/*
Events
*/
abstract class MonitorEvent {}

class AskNewList extends MonitorEvent {}

class UpdateList extends MonitorEvent {}

/*
States
*/
class MonitorState {
  OperationsCollection operationsCollection;
  MonitorState({required this.operationsCollection});
}