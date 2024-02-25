import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../../constants/services_consts.dart';
import '../../domain/exceptions/api_exceptions.dart';
import '../../domain/models/weather_models/weather_data.model.dart';

class WeatherAPI {
  final http.Client _httpClient = http.Client();

  Future<WeatherData?> getData(String url) async {
    try {
      final response = await _httpClient.get(Uri.parse(url));

      if (response.statusCode == 200) {
        final Map<String, dynamic> data = jsonDecode(response.body);

        return WeatherData.fromJson(data);
      } else {
        debugPrint('response.statusCode ${response.statusCode}');
      }
    } catch (e) {
      debugPrint('Error in getData: $e');
    }

    return null;
  }

  Future<List?> getCityLocation(String cityName) async {
    try {
      if (ServicesConsts.weatherApiKey.isEmpty) {
        throw InvalidApiKeyException();
      }
      final response = await _httpClient.get(Uri.parse(
        '${ServicesConsts.cityLocationApiUrl}q=$cityName&appid=${ServicesConsts.weatherApiKey}',
      ));

      if (response.statusCode == 200) {
        final List data = jsonDecode(response.body);

        return data;
      } else {
        debugPrint('response.statusCode ${response.statusCode}');
      }
    } catch (e) {
      debugPrint('Error in getCityLocation: $e');
    }

    return null;
  }

  Future<WeatherData?> getLocationWeather(
      double latitude, double longitude) async {
    final url =
        '${ServicesConsts.weatherApiUrl}?lat=$latitude&lon=$longitude&appid=${ServicesConsts.weatherApiKey}&units=metric';

    return getData(url);
  }
}
