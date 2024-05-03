import 'dart:convert';
import 'package:flutter/services.dart' show rootBundle;

class UserLocation {
  final String name;
  final double latitude;
  final double longitude;

  UserLocation({
    required this.name,
    required this.latitude,
    required this.longitude,
  });
}

Future<List<UserLocation>> loadUserLocations() async {

  String data = await rootBundle.loadString('assets/user_locations.json');

  List<dynamic> jsonList = json.decode(data);
  List<UserLocation> userLocations = [];

  for (var item in jsonList) {
    userLocations.add(UserLocation(
      name: item['name'],
      latitude: item['latitude'],
      longitude: item['longitude'],
    ));
  }

  return userLocations;
}
