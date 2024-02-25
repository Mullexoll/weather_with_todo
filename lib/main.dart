import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_with_todo/blocs/todo_bloc/todo_bloc.dart';
import 'package:weather_with_todo/presentation/screens/home.screen.dart';

import 'blocs/weather_bloc/weather_bloc.dart';

void main() {
  runApp(const TodoWeatherApp());
}

class TodoWeatherApp extends StatefulWidget {
  const TodoWeatherApp({super.key});

  @override
  WeatherAppState createState() => WeatherAppState();
}

class WeatherAppState extends State<TodoWeatherApp> {
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        //Create providers for init blocs
        BlocProvider(
          create: (context) => WeatherBloc()
            ..add(
              const WeatherAppLoadedEvent(),
            ),
        ),
        BlocProvider(
          create: (context) => TodoBloc()
            ..add(
              TodoRepositoryInit(),
            ),
        ),
      ],
      child: MaterialApp(
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: const HomeScreen(),
      ),
    );
  }
}
