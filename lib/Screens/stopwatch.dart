import 'dart:async';

import 'package:Puzzle_Alarm/HomePage.dart';
import 'package:flutter/material.dart';

class StopWatchMain extends StatefulWidget {
  @override
  _StopWatchMainState createState() => _StopWatchMainState();
}

class _StopWatchMainState extends State<StopWatchMain> {
  bool flag = true;
  Stream<int> timerStream;
  StreamSubscription<int> timerSubscription;
  String hoursStr = '00';
  String minutesStr = '00';
  String secondsStr = '00';

  Stream<int> stopWatchStream() {
    StreamController<int> streamController;
    Timer timer;
    Duration timerInterval = Duration(seconds: 1);
    int counter = 0;

    void stopTimer() {
      if (timer != null) {
        timer.cancel();
        timer = null;
        counter = 0;
        streamController.close();
      }
    }

    void tick(_) {
      counter++;
      streamController.add(counter);
      if (!flag) {
        stopTimer();
      }
    }

    void startTimer() {
      timer = Timer.periodic(timerInterval, tick);
    }

    streamController = StreamController<int>(
      onListen: startTimer,
      onCancel: stopTimer,
      onResume: startTimer,
      onPause: stopTimer,
    );

    return streamController.stream;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "PuzzleAlarm: StopWatch",
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
            },
          ),
      ),
      backgroundColor: Color(0xFF2D2F41),
      body: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Icon(
                      Icons.timer_sharp,
                      color: Colors.white,
                      size: 90,
                    )
                  ],
                ),
                SizedBox(height: 30.0),
                Row(
                  children: [
                    Text(
                      "$hoursStr:$minutesStr:$secondsStr",
                      style: TextStyle(
                        fontSize: 70.0,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 30.0),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    RaisedButton(
                      padding:
                          EdgeInsets.symmetric(horizontal: 20.0, vertical: 8.0),
                      onPressed: () {
                        timerStream = stopWatchStream();
                        timerSubscription = timerStream.listen((int newTick) {
                          setState(() {
                            hoursStr = ((newTick / (60 * 60)) % 60)
                                .floor()
                                .toString()
                                .padLeft(2, '0');
                            minutesStr = ((newTick / 60) % 60)
                                .floor()
                                .toString()
                                .padLeft(2, '0');
                            secondsStr = (newTick % 60)
                                .floor()
                                .toString()
                                .padLeft(2, '0');
                          });
                        });
                      },
                      color: Colors.green[200],
                      child: Text(
                        'START',
                        style: TextStyle(
                          fontSize: 20.0,
                        ),
                      ),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15.0)),
                    ),
                    SizedBox(width: 40.0),
                    RaisedButton(
                      padding:
                          EdgeInsets.symmetric(horizontal: 20.0, vertical: 8.0),
                      onPressed: () {
                        timerSubscription.cancel();
                        timerStream = null;
                        setState(() {
                          hoursStr = '00';
                          minutesStr = '00';
                          secondsStr = '00';
                        });
                      },
                      color: Colors.red[200],
                      child: Text(
                        'RESET',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20.0,
                        ),
                      ),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15.0)),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
