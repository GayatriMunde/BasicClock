import 'package:flutter/material.dart';

Widget circleDay(day, context, selected){
  return Container(
    width: 50.0,
    height: 50.0,
    decoration: BoxDecoration(
      color: (selected)?Colors.blueGrey:Colors.transparent,
      borderRadius: BorderRadius.circular(100.0)
    ),
    child: Padding(
      padding: EdgeInsets.all(6.0),
      child: Center(
        child: Text(
          day,
          style: TextStyle(
            color: Colors.white,
            fontSize: 15.0
          ),
        ),
      ),
    )
  );
}