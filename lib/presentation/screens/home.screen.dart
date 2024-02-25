import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_with_todo/presentation/widgets/home_screen_widgets/add_new_todo.dart';
import 'package:weather_with_todo/presentation/widgets/home_screen_widgets/todos_builder.dart';

import '../../blocs/weather_bloc/weather_bloc.dart';
import '../../constants/home_screen_consts.dart';
import '../widgets/home_screen_widgets/current_weather.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: HomeScreenConsts.primaryColor,
        floatingActionButton: FloatingActionButton(
          //for showing add new todo dialog
          onPressed: () => showDialog(
            context: context,
            builder: (context) => const AddNewTodo(),
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(vertical: 16.0),
          child: Column(
            children: [
              const Text(
                'Current weather',
                style: TextStyle(
                  fontFamily: 'Poppins',
                  color: Colors.white,
                  fontSize: 25,
                  fontWeight: FontWeight.w500,
                ),
              ),
              //init weather widget, if geo position is finding state is Loading
              BlocBuilder<WeatherBloc, WeatherState>(
                builder: (context, state) {
                  if (state is WeatherLoading) {
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Card(
                        color: Colors.white.withOpacity(0.9),
                        child: const Padding(
                          padding: EdgeInsets.all(28.0),
                          child: Center(
                            child: CircularProgressIndicator(
                              color: HomeScreenConsts.primaryColor,
                            ),
                          ),
                        ),
                      ),
                    );
                  }
                  //if geo position founded, state is loaded
                  if (state is WeatherLoaded) {
                    return DailyForecastCard(
                      dailyForecast: state.weatherData!.daily.first,
                      currentCountry: state.currentCountry,
                      currentCityAddress: state.currentCityAddress,
                      currentAreaDistrict: state.currentAreaDistrict,
                      weatherData: state.weatherData!,
                    );
                  }

                  return const SizedBox.shrink();
                },
              ),
              const Text(
                'TODO`s',
                style: TextStyle(
                  fontFamily: 'Poppins',
                  color: Colors.white,
                  fontSize: 25,
                  fontWeight: FontWeight.w500,
                ),
              ),
              //for showing todo list, using custom scroll view
              const Expanded(
                child: TodosBuilder(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
