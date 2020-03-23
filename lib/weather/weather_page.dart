import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../common/loading_indicator.dart';
import 'bloc/bloc.dart';
import 'widget/widget.dart';

class WeatherPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: BlocBuilder<WeatherBloc, WeatherState>(
        builder: (context, state) {
          if (state is WeatherEmpty) {
            return Center(child: Text('Please Select a Location'));
          }

          if (state is WeatherLoading) {
            return LoadingIndicator();
          }

          if (state is WeatherLoaded) {
            final weather = state.weather;

            return ListView(
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
