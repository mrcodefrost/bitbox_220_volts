import 'package:bitbox_220_volts/constants.dart';
import 'package:flutter/material.dart';

class BMIPage extends StatefulWidget {
  @override
  _BMIPageState createState() => _BMIPageState();
}

class _BMIPageState extends State<BMIPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'BMI CALCULATOR',
          style: kHeadingTextStyle,
        ),
      ),
      body: Column(
        children: <Widget>[
          Container(
            color: Colors.black,
            child: Text('This is BMI Calculator Screen'),
          ),
        ],
      ),
    );
  }
}
