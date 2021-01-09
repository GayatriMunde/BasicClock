import 'package:flutter/material.dart';
import 'package:Puzzle_Alarm/Screens/Alarms.dart';
import 'package:Puzzle_Alarm/widgets/circle_day.dart';

class AddAlarm extends StatefulWidget {
  AddAlarm({Key key}) : super(key: key);

  _AddAlarmState createState() => _AddAlarmState();
}

class _AddAlarmState extends State<AddAlarm> {

  TimeOfDay _selectedTime;
  ValueChanged<TimeOfDay> selectTime;
  bool daySelected = false;

  @override
  void initState() {
     _selectedTime = new TimeOfDay(hour: 12, minute: 30);
    super.initState();
  }

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
                builder: (context) => AlarmPage(),
              ),
            );
          }),
      ),
      backgroundColor: Color(0xFF2D2F41),
      body: Padding(
        padding: EdgeInsets.all(20.0),
        child: Container(
          child: Column(
            children: <Widget>[
              SizedBox(height: 60.0,),
              new GestureDetector(
                child: Text(_selectedTime.format(context), style: TextStyle(
                  fontSize: 60.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),),
                onTap: () {
                  _selectTime(context);
                },
              ),
              SizedBox(height: 30.0,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  circleDay('Mon', context, false),
                  circleDay('Tue', context, true),
                  circleDay('Wed', context, true),
                  circleDay('Thu', context, true),
                  circleDay('Fri', context, false),
                  circleDay('Sat', context, true),
                  circleDay('Sun', context, false),
                ],
              ),
              SizedBox(height: 60.0,),
              SizedBox(height: 2.0, child: Container(color: Colors.white30,),),
              ListTile(
                leading: Icon(Icons.notifications_none, color: Colors.white,),
                title: Text('Alarm Notification', style: TextStyle(color: Colors.white)),
              ),
              SizedBox(height: 2.0, child: Container(color: Colors.white30,),),
              ListTile(
                leading: Icon(Icons.check_box, color: Colors.white,),
                title: Text('Vibrate', style: TextStyle(color: Colors.white)),
              ),
              SizedBox(height: 2.0, child: Container(color: Colors.white30,),),
              SizedBox(height: 60.0,),
              FlatButton(
                color: Theme.of(context).accentColor,
                child: Text('Save', style: TextStyle(color: Colors.white)),
                onPressed: () => Navigator.of(context).pop()
              )
            ],
          ),
        )
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton(
        onPressed: () =>  Navigator.of(context).pop(),
        backgroundColor: Colors.white,
        child: Icon(
          Icons.delete,
          size: 20.0,
          color:Theme.of(context).accentColor,
        ),
      )
    );
  }

  Future<void> _selectTime(BuildContext context) async {
    final TimeOfDay picked =  await showTimePicker(
      context: context, 
      initialTime: _selectedTime
    );
    setState(() {
      _selectedTime = picked;
    });
  }
}