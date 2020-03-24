import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../common/loading_indicator.dart';
import '../theme/bloc/bloc.dart';
import 'bloc/bloc.dart';
import 'widget/widget.dart';

class WeatherPage extends StatefulWidget {
  State<WeatherPage> createState() => _WeatherPageState();
}

class _WeatherPageState extends State<WeatherPage> {
  Completer<void> _refreshCompleter;

  @override
  void initState() {
    super.initState();
    _refreshCompleter = Completer<void>();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: BlocConsumer<WeatherBloc, WeatherState>(
        listener: (context, state) {
          if (state is WeatherLoaded) {
            BlocProvider.of<ThemeBloc>(context).add(
              WeatherChanged(condition: state.weather.condition),
            );

            _refreshCompleter?.complete();
            _refreshCompleter = Completer();
          }
        },
        builder: (context, state) {
          if (state is WeatherEmpty) {
            return Center(child: Text('Please Select a Location'));
          }

          if (state is WeatherLoading) {
            return LoadingIndicator();
          }

          if (state is WeatherLoaded) {
            final weather = state.weather;

            return BlocBuilder<ThemeBloc, ThemeState>(
              builder: (context, themeState) {
                return GradientContainer(
                  color: themeState.color,
                  child: RefreshIndicator(
                    onRefresh: () {
                      BlocProvider.of<WeatherBloc>(context).add(
                        RefreshWeather(city: state.weather.location),
                      );

                      return _refreshCompleter.future;
                    },
                    child: ListView(
                      children: <Widget>[
                        Padding(
                          padding: EdgeInsets.only(top: 100.0),
                          child: Center(
                            child: Location(location: weather.location),
                          ),
                        ),
                        Center(
                          child: LastUpdated(dateTime: weather.lastUpdated),
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(vertical: 50.0),
                          child: Center(
                            child: CombinedWeatherTemperature(
                              weather: weather,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            );
          }

          if (state is WeatherError) {
            return Text(
              'Something went wrong!',
              style: TextStyle(color: Colors.red),
            );
          }

          return Center(child: Text('Please Select a Location'));
        },
      ),
    );
  }
}
