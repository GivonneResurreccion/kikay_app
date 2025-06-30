import 'package:flutter/material.dart';

// Screens folder
import 'package:kikay/screens/splash.dart';
import 'package:kikay/screens/welcome.dart';
import 'package:kikay/screens/terms.dart';
import 'package:kikay/screens/home.dart';
// mag dagdag nalang ng import if mag aadd kayo sa routing

final Map<String, WidgetBuilder> appRoutes = {
  '/': (context) => SplashPage(
    onComplete: () => Navigator.pushNamed(context, '/welcome'),
  ),

  // move to terms page
  '/welcome': (context) => WelcomePage(
    onNext: () => Navigator.pushNamed(context, '/terms'),
  ),

  // move to home page
  '/terms': (context) => TermsPage(
    onNext: () => Navigator.pushNamed(context, '/home'),
  ),


  '/home': (context) => HomePage(
    onNext: () => Navigator.pushNamed(context, '/home'),
  ),

};
