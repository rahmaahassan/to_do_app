/*import 'package:flutter/material.dart';
import 'package:todoapp/models/task.dart';
import 'package:todoapp/providers/tasks.dart';
import 'package:todoapp/widgets/todo_item.dart';
import 'package:provider/provider.dart';

class NotesList extends StatefulWidget {
  @override
  _NotesListState createState() => _NotesListState();
}

class _NotesListState extends State<NotesList> {

  @override
  Widget build(BuildContext context) {
    final tasksData = Provider.of<Tasks>(context);
    final tasks = tasksData.items;
    return Expanded(
      child: Container(
        padding: const EdgeInsets.only(
          left: 20,
          top: 20,
          bottom: 20,
        ),
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(30),
              topRight: Radius.circular(30),
            )
        ),
        child: ListView.builder(
            itemCount: tasks.length,
            itemBuilder: (ctx, i) {
              return TodoItem(
                task: tasks[i],
                index: i,
                onChecked: _onChecked,
              ); }
        ),
      ),
    );
  }

  _onChecked(int i) {
    setState(() {
      tasks[i].status =! tasks[i].status;
    });
  }
}*/
