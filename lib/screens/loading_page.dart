import 'package:bitbox_220_volts/models/sensor_data.dart';
import 'package:bitbox_220_volts/screens/temperature_page.dart';
import 'package:flutter/material.dart';

class LoadingPage extends StatefulWidget {
  @override
  _LoadingPageState createState() => _LoadingPageState();
}

class _LoadingPageState extends State<LoadingPage> {
  @override
  void initState() {
    super.initState();
    getTempData();
  }

  void getTempData() async {
    SensorData sensorData = SensorData();
    var completeData = await sensorData.getSensorData();

    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => TemperaturePage(
                  allData: completeData,
                )));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: Image(
        image: AssetImage('assets/loading_temp.png'),
      )),
    );
  }
}
