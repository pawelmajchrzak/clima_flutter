import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import '../services/location.dart';


class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  @override
  void initState() {
    super.initState();
    getLocation();
    getData();
  }
  void getLocation() async {
    Location location = Location();
    await location.getCurrentLocation();
    print(location.getLatitude);
    print(location.getLongitude);
  }

  void getData() async {
    var url = Uri.parse('https://api.openweathermap.org/data/2.5/weather?lat=54&lon=18&appid=b15535624271311e7eda816d5ba2911c');
    http.Response response = await http.get(url);
    //print(response.body);
    if (response.statusCode == 200) {
      String data = response.body;

      var decodedData = jsonDecode(data);

      double temperature = decodedData['main']['temp'];
      int condition = decodedData['weather'][0]['id'];
      String cityName = decodedData['name'];



      print(temperature);
      print(condition);
      print(cityName);


      //print(data);
    } else {
      print(response.statusCode);
    }

    //print(response);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold();
  }
}
