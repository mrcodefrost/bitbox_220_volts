import 'package:flutter/material.dart';

class TemperaturePage extends StatefulWidget {
  TemperaturePage({this.allData});

  final allData;

  @override
  _TemperaturePageState createState() => _TemperaturePageState();
}

class _TemperaturePageState extends State<TemperaturePage> {
  String temperature;

  @override
  void initState() {
    super.initState();
    updateTemp(widget.allData);
  }

  void updateTemp(dynamic arduinoData) {
    temperature = arduinoData['feeds'][2]['field2'];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text('Temperature')),
      ),
      body: Column(
        children: <Widget>[
          Spacer(),
          Container(
            child: Text('Temperature displayed here $temperature'),
          ),
          Spacer(),
        ],
      ),
    );
  }
}
