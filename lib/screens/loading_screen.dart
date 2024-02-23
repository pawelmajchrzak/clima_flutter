import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';

class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  Future<void> getLocation() async {
    LocationPermission permission = await Geolocator.requestPermission();

    if (permission == LocationPermission.denied) {
      // Użytkownik odmówił dostępu do lokalizacji
      print("Użytkownik odmówił dostępu do lokalizacji");
    } else if (permission == LocationPermission.deniedForever) {
      // Użytkownik trwale odmówił dostępu do lokalizacji
      print("Użytkownik trwale odmówił dostępu do lokalizacji");
    } else {
      // Użytkownik udzielił zgody
      Position position = await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.low);
      print(position);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: TextButton(
          onPressed: () {
            // Pobierz aktualną lokalizację
            getLocation();
          },
          child: Text('Pobierz lokalizację'),
        ),
      ),
    );
  }
}