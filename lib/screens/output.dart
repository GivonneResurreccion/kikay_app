import 'package:flutter/material.dart';
import 'dart:io';

class ImageResultPage extends StatelessWidget {
  final String imagePath;
  final String skinTone;
  final String undertone;

  const ImageResultPage({
    super.key,
    required this.imagePath,
    required this.skinTone,
    required this.undertone,
  });

  @override
  Widget build(BuildContext context) {
    // Debugging output
    debugPrint('Image path: $imagePath');
    final isAsset = imagePath.startsWith('assets/');
    final fileExists = isAsset ? true : File(imagePath).existsSync();
    debugPrint('File exists: $fileExists');

    return Scaffold(
      backgroundColor: const Color(0xFFDC1768),
      appBar: AppBar(
        backgroundColor: const Color(0xFFDC1768),
        elevation: 0,
        leading: Padding(
          padding: const EdgeInsets.all(10.0),
          child: const Text(
            'Kikay',
            style: TextStyle(
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
            onPressed: () => Navigator.pop(context),
          ),
        ],
        automaticallyImplyLeading: false,
        toolbarHeight: 60,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 16),
        child: Column(
          children: [
            // Image preview with error handling
            Expanded(
              child: Center(
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    color: Colors.black.withAlpha(2),
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(12),
                    child: isAsset
                        ? Image.asset(
                            imagePath,
                            fit: BoxFit.contain,
                            errorBuilder: (_, __, ___) => _buildErrorWidget(),
                          )
                        : fileExists
                        ? Image.file(
                            File(imagePath),
                            fit: BoxFit.contain,
                            errorBuilder: (_, __, ___) => _buildErrorWidget(),
                          )
                        : _buildErrorWidget(),
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

  Widget _buildErrorWidget() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Icon(Icons.error_outline, size: 50, color: Colors.white),
          const SizedBox(height: 10),
          Text(
            'Could not load image',
            style: TextStyle(fontSize: 16, color: Colors.white.withAlpha(8)),
          ),
        ],
      ),
    );
  }
}
