import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:todoapp/models/task.dart';

class AddNote extends StatefulWidget {
  @override
  _AddNoteState createState() => _AddNoteState();
}

class _AddNoteState extends State<AddNote> {
  DateTime _taskDate = DateTime.now();
  Task _newTask;
  TextEditingController _controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        elevation: 0,
        title: Text('New Task', style: TextStyle(color: Colors.black),),
        centerTitle: true,
        backgroundColor: Colors.transparent,
        iconTheme: IconThemeData(color: Colors.black),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.close, color: Colors.black,),
            onPressed: () => Navigator.pop(context, null),
          )
        ],
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Column(
            children: <Widget>[
              TextField(
                controller: _controller,
                decoration: InputDecoration(
                  hintText: 'what are you palnning?',
                ),
              ),
              FlatButton(
                onPressed: _pickDate,
                child: Row(
                  children: <Widget>[
                    Icon(Icons.notifications_none, color: Theme.of(context).primaryColor,),
                    SizedBox(width: 5,),
                    Text(DateFormat('MMM d hh:mm',).format(_taskDate), style: Theme.of(context).textTheme.headline4,),

                  ],
                ),
              ),
            ],
          ),
          MaterialButton(
            onPressed: (){
              if(_controller.text.isNotEmpty){
                _newTask = Task(
                  title: _controller.text,
                  date: _taskDate,
                );
                Navigator.pop(context, _newTask);
              }
            },
            minWidth: double.infinity,
            height: 50,
            color: Theme.of(context).primaryColor,
            child: Text('Create', style: TextStyle(color: Colors.white, fontSize: 16),),
          )
        ],
      ),
    );
  }
  _pickDate() async{
    DateTime dateTime = await showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime.now(),
        lastDate: DateTime(DateTime.now().year + 5),
    );
    if(dateTime == null)
      return;
    TimeOfDay time = await showTimePicker(
        context: context,
        initialTime: TimeOfDay.now(),
    );

    setState(() {
      _taskDate = DateTime(
        dateTime.year,
        dateTime.month,
        dateTime.day,
        time == null? _taskDate.hour:time.hour,
        time == null? _taskDate.minute:time.minute,
      );
    });
  }
}
