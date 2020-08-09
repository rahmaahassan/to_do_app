import 'package:flutter/material.dart';
import 'package:todoapp/screens/add_note.dart';
import 'package:todoapp/widgets/todo_item.dart';

import '../models/task.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
   List<Task> _todoList;

  @override
  void initState() {
    _todoList = [
      Task(
        title: 'Meeting',
        date: DateTime.now(),
      ),
      Task(
        title: 'To Do List',
        date: DateTime.now(),
      )
    ];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.white,),
          onPressed: null,
        ),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.more_vert, color: Colors.white,),
            onPressed: null,
          ),
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Padding (
            padding: EdgeInsets.only(
              bottom: 30,
              left: 20,
              top: 10,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Container(
                  padding: const EdgeInsets.all(10),
                  child: Icon(Icons.event_note, color: Theme.of(context).primaryColor,),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    shape: BoxShape.circle,
                  ),
                ),
                SizedBox(height: 10,),
                Text('All', style: Theme.of(context).textTheme.headline1,),
                Text('24 task', style: Theme.of(context).textTheme.headline3,),
              ],
            ),),
          Expanded(
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
                itemCount: _todoList.length,
                itemBuilder: (context, index) {
                  return TodoItem(
                  task: _todoList[index],
                  index: index,
                  onChecked: _onChecked,
                ); }
              ),
            ),
          )
        ],
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Theme.of(context).primaryColor,
        onPressed: () => _addNote(),
        child: Icon(Icons.add, color: Colors.white),
      ),
    );
  }
  _onChecked(int i) {
    setState(() {
      _todoList[i].status =! _todoList[i].status;
    });
  }

  _addNote() async{
    Task _task = await Navigator.push(context, MaterialPageRoute(
      builder: (context) => AddNote(),
      fullscreenDialog: true,
    ));
    if(_task == null)
      return;
    setState(() {
      _todoList.add(_task);
    });
  }
}