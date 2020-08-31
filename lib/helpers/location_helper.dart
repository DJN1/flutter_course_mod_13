import 'dart:convert';

import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;

class LocationHelper {
  static String generateLocationPreviewImage(
      {double latitude, double longitude}) {
    return 'https://maps.googleapis.com/maps/api/staticmap?center=$latitude,$longitude&zoom=10&size=600x300&maptype=roadmap&markers=color:red%7Clabel:U%7C$latitude,$longitude&key=${DotEnv().env['GOOGLE_MAPS_API_KEY']}';
  }

  static Future<String> getPlaceAddress(double lat, double long) async {
    final url =
        'https://maps.googleapis.com/maps/api/geocode/json?latlng=$lat,$long&key=${DotEnv().env['GOOGLE_MAPS_API_KEY']}';
    final response = await http.get(url);
    return json.decode(response.body)['results'][0]['formatted_address'];
  }
}
