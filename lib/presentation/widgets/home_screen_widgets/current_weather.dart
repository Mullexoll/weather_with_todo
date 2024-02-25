import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:weather_with_todo/constants/current_weather_consts.dart';
import 'package:weather_with_todo/presentation/widgets/home_screen_widgets/part_of_day.dart';

import '../../../domain/models/weather_models/daily_forecast.model.dart';
import '../../../domain/models/weather_models/weather_data.model.dart';
import '../../helpers/text_style_helper.dart';

class DailyForecastCard extends StatelessWidget {
  final String currentCountry;
  final String currentCityAddress;
  final String currentAreaDistrict;
  final DailyForecast dailyForecast;
  final WeatherData weatherData;

  const DailyForecastCard({
    super.key,
    required this.dailyForecast,
    required this.currentCountry,
    required this.currentCityAddress,
    required this.currentAreaDistrict,
    required this.weatherData,
  });

  getForecastDayName(int timestamp) {
    DateFormat dateFormat = DateFormat('EEEE');
    DateTime date = DateTime.fromMillisecondsSinceEpoch(
      timestamp * CurrentWeatherConsts.timeStampMultiplication,
    );
    String dayName = dateFormat.format(date);

    return dayName;
  }

  getForecastDayNumber(int timestamp) {
    DateTime date = DateTime.fromMillisecondsSinceEpoch(
      timestamp * CurrentWeatherConsts.timeStampMultiplication,
    );

    return date.day;
  }

  getForecastMonthName(int timestamp) {
    DateFormat dateFormat = DateFormat('MMMM');
    DateTime date = DateTime.fromMillisecondsSinceEpoch(
      timestamp * CurrentWeatherConsts.timeStampMultiplication,
    );
    String monthName = dateFormat.format(date);

    return monthName;
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Card(
        color: Colors.white.withOpacity(0.9),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      '${currentCityAddress != '' ? currentCityAddress : currentAreaDistrict} , $currentCountry',
                      style: const TextStyle(
                        fontFamily: 'Poppins',
                        fontSize: 16,
                        color: Colors.black,
                      ),
                    ),
                    Text(
                      '${getForecastDayName(dailyForecast.dt)}, ${getForecastDayNumber(dailyForecast.dt).toString()} ${getForecastMonthName(dailyForecast.dt).toString()}',
                      style: const TextStyle(
                        fontFamily: 'Poppins',
                        fontSize: 14,
                        color: Colors.black,
                      ),
                    ),
                    SizedBox(
                      width: CurrentWeatherConsts.summaryWidth,
                      child: Text(
                        dailyForecast.summary,
                        textAlign: TextAlign.start,
                        style: primaryTextStyle12(),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 8.0, left: 16),
                      child: PartOfDayWeather(
                        dailyForecast: dailyForecast,
                      ),
                    ),
                  ],
                ),
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.max,
                children: [
                  Text(
                    '${weatherData.current.temp.toStringAsFixed(0)}°',
                    style: primaryTextStyle30(),
                  ),
                  Image.network(
                    'https://openweathermap.org/img/wn/${dailyForecast.weather[0].icon}@2x.png',
                    width: CurrentWeatherConsts.currentWeatherImageWidth,
                    height: CurrentWeatherConsts.currentWeatherImageHeight,
                  ),
                  Text(
                    dailyForecast.weather[0].main,
                    style: primaryTextStyle15(),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
