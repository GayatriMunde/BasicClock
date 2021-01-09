import 'package:flutter/material.dart';
import 'package:Puzzle_Alarm/Screens/Alarms.dart';
import 'package:weekday_selector/weekday_selector.dart';

class ListItem {
  int value;
  String name;

  ListItem(this.value, this.name);
}

class AddAlarm extends StatefulWidget {
  AddAlarm({Key key}) : super(key: key);

  _AddAlarmState createState() => _AddAlarmState();
}

class _AddAlarmState extends State<AddAlarm> {
  TextEditingController nameInputController;
  TimeOfDay _selectedTime;
  ValueChanged<TimeOfDay> selectTime;

  List<ListItem> _dropdownItems = [
    ListItem(1, "Select Sound"),
    ListItem(2, "Pop"),
    ListItem(3, "Ripple"),
    ListItem(4, "Drizzle"),
    ListItem(5, "Basic"),
  ];

  List<DropdownMenuItem<ListItem>> _dropdownMenuItems;
  ListItem _selectedItem;

  var weekdays = List.filled(7, false);
  var selectedSound = "";

  @override
  void initState() {
    nameInputController = new TextEditingController();
    _selectedTime = new TimeOfDay(hour: 12, minute: 30);
    _dropdownMenuItems = buildDropDownMenuItems(_dropdownItems);
    _selectedItem = _dropdownMenuItems[0].value;
    super.initState();
  }

  List<DropdownMenuItem<ListItem>> buildDropDownMenuItems(List listItems) {
    List<DropdownMenuItem<ListItem>> items = List();
    for (ListItem listItem in listItems) {
      items.add(
        DropdownMenuItem(
          child: Text(listItem.name),
          value: listItem,
        ),
      );
    }
    return items;
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
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              SizedBox(
                height: 60.0,
              ),
              new GestureDetector(
                child: Text(
                  _selectedTime.format(context),
                  style: TextStyle(
                    fontSize: 60.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                onTap: () {
                  _selectTime(context);
                },
              ),
              SizedBox(
                height: 30.0,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Expanded(
                    child: SizedBox(
                      height: 80,
                      child: WeekdaySelector(
                        values: weekdays,
                        onChanged: (i) {
                          setState(() {
                            weekdays[i % 7] = !weekdays[i % 7];
                          });
                        },
                        selectedFillColor: Colors.blueGrey,
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 60.0,
              ),
              Row(
                children: [
                  Center(
                    child: Container(
                      margin: const EdgeInsets.only(right: 40, left: 60),
                      width: MediaQuery.of(context).size.width * 0.65,
                      height: MediaQuery.of(context).size.height * 0.075,
                      child: TextFormField(
                        textAlign: TextAlign.center,
                        decoration: InputDecoration(
                            filled: true,
                            fillColor: Colors.white,
                            enabledBorder: const OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(20.0)),
                              borderSide: const BorderSide(
                                color: Colors.grey,
                              ),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10.0)),
                              borderSide: BorderSide(color: Colors.blue),
                            ),
                            hintText: "Alarm Name"),
                        controller: nameInputController,
                        keyboardType: TextInputType.text,
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 30.0,
              ),
              Row(children: <Widget>[
                Column(
                  children: [
                    Container(
                      margin: const EdgeInsets.only(right: 40, left: 60),
                      width: MediaQuery.of(context).size.width * 0.65,
                      height: MediaQuery.of(context).size.height * 0.07,
                      //height: ,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20.0),
                          color: Colors.white,
                          border: Border.all()),
                      child: DropdownButtonHideUnderline(
                        child: Center(
                          child: DropdownButton(
                              value: _selectedItem,
                              items: _dropdownMenuItems,
                              onChanged: (value) {
                                setState(() {
                                  _selectedItem = value;
                                });
                              }),
                        ),
                      ),
                    ),
                  ],
                )
              ]),
              SizedBox(
                height: 50,
              ),
              Row(
                children: <Widget>[
                  Center(
                    child: Column(
                      children: [
                        RaisedButton(
                          onPressed: () {
                            Route route = MaterialPageRoute(
                                builder: (context) => AlarmPage());
                            Navigator.push(context, route);
                          },
                          child: SizedBox(
                            width: MediaQuery.of(context).size.width * 0.3,
                            child: Center(
                              child: Text("Cancel"),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.1,
                  ),
                  Column(
                    children: [
                      RaisedButton(
                        onPressed: () {
                          Route route = MaterialPageRoute(
                              builder: (context) => AlarmPage());
                          Navigator.push(context, route);
                        },
                        child: SizedBox(
                          width: MediaQuery.of(context).size.width * 0.32,
                          child: Center(
                            child: Text("Save"),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

/*

                  Container(
                    margin: const EdgeInsets.only(right: 45, left: 45),
                    child: TextFormField(
                      textAlign: TextAlign.center,
                      decoration: InputDecoration(
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(30)),
                            borderSide: BorderSide(color: Colors.blueGrey),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(30)),
                            borderSide: BorderSide(color: Colors.blueGrey),
                          ),
                          filled: true,
                          fillColor: Colors.white,
                          hintText: "Alarm Name"),
                      controller: nameInputController,
                      keyboardType: TextInputType.text,
                    ),
                  ),

                  SizedBox(
                    height: 60.0,
                  ),
                  
                  Row(
                    children: <Widget>[
                      RaisedButton(
                        onPressed: () {
                          Route route = MaterialPageRoute(
                              builder: (context) => AlarmPage());
                          Navigator.push(context, route);
                        },
                        child: SizedBox(
                          width: MediaQuery.of(context).size.width * 0.4,
                          child: Text("Minion"),
                        ),
                      ),
                      RaisedButton(
                        onPressed: () {
                          Route route = MaterialPageRoute(
                              builder: (context) => AlarmPage());
                          Navigator.push(context, route);
                        },
                        child: SizedBox(
                            width: MediaQuery.of(context).size.width * 0.4,
                            child: Text("Emoji")),
                      ),
                    ],
                  ),
*/

  Future<void> _selectTime(BuildContext context) async {
    final TimeOfDay picked =
        await showTimePicker(context: context, initialTime: _selectedTime);
    setState(() {
      _selectedTime = picked;
    });
  }
}
