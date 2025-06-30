import 'package:flutter/material.dart';

//Screens folder
import 'package:kikay/screens/splash.dart';
import 'package:kikay/screens/welcome.dart';
import 'package:kikay/screens/terms.dart';

final Map<String, WidgetBuilder> appRoutes = {
  '/': (context) => SplashPage(
    onComplete: () => Navigator.pushNamed(context, '/welcome'),
  ),

  '/welcome': (context) => WelcomePage(
    onNext: () => Navigator.pushNamed(context, '/terms'),
  ),

  '/terms': (context) => TermsPage(
    onNext: () => Navigator.pushNamed(context, '/home'),
  ),

};
