import 'package:flutter/material.dart';
import 'package:kikay/screens/splash.dart';
import 'package:kikay/screens/welcome.dart';
import 'package:kikay/screens/terms.dart';
import 'package:kikay/screens/home.dart';
import 'package:kikay/screens/camera.dart';
import 'package:kikay/screens/result.dart';
import 'package:kikay/screens/preferences.dart';

import 'main.dart';

/// Static routes without arguments
final Map<String, WidgetBuilder> appRoutes = {
  '/': (context) =>
      SplashPage(onComplete: () => Navigator.pushNamed(context, '/welcome')),
  '/welcome': (context) =>
      WelcomePage(onNext: () => Navigator.pushNamed(context, '/terms')),
  '/terms': (context) =>
      TermsPage(onNext: () => Navigator.pushNamed(context, '/home')),
  '/home': (context) =>
      HomePage(onNext: () => Navigator.pushNamed(context, '/camera')),
  '/camera': (context) => CameraScreen(cameras: cameras),
  '/preferences': (context) => const PreferencesPage(),
};

/// Dynamic route generator for routes with arguments (like passing image path)
Route<dynamic>? generateRoute(RouteSettings settings) {
  switch (settings.name) {
    case '/result':
      final imagePath = settings.arguments as String?;
      if (imagePath == null) {
        return _errorRoute("Missing image path for ResultPage.");
      }
      return MaterialPageRoute(
        builder: (context) => ResultPage(imagePath: imagePath),
      );

    default:
      return _errorRoute("Route not found: ${settings.name}");
  }
}

/// Error page fallback
Route<dynamic> _errorRoute(String message) {
  return MaterialPageRoute(
    builder: (context) => Scaffold(
      backgroundColor: Colors.pink[50],
      appBar: AppBar(title: const Text("Error")),
      body: Center(child: Text(message, style: const TextStyle(fontSize: 18))),
    ),
  );
}
