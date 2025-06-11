import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/cubits/weather_cubit/weather_cubit.dart';
import 'package:weather_app/cubits/weather_cubit/weather_state.dart';
import 'package:weather_app/main.dart';
import 'package:weather_app/views/search_page.dart';
import 'package:weather_app/widgets/no_weather_body.dart';
import 'package:weather_app/widgets/weather_info_body.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      // appBar: AppBar(
      //   backgroundColor: Colors.blue,
      //   title: const Text(
      //     'Weather App',
      //     style: TextStyle(color: Colors.white),
      //   ),
      //   iconTheme: const IconThemeData(
      //     color: Colors.white,
      //   ),
      //   actions: [
      //     IconButton(
      //       onPressed: () {
      //         Navigator.of(context).push(
      //           MaterialPageRoute(builder: (context) {
      //             return const SearchView();
      //           }),
      //         );
      //       },
      //       icon: const Icon(
      //         Icons.search,
      //         color: Colors.white,
      //       ),
      //     ),
      //   ],
      // ),


body: BlocBuilder<GetWeatherCubit, WeatherState>(
  builder: (context, state) {
    Color appBarColor = Colors.blue; 
    if (state is WeatherLoadedState) {
      appBarColor = getThemeColor(state.weatherModel.weatherCondition);
    }
    

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: appBarColor, 
        title: const Text(
          'Weather App',
          style: TextStyle(color: Colors.white),
        ),
        iconTheme: const IconThemeData(
          color: Colors.white,
        ),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(builder: (context) {
                  return  SearchPage();
                }),
              );
            },
            icon: const Icon(
              Icons.search,
              color: Colors.white,
            ),
          ),
        ],
      ),
      body: state is WeatherLoadedState
          ? WeatherInfoBody(weather: state.weatherModel)
          : NoWeatherBody(),
    );
  },
),


      // body: BlocBuilder<GetWeatherCubit, WeatherState>(
      //   builder: (context, state) {
      //     if (state is WeatherInitialState) {
      //       return NoWeatherBody();
      //     } else if (state is WeatherLoadedState) {
      //       return WeatherInfoBody(
      //        weather: state.weatherModel,
      //       );
      //     }else{
      //       return Text('opps there is an error');
      //     }
      //   },
      // ),
    );
  }
}