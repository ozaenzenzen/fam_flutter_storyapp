import 'package:geolocator/geolocator.dart';

class AppLocationService {
  static Future<Position?> getCurrentPosition() async {
    try {
      Position currentPosition = await Geolocator.getCurrentPosition();
      return currentPosition;
    } catch (e) {
      return null;
    }
  }
}
