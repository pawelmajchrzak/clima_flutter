import 'package:clima/screens/location_screen.dart';
import 'package:flutter/material.dart';
import '../services/location.dart';
import '../services/networking.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

const apiKey = 'b15535624271311e7eda816d5ba2911c';

class LoadingScreen extends StatefulWidget {

  LoadingScreen(this.locationWeather);

  final locationWeather;


  @override
  _LoadingScreenState createState() => _LoadingScreenState();


}

class _LoadingScreenState extends State<LoadingScreen> {

  late double latitude;
  late double longitude;

  @override
  void initState() {
    super.initState();
    getLocationData();
  }

  void getLocationData() async {
    Location location = Location();
    await location.getCurrentLocation();
    latitude = location.getLatitude;
    longitude = location.getLongitude;

    NetworkHelper networkHelper = NetworkHelper('https://api.openweathermap.org/data/2.5/weather?lat=$latitude&lon=$longitude&appid=$apiKey&units=metric');

    var weatherData = await networkHelper.getData();

    Navigator.push(context, MaterialPageRoute(builder: (context) {
      return LocationScreen();
    }));
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SpinKitDoubleBounce(
          color: Colors.white,
          size: 100.0,
        ),
      ),
    );
  }
}
