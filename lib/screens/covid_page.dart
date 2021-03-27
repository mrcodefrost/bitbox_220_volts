import 'package:bitbox_220_volts/constants.dart';
import 'package:flutter/material.dart';

class CovidPage extends StatefulWidget {
  @override
  _CovidPageState createState() => _CovidPageState();
}

class _CovidPageState extends State<CovidPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Corona Virus Updates',
          style: kHeadingTextStyle.copyWith(color: Colors.white),
        ),
      ),
      body: Column(
        children: <Widget>[
          Container(
            child: Text(
              'Hello',
              style: kHeadingTextStyle,
            ),
            color: Colors.black,
            height: 50.0,
            width: 80.0,
          )
        ],
      ),
    );
  }
}
