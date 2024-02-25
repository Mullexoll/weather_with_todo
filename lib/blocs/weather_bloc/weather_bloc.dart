import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:weather_with_todo/infrastructure/datasource/weather.api.dart';

import '../../domain/exceptions/api_exceptions.dart';
import '../../domain/models/weather_models/weather_data.model.dart';
import '../../services/geolocator.service.dart';

part 'weather_event.dart';
part 'weather_state.dart';

class WeatherBloc extends Bloc<WeatherEvent, WeatherState> {
  final GeolocatorService geolocatorService = GeolocatorService();

  WeatherBloc() : super(WeatherInitial()) {
    on<WeatherAppLoadedEvent>(_onWeatherAppLoaded);
  }

  Future<FutureOr<void>> _onWeatherAppLoaded(
    WeatherAppLoadedEvent event,
    Emitter<WeatherState> emit,
  ) async {
    //firstly emit loading state for showing progress indicator
    emit(WeatherLoading());
    try {
      //determine our geo position
      final currentGeoPosition = await geolocatorService.determinePosition();
      //get weather data from geo position
      final WeatherData? weatherData = await WeatherAPI().getLocationWeather(
        currentGeoPosition.latitude,
        currentGeoPosition.longitude,
      );
      //find city, country, district names
      List<Placemark> placemarks = await placemarkFromCoordinates(
          currentGeoPosition.latitude, currentGeoPosition.longitude);

      Placemark place1 = placemarks[0];
      String currentCityAddress = "${place1.locality}";
      String currentAreaDistrict = "${place1.administrativeArea}";
      String currentCountry = "${place1.country}";

      //emit new state with fetched data
      emit(
        WeatherLoaded(
          currentPositionLatitude: currentGeoPosition.latitude,
          currentPositionLongitude: currentGeoPosition.longitude,
          weatherData: weatherData,
          cityNotFoundException: null,
          currentAreaDistrict: currentAreaDistrict,
          currentCityAddress: currentCityAddress,
          currentCountry: currentCountry,
        ),
      );
    } catch (error, stacktrace) {
      debugPrint('$error $stacktrace');
      //default emit with default values
      emit(
        const WeatherLoaded(
          currentPositionLatitude: 50.450001,
          currentPositionLongitude: 30.523333,
          weatherData: null,
          cityNotFoundException: null,
          currentAreaDistrict: '',
          currentCityAddress: '',
          currentCountry: 'Ukraine',
        ),
      );
    }
  }
}
