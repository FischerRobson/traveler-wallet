import './operation.dart';

class OperationsCollection {
  List<String> idList = [];
  List<Operation> operationsList = [];

  OperationsCollection() {
    idList = [];
    operationsList = [];
  }

  int length() {
    return idList.length;
  }

  Operation getOperationAtIndex(int index) {
    Operation operation = operationsList[index];
    return Operation.withData(
      amount: operation.amount,
      date: operation.date,
      description: operation.description,
      isEntry: operation.isEntry
    );
  }

  updateOrInsertOperationOfId(String id, Operation operation) {
    int index = getIndexOfId(id);
    if (index != -1) {
      operationsList[index] =
          Operation.withData(
              amount: operation.amount,
              date: operation.date,
              description: operation.description,
              isEntry: operation.isEntry
          );
    } else {
      idList.add(id);
      operationsList.add(
        Operation.withData(
            amount: operation.amount,
            date: operation.date,
            description: operation.description,
            isEntry: operation.isEntry),
        );
    }
  }

  updateOperationOfId(String id, Operation operation) {
    int index = getIndexOfId(id);
    if (index != -1) {
      operationsList[index] =
          Operation.withData(
              amount: operation.amount,
              date: operation.date,
              description: operation.description,
              isEntry: operation.isEntry);
    }
  }

  deleteOperationOfId(String id) {
    int index = getIndexOfId(id);
    if (index != -1) {
      operationsList.removeAt(index);
      idList.removeAt(index);
    }
  }

  String getIdAtIndex(int index) {
    return idList[index];
  }

  int getIndexOfId(String id) {
    for (int i = 0; i < idList.length; i++) {
      if (id == idList[i]) {
        return i;
      }
    }

    return -1;
  }

  insertOperationOfId(String id, Operation operation) {
    idList.add(id);
    operationsList.add(
        Operation.withData(
            amount: operation.amount,
            date: operation.date,
            description: operation.description,
            isEntry: operation.isEntry
        )
    );
  }
}