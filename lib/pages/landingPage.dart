import 'package:assignment7todo/data/database_data.dart';
import 'package:assignment7todo/themes/app_palettes.dart';
import 'package:assignment7todo/util/dialog_box.dart';
import 'package:assignment7todo/util/todo_tile.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';

class LandingPage extends StatefulWidget {
  LandingPage({super.key});
  @override
  State<LandingPage> createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {
  final _myBox = Hive.box('myBox');
  ToDoDatabase db = ToDoDatabase();

  final _controller = TextEditingController();
  // List toDoList = [
  //   ['Make Flutter Apps', false],
  //   ['Make React Websites', true],
  // ];
  @override
  void initState(){
    super.initState();
    if(_myBox.get("TODOLIST") == null){
      db.createInitialData();
    }
    else{
      db.loadData();
    }
  }

  void saveNewTask(){
    setState(() {
      db.todos.add([_controller.text,false]);
    });
    Navigator.of(context).pop();
  }

  void createNewtask() {
    showDialog(
        context: context,
        builder: (context) {
          return DialogBox(
            controller: _controller,
            onSave: saveNewTask,
            onCancel: () => Navigator.of(context).pop(),
          );
        });
  }
  void deleteTask(int index){
    setState(() {
      db.todos.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("To Do.",
            style: TextStyle(color: AppPalettes.lightColor, fontSize: 34)),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: createNewtask,
        child: Icon(Icons.add),
      ),
      body: Column(
        children: [
          const SizedBox(height: 20),
          Expanded(
            child: ListView.builder(
              itemCount: db.todos.length,
              itemBuilder: (context, index) {
                return TodoTile(
                  onChanged: (value) => checkBoxChange(value, index),
                  taskCompleted: db.todos[index][1],
                  taskName: db.todos[index][0],
                  onDelete: (context) => deleteTask(index),
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  void checkBoxChange(bool? value, int index) {
    setState(() {
      db.todos[index][1] = !db.todos[index][1];
    });
  }
}
