import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class WelcomePage extends StatefulWidget {
  final VoidCallback onComplete;

  const WelcomePage({super.key, required this.onComplete});

  @override
  State<WelcomePage> createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
  @override
  void initState() {
    super.initState();
    // Set up the timer (e.g., 3 seconds)
    Timer(const Duration(seconds: 3), widget.onComplete);
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Color(0xFFE40078), // Hot pink background
      body: Center(

        // bold text
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              'Welcome to',
              style: TextStyle(
                fontSize: 24,
                fontStyle: FontStyle.italic,
                fontWeight: FontWeight.normal,
                color: Colors.white,
                fontFamily: 'Poppins',
              ),
            ),


            Text(
              'Kikay!',
              style: TextStyle(
                fontSize: 64,
                fontWeight: FontWeight.bold,
                color: Colors.white,
                fontFamily: 'Poppins',
              ),
            ),

            Text(
              'Finding the right makeup shade has never been easier. Our AI-powered system detects your skin tone and undertone to recommend the most flattering makeup shades—no more guessing, just perfect matches!!',
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.bold,
                color: Colors.white,
                fontFamily: 'Poppins',
              ),
            ),

          ],
        ),




      ),
    );
  }
}
