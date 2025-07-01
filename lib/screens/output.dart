import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'dart:io';

class ImageResultPage extends StatelessWidget {
  final String imagePath; // Path to the uploaded image (asset or file)
  final String skinTone; // e.g., "Fair", "Medium", "Deep"
  final String undertone; // e.g., "Warm", "Cool", "Neutral"

  const ImageResultPage({
    super.key,
    required this.imagePath,
    required this.skinTone,
    required this.undertone,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFDC1768), // <- Background color here
      appBar: AppBar(
        backgroundColor: const Color(0xFFDC1768),
        elevation: 0,
        leading: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Text(
            'Kikay',
            style: const TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.arrow_forward),
            color: Colors.white,
            onPressed: () {
              Navigator.pop(context); // or navigate somewhere else
            },
          ),
        ],
        automaticallyImplyLeading: false,
        toolbarHeight: 60,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 16),
        child: Column(
          children: [
            // Image preview
            Expanded(
              child: Center(
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(12),
                  child: Image.file(
                    // use Image.asset if you're using assets
                    File(imagePath),
                    fit: BoxFit.contain,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 24),

            // Analysis Result
            const Text(
              'Analysis Result',
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            const SizedBox(height: 12),

            // Detected Skin Tone
            Text(
              'Detected Skin Tone: $skinTone',
              style: const TextStyle(fontSize: 18, color: Colors.white),
            ),

            const SizedBox(height: 8),

            // Detected Undertone
            Text(
              'Detected Undertone: $undertone',
              style: const TextStyle(fontSize: 18, color: Colors.white),
            ),
            const SizedBox(height: 24),
          ],
        ),
      ),
    );
  }
}
