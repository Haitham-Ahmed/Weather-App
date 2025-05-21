import 'package:weather_app/models/weather_model.dart';

class WeatherState{}

class WeatherInitialState extends WeatherState{}

class WeatherLoadedState extends WeatherState{
  final WeatherModel weatherModel;

  WeatherLoadedState({required this.weatherModel});
}

class WeatherFailurestate extends WeatherState{
  final String errorMessage;

  WeatherFailurestate(String string, {required this.errorMessage});
}
