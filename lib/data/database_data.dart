import 'package:hive_flutter/adapters.dart';

class ToDoDatabase {
  List todos = [];
  final _myBox = Hive.box('myBox');

  void createInitialData(){
    todos = [
      ["Make Flutter App",false],
      ["Make react App", true],
    ];
  }
  void loadData(){
    todos = _myBox.get("TODOLIST");
  }
  void updateDatabase(){
     _myBox.put("TODOLIST", todos);
  }
}