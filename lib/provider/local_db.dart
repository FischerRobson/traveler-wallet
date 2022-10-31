import 'dart:async';
import 'dart:io';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

import '../model/operation.dart';
import '../model/operations.dart';

class LocalDatabase {
  static LocalDatabase helper = LocalDatabase._createInstance();

  LocalDatabase._createInstance();

  static Database? _database;

  Future<Database> get database async {
    _database ??= await initializeDatabase();
    return _database!;
  }

  String operationTable = "operation_table";
  String colId = "id"; // Auto-numerar
  String colAmount = "amount";
  String colDescription = "description";
  String colIsEntry = "isEntry";
  String colDate = "date";

  _createDb(Database db, int newVersion) {
    db.execute("""
       CREATE TABLE $operationTable (
           $colId INTEGER PRIMARY KEY AUTOINCREMENT,
           $colAmount NUMERIC,
           $colDescription TEXT,
           $colDate TEXT,
           $colIsEntry boolean
          );
    """);
  }

  Future<Database> initializeDatabase() async {
    Directory directory = await getApplicationDocumentsDirectory();
    String path = "${directory.path}operations.db";
    return openDatabase(path, version: 1, onCreate: _createDb);
  }

  Future<int> insertOperation(Operation operation) async {
    Database? db = await database;
    int result = await db.insert(operationTable, operation.toMap());
    notify(result.toString(), operation);
    return result;
  }

  Future<OperationsColletion> getOperationList() async {
    Database db = await database;
    List<Map<String, Object?>> operationMapList =
    await db.rawQuery("SELECT * FROM $operationTable;");
    OperationsColletion operationsColletion = OperationsColletion();

    for (int i = 0; i < operationMapList.length; i++) {
      Operation operation = Operation.fromMap(operationMapList[i]);

      operationsColletion.insertOperationOfId(operationMapList[i][colId].toString(), operation);
    }
    return operationsColletion;
  }

  // Stream

  notify(String operationId, Operation? oepration) async {
    _controller?.sink.add([operationId, oepration]);
  }

  Stream get stream {
    _controller ??= StreamController.broadcast();
    return _controller!.stream;
  }

  dispose() {
    if (_controller != null) {
      if (!_controller!.hasListener) {
        _controller!.close();
        _controller = null;
      }
    }
  }

  static StreamController? _controller;
}