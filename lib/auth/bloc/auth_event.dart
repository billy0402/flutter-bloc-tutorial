import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

abstract class AuthEvent extends Equatable {
  const AuthEvent();

  @override
  List<Object> get props => [];
}

/// notify the bloc that it needs to check if the user is currently authenticated or not
class AppStarted extends AuthEvent {}

/// notify the bloc that the user has successfully logged in
class LoggedIn extends AuthEvent {
  final String token;

  const LoggedIn({@required this.token});

  @override
  List<Object> get props => [token];

  @override
  String toString() => 'LoggedIn { token: $token }';
}

/// notify the bloc that the user has successfully logged out
class LoggedOut extends AuthEvent {}
