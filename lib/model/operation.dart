import 'package:intl/intl.dart';

class Operation {
  String _description = "";
  bool _isEntry = true;
  String _date = "";
  int _amount = 0;

  String get description => _description;
  bool get isEntry => _isEntry;
  String get date => _date;
  int get amount => _amount;

  set description(String description) {
    if(description.isNotEmpty) {
      _description = description;
    }
  }

  set date(String date) {
    if(date.isNotEmpty) {
      _date = date;
    }
  }

  set amount(int amount) {
    _amount = amount;
  }

  set isEntry(bool isEntry) {
    _isEntry = isEntry;
  }

  var now = DateTime.now();
  var formatter = DateFormat('dd/MM/yyyy');

  Operation() {
    _amount = 0;
    _description = "";
    _isEntry = false;
    _date = formatter.format(now);
  }

  Operation.withData({amount = 0, description = "", isEntry = false, date = ""}) {
    _amount = amount;
    _description = description;
    _isEntry = isEntry;
    _date = date;
  }

  Operation.fromMap(map) {
    print(map);
    _amount = map["amount"];
    _description = map["description"];
    _isEntry = map["isEntry"] == 1;
    _date = map["date"];
  }

  toMap() {
    var map = <String, dynamic>{};
    map["amount"] = _amount;
    map["description"] = _description;
    map["isEntry"] = _isEntry ? 1 : 0;
    map["date"] = _date;
    print(map);
    return map;
  }

}