import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/cubits/weather_cubit/weather_cubit.dart';
import 'package:weather_app/cubits/weather_cubit/weather_state.dart';
import 'package:weather_app/views/home_page.dart';


void main() {
  runApp(const WeatherApp());
}

class WeatherApp extends StatelessWidget {
  const WeatherApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => GetWeatherCubit(),
      child: Builder(builder: (context) {
        return BlocBuilder<GetWeatherCubit, WeatherState>(
          builder: (context, state) {
            return MaterialApp(
              debugShowCheckedModeBanner: false,
              theme: ThemeData(
                primaryColor: getThemeColor(
                  BlocProvider.of<GetWeatherCubit>(context)
                      .weatherModel
                      ?.weatherCondition,
                ),
              ),
              home: const HomePage(),
            );
          },
        );
      }),
    );
  }
}


MaterialColor getThemeColor(String? condition) {
  if (condition == null) {
    return Colors.blue; // Default color
  }
  switch (condition) {
    case 'Sunny':
      return Colors.orange; // Orange for sunny weather
    case 'Clear':
      return Colors.deepOrange; // Deep orange for clear skies
    case 'Partly cloudy':
      return Colors.blueGrey; // Blue-grey for partly cloudy
    case 'Cloudy':
      return Colors.grey; // Grey for cloudy weather
    case 'Overcast':
      return Colors.blueGrey; // Blue-grey for overcast skies
    case 'Mist':
      return Colors.teal; // Teal for misty weather
    case 'Patchy rain possible':
    case 'Light rain':
    case 'Patchy light rain':
      return Colors.lightBlue; // Light blue for light rain
    case 'Moderate rain':
    case 'Moderate rain at times':
      return Colors.blue; // Blue for moderate rain
    case 'Heavy rain':
    case 'Heavy rain at times':
      return Colors.indigo; // Indigo for heavy rain
    case 'Patchy snow possible':
    case 'Light snow':
    case 'Patchy light snow':
      return Colors.lightBlue; // Light blue for snow
    case 'Moderate snow':
    case 'Patchy moderate snow':
      return Colors.blue; // Blue for moderate snow
    case 'Heavy snow':
    case 'Patchy heavy snow':
      return Colors.blueGrey; // Darker blue for heavy snow
    case 'Blizzard':
      return Colors.grey; // Grey for blizzard
    case 'Fog':
    case 'Freezing fog':
      return Colors.grey; // Dark grey for fog
    case 'Thundery outbreaks possible':
    case 'Patchy light rain with thunder':
    case 'Moderate or heavy rain with thunder':
      return Colors.purple; // Purple for thunderstorms
    case 'Ice pellets':
    case 'Light showers of ice pellets':
    case 'Moderate or heavy showers of ice pellets':
      return Colors.cyan; // Cyan for ice pellets
    case 'Light drizzle':
    case 'Patchy light drizzle':
      return Colors.lightGreen; // Light green for drizzle
    case 'Freezing drizzle':
    case 'Heavy freezing drizzle':
      return Colors.cyan; // Cyan for freezing drizzle
    case 'Light freezing rain':
    case 'Moderate or heavy freezing rain':
      return Colors.blueGrey; // Blue-grey for freezing rain
    case 'Light sleet':
    case 'Moderate or heavy sleet':
      return Colors.cyan; // Cyan for sleet
    default:
      return Colors.blue; // Default color
  }
}