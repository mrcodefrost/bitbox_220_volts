import 'package:bitbox_220_volts/constants.dart';
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
    temperature = arduinoData['feeds'][49]['field2'];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('TEMPERATURE', style: kHeadingTextStyle),
      ),
      body: SingleChildScrollView(
        
        child: Column(
          children: <Widget>[
            Container(
              child: Center(
                child: Image(
                  image: AssetImage('assets/temperature_check.png'),
                ),
              ),
            ),
            Container(
              child: Text(
                'Your current temperature in fahrenheit is',
                style: kTitleTextstyle.copyWith(color: Colors.pink.shade700),
              ),
            ),
            Text('$temperature',
                style: TextStyle(fontSize: 50.0, color: Color(0xFFFF5722))),
          ],
        ),
      ),
    );
  }
}
