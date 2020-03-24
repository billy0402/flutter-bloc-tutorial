import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

enum TemperatureUnit { fahrenheit, celsius }

class SettingsState extends Equatable {
  final TemperatureUnit temperatureUnit;

  const SettingsState({@required this.temperatureUnit})
      : assert(temperatureUnit != null);

  @override
  List<Object> get props => [temperatureUnit];
}
