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
    heartRate = arduinoData['feeds'][2]['field1'];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Heart Rate $heartRate'),
      ),
    );
  }
}
