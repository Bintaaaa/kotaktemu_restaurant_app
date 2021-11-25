import 'package:flutter/material.dart';
import 'package:kotaktemu/common/styles.dart';

import 'home_page.dart';


class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);
  static const routeName = '/splash_screen';
  final int _splashScreenDuration = 3;

  @override
  Widget build(BuildContext context) {
    moveToRestaurantListPage() {
      Future.delayed(Duration(seconds: _splashScreenDuration)).then((value) {
        Navigator.pushReplacementNamed(context, HomePage.routeName);
      });
    }

    moveToRestaurantListPage();

    return Scaffold(
      backgroundColor: primaryColor,
        body: Center(
      child: Container(
        width: 300,
        height: 300,
        child: Image.asset('assets/splash.png'),
      ),
    ));
  }
}
