import 'package:flutter/material.dart';

//Screens folder
import 'package:kikay/screens/splash.dart';
import 'package:kikay/screens/welcome.dart';

final Map<String, WidgetBuilder> appRoutes = {
  '/': (context) => SplashPage(
    onComplete: () => Navigator.pushNamed(context, '/home'),
  ),

  '/home': (context) => WelcomePage(
    onComplete: () => Navigator.pushNamed(context, '/home'),
  ),

  // Add this for the target screen after splash
  //'/home': (context) => homePage(), // replace with your actual screen widget
};
