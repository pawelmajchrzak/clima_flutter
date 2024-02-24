import 'package:flutter/material.dart';
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
  }
  void getLocation() async {
    Location location = Location();
    await location.getCurrentLocation();
    print(location.getLatitude);
    print(location.getLongitude);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold();
  }
}
