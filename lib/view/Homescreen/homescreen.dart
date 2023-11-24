import 'package:exmcode/view/data/database.dart';
import 'package:exmcode/view/utils/Todo/Alertdialog/alertbox.dart';
import 'package:exmcode/view/utils/Todo/todolist.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  final _mybox = Hive.box("mybox");
  final _controller = TextEditingController();
  Tododatabase db = Tododatabase();

  @override
  void initState() {
    if (_mybox.get("TODOLIST") == null) {
      db.createInitialdata();
    } else {
      db.loaddata();
    }
    super.initState();
  }

  void ChekedBoxchange(bool? value, int index) {
    setState(() {
      db.Todolist[index][1] = !db.Todolist[index][1];
    });
    db.update();
  }

  void Savenewtask() {
    setState(() {
      db.Todolist.add(
        [_controller.text, false],
      );
      _controller.clear();
    });
    Navigator.of(context).pop();
    db.update();
  }

  void createnewtask() {
    showDialog(
      context: context,
      builder: (context) {
        return Dialogbox(
          controller: _controller,
          onsave: Savenewtask,
          oncancel: () => Navigator.of(context).pop(),
        );
      },
    );
  }

  void deletetask(int index) {
    setState(() {
      db.Todolist.removeAt(index);
    });
    db.update();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: createnewtask,
        child: Icon(Icons.add),
      ),
      backgroundColor: Colors.amberAccent,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.amber,
        title: Text(
          "Note",
          style: TextStyle(fontSize: 25),
        ),
        centerTitle: true,
      ),
      body: ListView.builder(
        itemBuilder: (context, index) {
          return Todotitle(
            taskname: db.Todolist[index][0],
            taskcomplete: db.Todolist[index][1],
            onChanged: (value) => ChekedBoxchange(value, index),
            deletefunction: (context) => deletetask(index),
          );
        },
        itemCount: db.Todolist.length,
      ),
    );
  }
}
