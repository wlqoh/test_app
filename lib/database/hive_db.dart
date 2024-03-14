import 'package:hive_flutter/hive_flutter.dart';
class ToDoDatabase{
  List tiles = [];
  final _myBox = Hive.box('MyBox');

  List loadData() {
    if(_myBox.get("TODOLIST") == null) {
      return [];
    }
    else {
      tiles = _myBox.get('TODOLIST');
      return tiles;
    }
  }

  void updateDatabase() {
    _myBox.put('TODOLIST', tiles);
  }
}
