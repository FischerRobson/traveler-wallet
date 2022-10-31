import './operation.dart';

class OperationsColletion {
  List<String> idList = [];
  List<Operation> operarationsList = [];

  OperationsColletion() {
    idList = [];
    operarationsList = [];
  }

  int length() {
    return idList.length;
  }

  Operation getOperationAtIndex(int index) {
    Operation operation = operarationsList[index];
    return Operation.withData(
      amount: operation.amount,
      date: operation.date,
      description: operation.description,
      isEntry: operation.isEntry
    );
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
    operarationsList.add(
        Operation.withData(
            amount: operation.amount,
            date: operation.date,
            description: operation.description,
            isEntry: operation.isEntry
        )
    );
  }
}