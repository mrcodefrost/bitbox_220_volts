import 'package:bitbox_220_volts/models/sensor_data.dart';
import 'package:flutter/material.dart';

class WelcomeScreen extends StatefulWidget {
  @override
  _WelcomeScreenState createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text('RAHAT'),
      ),
      body: Column(
        children: <Widget>[
          Row(
            children: <Widget>[
              Container(
                padding: EdgeInsets.all(15.0),
                child: Text(
                  'Hello',
                  style: TextStyle(
                    color: Colors.pinkAccent,
                  ),
                ),
              ),
              Container(
                padding: EdgeInsets.all(15.0),
                color: Colors.purpleAccent.shade100,
                child: FlatButton(
                  child: Text('Tap Me'),
                  onPressed: () {
                    setState(() {
                      SensorData().getSensorData();
                    });
                  },
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
