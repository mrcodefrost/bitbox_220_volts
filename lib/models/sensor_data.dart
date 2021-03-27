import 'dart:convert';

import 'package:http/http.dart' as http;

const URL = 'https://api.thingspeak.com/channels/1339816/feeds.json?api_key=';
const APIKEY = 'L7TMQIQJ9FWNSEUD&results=1000';

class SensorData {
  Future getSensorData() async {
    String requestURL = '$URL$APIKEY';

    http.Response response = await http.get(requestURL);

    if (response.statusCode == 200) {
      var data = response.body;
      var decodedData = jsonDecode(data);
      return decodedData;
    } else {
      print(response.statusCode);
    }
  }
}
