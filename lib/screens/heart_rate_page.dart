import 'package:bitbox_220_volts/constants.dart';
import 'package:flutter/material.dart';

class HeartRatePage extends StatefulWidget {
  HeartRatePage({this.allData});

  final allData;

  @override
  _HeartRatePageState createState() => _HeartRatePageState();
}

class _HeartRatePageState extends State<HeartRatePage> {
  String heartRate;

  @override
  void initState() {
    super.initState();
    updateHeart(widget.allData);
  }

  void updateHeart(dynamic arduinoData) {
    heartRate = arduinoData['feeds'][49]['field1'];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('HEART RATE', style: kHeadingTextStyle),
      ),
      body: Column(
        children: <Widget>[
          Container(
            child: Image(
              image: AssetImage('assets/heart.png'),
            ),
          ),
          Text(
            'Your current Heart Rate in BPM is',
            style: kTitleTextstyle.copyWith(color: Colors.pink.shade700),
          ),
          Container(
            child: Text(
              '$heartRate',
              style: TextStyle(fontSize: 50.0, color: Color(0xFFFF5722)),
            ),
          ),
        ],
      ),
    );
  }
}
