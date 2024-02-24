import 'package:geolocator/geolocator.dart';

class Location {
  late double _latitude;
  double _longitude=5;

  Future<void> getCurrentLocation() async {
    try {
      LocationPermission permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        print("Użytkownik odmówił dostępu do lokalizacji");
      } else if (permission == LocationPermission.deniedForever) {
        print("Użytkownik trwale odmówił dostępu do lokalizacji");
      } else {
        Position position = await Geolocator.getCurrentPosition(
            desiredAccuracy: LocationAccuracy.low);
        _latitude = position.latitude;
        _longitude = position.longitude;
      }
    } catch (e) {
      print(e);
    }
  }

  double get getLongitude => _longitude;

  double get getLatitude => _latitude;
}