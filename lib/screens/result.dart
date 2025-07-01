import 'dart:io';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ResultPage extends StatelessWidget {
  final String imagePath;

  const ResultPage({super.key, required this.imagePath});

  @override
  Widget build(BuildContext context) {
    // Verify the file exists
    final file = File(imagePath);
    final fileExists = file.existsSync();

    return Scaffold(
      backgroundColor: const Color(0xFFF4BBD3),
      body: SafeArea(
        child: Stack(
          children: [
            // Kikay label in top-left
            Positioned(
              top: 20,
              left: 25,
              child: Text(
                'Kikay',
                style: GoogleFonts.poppins(
                  fontSize: 24,
                  fontWeight: FontWeight.w600,
                  fontStyle: FontStyle.italic,
                  color: const Color(0xFFDC1768),
                ),
              ),
            ),

            // Main content
            Center(
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 25,
                  vertical: 20,
                ),
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const SizedBox(height: 80),

                      // Step title
                      Text(
                        'Step-by-Step Guide',
                        style: GoogleFonts.poppins(
                          fontSize: 28,
                          fontWeight: FontWeight.w600,
                          fontStyle: FontStyle.italic,
                          color: const Color(0xFFDC1768),
                        ),
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(height: 25),

                      // Step instruction
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          'Step 1: Upload Your Image',
                          style: GoogleFonts.poppins(
                            fontSize: 15,
                            fontWeight: FontWeight.w600,
                            fontStyle: FontStyle.italic,
                            color: const Color(0xFF372623),
                          ),
                        ),
                      ),
                      const SizedBox(height: 6),

                      Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          'Snap a new photo or select one from your gallery. Ensure good lighting for the most accurate results.',
                          style: GoogleFonts.poppins(
                            fontSize: 13,
                            fontStyle: FontStyle.italic,
                            color: const Color(0xFF372623),
                          ),
                        ),
                      ),
                      const SizedBox(height: 28),

                      // Camera button
                      _buildRoundedButton(
                        label: 'Camera',
                        icon: Icons.camera_alt,
                        onPressed: () {
                          Navigator.pushNamed(context, '/camera');
                        },
                      ),
                      const SizedBox(height: 20),

                      // or text
                      Text(
                        'or',
                        style: GoogleFonts.poppins(
                          fontSize: 14,
                          fontStyle: FontStyle.italic,
                          color: const Color(0xFF372623),
                        ),
                      ),
                      const SizedBox(height: 20),

                      // Gallery button (to be implemented)
                      _buildRoundedButton(
                        label: 'Gallery',
                        icon: Icons.image,
                        onPressed: () {},
                      ),
                      const SizedBox(height: 28),

                      // Captured image with error handling
                      Container(
                        width: 300,
                        height: 400,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: Colors.grey[200],
                        ),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(20),
                          child: fileExists
                              ? Image.file(
                                  file,
                                  width: 300,
                                  height: 400,
                                  fit: BoxFit.cover,
                                  errorBuilder: (context, error, stackTrace) {
                                    return _buildErrorPlaceholder();
                                  },
                                )
                              : _buildErrorPlaceholder(),
                        ),
                      ),
                      const SizedBox(height: 30),

                      // Next button with image path passing
                      GestureDetector(
                        onTap: () {
                          if (fileExists) {
                            Navigator.pushNamed(
                              context,
                              '/preferences',
                              arguments: imagePath, // Pass the image path
                            );
                          } else {
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content: Text(
                                  'Please capture a valid image first',
                                  style: GoogleFonts.poppins(),
                                ),
                              ),
                            );
                          }
                        },
                        child: Container(
                          width: double.infinity,
                          alignment: Alignment.center,
                          padding: const EdgeInsets.symmetric(vertical: 16),
                          margin: const EdgeInsets.only(top: 10),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(30),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withAlpha(10),
                                offset: const Offset(0, 4),
                                blurRadius: 6,
                              ),
                            ],
                          ),
                          child: Text(
                            'Next',
                            style: GoogleFonts.poppins(
                              fontSize: 20,
                              fontWeight: FontWeight.w600,
                              fontStyle: FontStyle.italic,
                              color: const Color(0xFFDC1768),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildRoundedButton({
    required String label,
    required IconData icon,
    required VoidCallback onPressed,
  }) {
    return ElevatedButton.icon(
      onPressed: onPressed,
      icon: Icon(icon, color: const Color(0xFFDC1768)),
      label: Text(
        label,
        style: GoogleFonts.poppins(
          fontSize: 16,
          fontWeight: FontWeight.w600,
          color: const Color(0xFFDC1768),
        ),
      ),
      style: ElevatedButton.styleFrom(
        backgroundColor: const Color(0xFFF1E4F3),
        elevation: 6,
        shadowColor: Colors.black.withAlpha(30),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
        padding: const EdgeInsets.symmetric(horizontal: 100, vertical: 14),
      ),
    );
  }

  Widget _buildErrorPlaceholder() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Icon(Icons.error_outline, size: 50, color: Colors.red),
        const SizedBox(height: 10),
        Text(
          'Image not available',
          style: GoogleFonts.poppins(fontSize: 16, color: Colors.red),
        ),
      ],
    );
  }
}
