import 'package:equatable/equatable.dart';

abstract class AuthState extends Equatable {
  @override
  List<Object> get props => [];
}

/// waiting to see if the user is authenticated or not on app start
class AuthUninitialized extends AuthState {}

/// waiting to persist/delete a token
class AuthAuthenticated extends AuthState {}

/// successfully authenticated
class AuthUnauthenticated extends AuthState {}

/// not authenticated
class AuthLoading extends AuthState {}
