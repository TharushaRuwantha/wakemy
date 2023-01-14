import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';

class ClockView extends StatefulWidget {
  const ClockView({Key? key}) : super(key: key);

  @override
  State<ClockView> createState() => _ClockViewState();
}

class _ClockViewState extends State<ClockView> {
  @override
  void initState() {
    Timer.periodic(Duration(seconds: 1), (timer) {
      setState(() {

      });
    });
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Container(
      width : 300.0,
      height: 300.0 ,
      child: Transform.rotate(
        angle: -pi /2,
        child: CustomPaint(
          painter: ClockPainter() ,
        ),
      ),
    );
  }
}


class  ClockPainter extends CustomPainter{
  var dateTime = DateTime.now();

  @override
  void paint(Canvas canvas, Size size) {
    var centerX = size.width / 2;
    var centerY = size.height /2 ;
    var center = Offset(centerX,centerY);
    var radius = min(centerX , centerY);

    var fillBursh = Paint()
    ..color= Color(0xFF444974);

    var outlineBrush = Paint()
      ..color= Color(0xFFEAECFF)
      ..strokeWidth=16
      ..style = PaintingStyle.stroke;

    var centerFillBrush = Paint()
      ..color = Color(0xFFEAECFF);

    var secHandBrush = Paint()
      ..shader = RadialGradient(colors: [Colors.orangeAccent , Colors.yellow]).createShader(Rect.fromCircle(center: center, radius: radius))
      ..style=PaintingStyle.stroke
      ..strokeCap = StrokeCap.round
      ..strokeWidth = 4;

    var minHandBrush = Paint()
      ..shader = RadialGradient(colors: [Colors.purple , Colors.lightBlue]).createShader(Rect.fromCircle(center: center, radius: radius))
      ..style=PaintingStyle.stroke
      ..strokeCap = StrokeCap.round
      ..strokeWidth=12;

    var hourHandBrush = Paint()
      ..shader = RadialGradient(colors: [Colors.pinkAccent ,Colors.deepPurpleAccent]).createShader(Rect.fromCircle(center: center, radius: radius))
      ..style=PaintingStyle.stroke
      ..strokeCap = StrokeCap.round
      ..strokeWidth=16;

    var dashBrush = Paint()
      ..color=Colors.white
      ..style=PaintingStyle.stroke
      ..strokeWidth = 1;

    //clock cricles
    canvas.drawCircle(center, radius-40, fillBursh);
    canvas.drawCircle(center, radius-40, outlineBrush);

    var hourHandX =  centerX + 60 * cos((dateTime.hour *30 + dateTime.minute*0.5) * pi / 180);
    var hourHandY = centerY +60 * sin((dateTime.hour *30 + dateTime.minute*0.5) * pi/180);
    canvas.drawLine(center,Offset(hourHandX, hourHandY), hourHandBrush);

    var minHandX =  centerX + 80 * cos(dateTime.minute*6 * pi / 180);
    var minHandY = centerY +80 * sin(dateTime.minute*6 * pi/180);
    canvas.drawLine(center, Offset(minHandX, minHandY), minHandBrush);

    var secHandX =  centerX + 80 * cos(dateTime.second*6 * pi / 180);
    var secHandY = centerY +80 * sin(dateTime.second*6  * pi/180);
    canvas.drawLine(center,Offset(secHandX, secHandY), secHandBrush);
    canvas.drawCircle(center, 16, centerFillBrush);



    //dashLine
    var outerCricleRadius = radius;
    var InnerCricleRadius = radius - 14;
    for (double  i  =0 ;  i <360 ; i+= 12){
      var X1 = centerX + outerCricleRadius * cos( i * pi / 180);
      var Y1 = centerY + outerCricleRadius * sin( i * pi / 180);

      var X2 = centerX + InnerCricleRadius * cos(i * pi / 180);
      var Y2 = centerY + InnerCricleRadius * sin(i * pi / 180);

      canvas.drawLine(Offset(X1,Y1), Offset(X2, Y2), dashBrush);
    }

  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    // TODO: implement shouldRepaint
    return true;
  }

}