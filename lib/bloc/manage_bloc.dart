import 'package:flutter_bloc/flutter_bloc.dart';
import '../provider/local_db.dart';
import '../model/operation.dart';

class ManageBloc extends Bloc<ManageEvent, ManageState> {
  ManageBloc(): super(InsertState()) {
    on<UpdateRequest>((event, emit) {
      emit(UpdateState(operationId: event.operationId, previousOperation: event.previousOperation));
    });

    on<UpdateCancel>((event, emit) {
      emit(InsertState());
    });

    on<SubmitEvent>((event, emit) {
      if (state is InsertState) {
        LocalDatabase.helper.insertOperation(event.operation);
      }
    });
    on<DeleteEvent>((event, emit) {
    });
  }

}

// Events

abstract class ManageEvent {}

class SubmitEvent extends ManageEvent {
  Operation operation;
  SubmitEvent({required this.operation});
}

class DeleteEvent extends ManageEvent {
  String operationId;
  DeleteEvent({required this.operationId});
}

class UpdateRequest extends ManageEvent {
  String operationId;
  Operation previousOperation;
  UpdateRequest({required this.operationId, required this.previousOperation});
}

class UpdateCancel extends ManageEvent {}

// States

abstract class ManageState {}

class InsertState extends ManageState {}

class UpdateState extends ManageState {
  String operationId;
  Operation previousOperation;
  UpdateState({required this.operationId, required this.previousOperation});
}