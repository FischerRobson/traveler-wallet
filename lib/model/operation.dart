import 'package:intl/intl.dart';

class Operation {
  late String _description;
  late bool _isEntry;
  late String _date;
  late double _amount;

  String get description => _description;
  bool get isEntry => _isEntry;
  String get date => _date;
  double get amount => _amount;

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

  set amount(double amount) {
    _amount = amount;
  }

  set isEntry(bool isEntry) {
    _isEntry = isEntry;
  }

  var now = DateTime.now();
  var formatter = new DateFormat('yyyy-MM-dd');

  Operation() {
    _amount = 0.0;
    _description = "";
    _isEntry = false;
    _date = formatter.format(now);
  }

  Operation.withData({amount = 0.0, description = "", isEntry = false, date = ""}) {
    _amount = _amount;
    _description = description;
    _isEntry = isEntry;
    _date = date;
  }

  Operation.fromMap(map) {
    _amount = map["amount"];
    _description = map["description"];
    _isEntry = map["isEntry"];
    _date = map["date"];
  }

  toMap() {
    var map = <String, dynamic>{};
    map["amount"] = _amount;
    map["description"] = _description;
    map["isEntry"] = _isEntry;
    map["date"] = _date;
    return map;
  }
  
  
}