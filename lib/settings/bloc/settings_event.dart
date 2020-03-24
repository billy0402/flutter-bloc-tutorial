import 'package:equatable/equatable.dart';

abstract class SettingsEvent extends Equatable {}

class TemperatureUnitToggled extends SettingsEvent {
  @override
  List<Object> get props => [];
}
