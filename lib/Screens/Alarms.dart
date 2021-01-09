import 'package:flutter/material.dart';
import 'package:Puzzle_Alarm/Screens/AddAlarms.dart';
import 'package:Puzzle_Alarm/HomePage.dart';

class AlarmPage extends StatefulWidget {
  @override
  _AlarmPageState createState() => _AlarmPageState();
}

class _AlarmPageState extends State<AlarmPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
        title: Text(
          "PuzzleAlarm: Alarms",
          style: TextStyle(color: Color(0xFF2D2F41)),
        ),
        backgroundColor: Colors.white70,
        leading: IconButton(
            icon: Icon(
              Icons.arrow_back,
              color: Color(0xFF2D2F41),
            ),
            onPressed: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (context) => HomePage(),
                ),
              );
            }),
      ),
      backgroundColor: Color(0xFF2D2F41),
      body: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Column(
              children: <Widget>[
                IconButton(
                  icon: Icon(
                    Icons.alarm_add,
                    color: Colors.white,
                  ),
                  onPressed: () {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) => AddAlarm(),
                      ),
                    );
                  },
                )
              ]
            )
          ]
        )
      )
    );
  }
}