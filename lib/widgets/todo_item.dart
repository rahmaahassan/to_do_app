import 'package:flutter/material.dart';
import 'package:todoapp/models/task.dart';
import 'package:intl/intl.dart';

class TodoItem extends StatelessWidget {
  Task task;
  int index;
  Function onChecked;

  TodoItem({
    this.task,
    this.index,
    this.onChecked,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(task.title, style: Theme.of(context).textTheme.headline2),
      subtitle: Text(DateFormat('MMM d hh:mm').format(task.date), style: Theme.of(context).textTheme.headline4),
      trailing: Checkbox(
        onChanged: (_) => onChecked(index),
        value: task.status,
        activeColor: Theme.of(context).primaryColor,
      ),
    );
 }
 }
