import 'package:flare_splash_screen/flare_splash_screen.dart';
import 'package:flutter/material.dart';

import '../home/home_page.dart';

class SplashPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SplashScreen.navigate(
          name: 'assets/Filip.flr',
          next: (_) => HomePage(),
          until: () => Future.delayed(Duration(seconds: 5)),
          startAnimation: 'idle',
        ),
      ),
    );
  }
}
