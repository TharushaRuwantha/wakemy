import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:wakemy/clock_view.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    var now = DateTime.now();
    var formatedTime = DateFormat('HH:mm').format(now);
    var formatedDate = DateFormat('EEE , d MMM').format(now);
    var timezoneString = now.timeZoneOffset.toString().split('.').first;
    //var offsetSign
    //TODO 3.28 seconds
    //m
    //e
    //t
    //h
    //a
    // n
    // a
    return  Scaffold(
      backgroundColor: Color(0xFF2DF41),
      body: Container(
        padding: EdgeInsets.all(32),
        alignment: Alignment.center,
       color: Color(0xFF2D2F41),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children:<Widget> [
            Text('Clock',style: TextStyle(
              color: Colors.white,
              fontSize: 24,
            ),),
            SizedBox(height:  32,),
            Text(formatedTime,style: TextStyle(
              color: Colors.white,
              fontSize: 64,
            ),),
            Text(formatedDate,style: TextStyle(
              color: Colors.white,
              fontSize: 20,
            ),),
            ClockView(),
            Text('Time Zone',style: TextStyle(
              color: Colors.white,
              fontSize: 20,
            ),),
            SizedBox(height: 16,),
            Row(
              children:<Widget> [
                Icon(Icons.language , color: Colors.white,),
                SizedBox(width: 16,),
                Text('UTC',style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                ),),
              ],


            )
          ],
        ),
      ),
    );
  }
}

