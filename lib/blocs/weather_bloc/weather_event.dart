part of 'weather_bloc.dart';

abstract class WeatherEvent extends Equatable {
  const WeatherEvent();
}

class WeatherAppLoadedEvent extends WeatherEvent {
  const WeatherAppLoadedEvent();

  @override
  List<Object?> get props => [];
}
