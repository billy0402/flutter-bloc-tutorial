import 'package:flutter/material.dart';

import '../../models/weather.dart';

class WeatherConditions extends StatelessWidget {
  final WeatherCondition condition;

  WeatherConditions({Key key, @required this.condition})
      : assert(condition != null),
        super(key: key);

  @override
  Widget build(BuildContext context) => _mapConditionToImage(condition);

  Image _mapConditionToImage(WeatherCondition condition) {
    final String conditionString = condition.toString().split('.').last;
    return Image.asset(
      'assets/images/$conditionString.png',
      width: 100,
      fit: BoxFit.fitWidth,
      alignment: AlignmentDirectional.center,
    );
  }
}
