import 'package:hive/hive.dart';

class Tododatabase {
  List Todolist = [];
  final _mybox = Hive.box("mybox");

  void createInitialdata() {
    ["make a new note", false];
  }

  void loaddata() {
    Todolist = _mybox.get("TODOLIST");
  }

  void update() {
    _mybox.put("TODOLIST", Todolist);
  }
}
