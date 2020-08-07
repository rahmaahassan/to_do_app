import 'package:flutter/material.dart';

class Home extends StatelessWidget {
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
      body: Padding (
        padding: EdgeInsets.only(
          bottom: 30,
          left: 10,
          top: 20,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Container(
              padding: EdgeInsets.all(10),
              child: Icon(Icons.event_note, color: Theme.of(context).primaryColor,),
              decoration: BoxDecoration(
                color: Colors.white,
                shape: BoxShape.circle,
              ),
            ),
            Text('All', style: Theme.of(context).textTheme.headline2,),
            Text('24 task', style: Theme.of(context).textTheme.headline3,)
          ],
        ),),
    );
  }
}