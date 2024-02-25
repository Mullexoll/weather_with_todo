part of 'weather_bloc.dart';

abstract class WeatherState extends Equatable {
  const WeatherState();
}

final class WeatherInitial extends WeatherState {
  @override
  List<Object?> get props => [];
}

final class WeatherLoading extends WeatherState {
  @override
  List<Object?> get props => [];
}

final class WeatherLoaded extends WeatherState {
  final double currentPositionLatitude;
  final double currentPositionLongitude;
  final WeatherData? weatherData;
  final CityNotFoundException? cityNotFoundException;
  final String currentCountry;
  final String currentCityAddress;
  final String currentAreaDistrict;

  const WeatherLoaded({
    required this.currentPositionLatitude,
    required this.currentPositionLongitude,
    required this.weatherData,
    required this.cityNotFoundException,
    required this.currentAreaDistrict,
    required this.currentCityAddress,
    required this.currentCountry,
  });

  WeatherLoaded copyWith({
    double? currentPositionLatitude,
    double? currentPositionLongitude,
    WeatherData? weatherData,
    CityNotFoundException? cityNotFoundException,
    String? currentAreaDistrict,
    String? currentCityAddress,
    String? currentCountry,
  }) {
    return WeatherLoaded(
      currentPositionLatitude:
          currentPositionLatitude ?? this.currentPositionLatitude,
      currentPositionLongitude:
          currentPositionLongitude ?? this.currentPositionLongitude,
      weatherData: weatherData ?? this.weatherData,
      cityNotFoundException: cityNotFoundException,
      currentAreaDistrict: currentAreaDistrict ?? this.currentAreaDistrict,
      currentCityAddress: currentCityAddress ?? this.currentCityAddress,
      currentCountry: currentCountry ?? this.currentCountry,
    );
  }

  @override
  List<Object?> get props => [
        currentPositionLatitude,
        currentPositionLongitude,
        weatherData,
        cityNotFoundException,
        currentAreaDistrict,
        currentCityAddress,
        currentCountry,
      ];
}
