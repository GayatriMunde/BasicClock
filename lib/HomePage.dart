import 'package:Puzzle_Alarm/Screens/ClockPage.dart';
import 'package:Puzzle_Alarm/Screens/Timer.dart';
import 'package:Puzzle_Alarm/Screens/stopwatch.dart';
import 'package:Puzzle_Alarm/classes/dependencies.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  final Dependencies dependencies;
  HomePage({Key key, this.dependencies}) : super(key: key);
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF2D2F41),
      body: Row(
        children: <Widget>[
          Expanded(
            child: Container(
              alignment: Alignment.center,
              color: Color(0xFF2D2F41),
              child: ClockPage(),
            ),
          ),
          VerticalDivider(
            color: Colors.white,
            width: 1,
          ),
          Column(
            children: <Widget>[
              SizedBox(
                height: 250,
              ),
              Row(
                children: [
                  FlatButton(
                      onPressed: () {},
                      child: Column(
                        children: <Widget>[
                          Icon(
                            Icons.alarm_sharp,
                            color: Colors.white,
                          ),
                          Text(
                            'Clock',
                            style: TextStyle(color: Colors.white, fontSize: 14),
                          )
                        ],
                      )),
                ],
              ),
              SizedBox(
                height: 50,
              ),
              Row(
                children: [
                  FlatButton(
                      onPressed: () {},
                      child: Column(
                        children: <Widget>[
                          Icon(
                            Icons.alarm_add_outlined,
                            color: Colors.white,
                          ),
                          Text(
                            'Alarms',
                            style: TextStyle(color: Colors.white, fontSize: 14),
                          )
                        ],
                      )),
                ],
              ),
              SizedBox(
                height: 50,
              ),
              Row(
                children: [
                  FlatButton(
                      onPressed: () {
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: (context) => StopWatchMain(),
                          ),
                        );
                      },
                      child: Column(
                        children: <Widget>[
                          Icon(
                            Icons.album_sharp,
                            color: Colors.white,
                          ),
                          Text(
                            'Stopwatch',
                            style: TextStyle(color: Colors.white, fontSize: 14),
                          )
                        ],
                      )),
                ],
              ),
              SizedBox(
                height: 50,
              ),
              Row(
                children: [
                  FlatButton(
                      onPressed: () {
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: (context) => TimerMain(),
                          ),
                        );
                      },
                      child: Column(
                        children: <Widget>[
                          Icon(
                            Icons.alarm_off_rounded,
                            color: Colors.white,
                          ),
                          Text(
                            'Timer',
                            style: TextStyle(color: Colors.white, fontSize: 14),
                          )
                        ],
                      )),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
