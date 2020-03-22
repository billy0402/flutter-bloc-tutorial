import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:meta/meta.dart';

import '../models/weather.dart';

class WeatherApiClient {
  static const baseUrl = 'https://www.metaweather.com';
  final http.Client httpClient;

  WeatherApiClient({
    @required this.httpClient,
  }) : assert(httpClient != null);

  Future<int> getLocationId(String city) async {
    final url = '$baseUrl/api/location/search/?query=$city';
    final response = await this.httpClient.get(url);

    if (response.statusCode != 200) {
      throw Exception('error getting locationId for city');
    }

    final json = jsonDecode(response.body) as List;
    return (json.first)['woeid'];
  }

  Future<Weather> getWeather(int locationId) async {
    final url = '$baseUrl/api/location/$locationId';
    final response = await this.httpClient.get(url);

    if (response.statusCode != 200) {
      throw Exception('error getting weather for location');
    }

    final json = jsonDecode(response.body);
    return Weather.fromJson(json);
  }
}
