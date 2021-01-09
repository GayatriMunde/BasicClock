import 'package:Puzzle_Alarm/HomePage.dart';
import 'package:flutter/cupertino.dart';
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:numberpicker/numberpicker.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

class TimerMain extends StatefulWidget {
  @override
  _TimerMainState createState() => _TimerMainState();
}

class _TimerMainState extends State<TimerMain> {
  int hour = 0;
  int min = 0;
  int sec = 0;
  int timeForTimer = 0;
  String timeToDisplay = "";
  int secDisplay = 00;
  int minDisplay = 00;
  int hourDisplay = 00;
  int temp = 0;
  bool started = true;
  bool stopped = true;
  bool checkTimer = true;

  @override
  Widget build(BuildContext context) {
    void start() {
      setState(() {
        started = false;
        stopped = true;
      });
      timeForTimer = ((hour * 3600) + (min * 60) + sec);
      Timer.periodic(
          Duration(
            seconds: 1,
          ), (Timer timer) {
        setState(() {
          if (timeForTimer < 1 || checkTimer == false) {
            timer.cancel();
            checkTimer = true;
            timeToDisplay = null;
            started = false;
            stopped = false;
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (context) => TimerMain(),
              ),
            );
          } else {
            timeForTimer = timeForTimer - 1;
          }

          hourDisplay = timeForTimer ~/ 3600;
          temp = (timeForTimer.remainder(3600)).toInt();
          minDisplay = temp ~/ 60;
          secDisplay = (temp.remainder(60)).toInt();
          timeToDisplay = hourDisplay.toString() +
              " : " +
              minDisplay.toString() +
              " : " +
              secDisplay.toString();
        });
      });
    }

    void stop() {
      setState(() {
        started = true;
        stopped = false;
        checkTimer = false;
      });
    }

    return Scaffold(
      backgroundColor: Color(0xFF2D2F41),
      appBar: AppBar(
        title: Text(
          "PuzzleAlarm: Timer",
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
      body: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Expanded(
              flex: 5,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Padding(
                        padding: EdgeInsets.only(
                          bottom: 10.0,
                        ),
                        child: Text("Hours\n\n",
                            style: TextStyle(
                              fontSize: 18.0,
                              color: Colors.white,
                            )),
                      ),
                      NumberPicker.integer(
                          initialValue: hour,
                          minValue: 0,
                          maxValue: 23,
                          listViewWidth: 120.0,
                          onChanged: (val) {
                            setState(() {
                              hour = val;
                            });
                          })
                    ],
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Padding(
                        padding: EdgeInsets.only(
                          bottom: 10.0,
                        ),
                        child: Text("Minutes\n\n",
                            style: TextStyle(
                              fontSize: 18.0,
                              color: Colors.white,
                            )),
                      ),
                      NumberPicker.integer(
                          initialValue: min,
                          minValue: 0,
                          maxValue: 60,
                          listViewWidth: 120.0,
                          onChanged: (val) {
                            setState(() {
                              min = val;
                            });
                          })
                    ],
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Padding(
                        padding: EdgeInsets.only(
                          bottom: 10.0,
                        ),
                        child: Text("Seconds\n\n",
                            style: TextStyle(
                              fontSize: 18.0,
                              color: Colors.white,
                            )),
                      ),
                      NumberPicker.integer(
                          initialValue: sec,
                          minValue: 0,
                          maxValue: 60,
                          listViewWidth: 120.0,
                          onChanged: (val) {
                            setState(() {
                              sec = val;
                            });
                          })
                    ],
                  ),
                ],
              ),
            ),
            Expanded(
              flex: 1,
              child: Text(
                timeToDisplay,
                style: TextStyle(
                  fontSize: 35.0,
                  fontWeight: FontWeight.w600,
                  color: Colors.white,
                ),
              ),
            ),
            Expanded(
                flex: 3,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    RaisedButton(
                      onPressed: started ? start : null,
                      padding: EdgeInsets.symmetric(
                        horizontal: 20.0,
                        vertical: 10.0,
                      ),
                      color: Colors.greenAccent[200],
                      child: Text(
                        "Start",
                        style: TextStyle(
                          fontSize: 18.0,
                          color: Colors.white,
                        ),
                      ),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15.0)),
                    ),
                    SizedBox(
                      width: 50,
                    ),
                    RaisedButton(
                      onPressed: stopped ? stop : null,
                      padding: EdgeInsets.symmetric(
                        horizontal: 20.0,
                        vertical: 10.0,
                      ),
                      color: Colors.redAccent[200],
                      child: Text(
                        "Pause",
                        style: TextStyle(
                          fontSize: 18.0,
                          color: Colors.white,
                        ),
                      ),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15.0)),
                    )
                  ],
                ))
          ],
        ),
      ),
    );
  }
}
