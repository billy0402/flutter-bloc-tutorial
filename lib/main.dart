import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart' as http;
import 'package:meta/meta.dart';

import 'api/weather_api_client.dart';
import 'api/weather_repository.dart';
import 'auth/bloc/auth_bloc.dart';
import 'auth/bloc/auth_event.dart';
import 'auth/bloc/bloc.dart';
import 'auth/user_repository.dart';
import 'common/loading_indicator.dart';
import 'home/home_page.dart';
import 'login/login_page.dart';
import 'splash/splash_page.dart';
import 'utils/simple_bloc_delegate.dart';
import 'weather/bloc/bloc.dart';

void main() {
  BlocSupervisor.delegate = SimpleBlocDelegate();

  final UserRepository userRepository = UserRepository();
  final WeatherRepository weatherRepository = WeatherRepository(
    weatherApiClient: WeatherApiClient(
      httpClient: http.Client(),
    ),
  );

  runApp(BlocProvider<AuthBloc>(
    create: (context) {
      return AuthBloc(userRepository: userRepository)..add(AppStarted());
    },
    child: App(
      userRepository: userRepository,
      weatherRepository: weatherRepository,
    ),
  ));
}

class App extends StatelessWidget {
  final UserRepository userRepository;
  final WeatherRepository weatherRepository;

  App({
    Key key,
    @required this.userRepository,
    @required this.weatherRepository,
  })  : assert(weatherRepository != null),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Bloc Tutorial',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        scaffoldBackgroundColor: Colors.grey[500],
      ),
      home: BlocBuilder<AuthBloc, AuthState>(
        builder: (context, state) {
          if (state is AuthUninitialized) {
            return SplashPage();
          }
          if (state is AuthAuthenticated) {
            return BlocProvider(
              create: (context) =>
                  WeatherBloc(weatherRepository: weatherRepository),
              child: HomePage(),
            );
          }
          if (state is AuthUnauthenticated) {
            return LoginPage(userRepository: userRepository);
          }
          if (state is AuthLoading) {
            return LoadingIndicator();
          }

          return LoginPage(userRepository: userRepository);
        },
      ),
    );
  }
}
