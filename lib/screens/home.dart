import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HomePage extends StatefulWidget {
  final VoidCallback onNext;

  const HomePage({super.key, required this.onNext});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
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
                  color: const Color(0xFFF1E4F3),
                ),
              ),
            ),

            // Centered main content
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
                      Text(
                        'Step-by-Step Guide',
                        style: GoogleFonts.poppins(
                          fontSize: 28,
                          fontWeight: FontWeight.w600,
                          fontStyle: FontStyle.italic,
                          color: const Color(0xFFF1E4F3),
                        ),
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(height: 25),

                      Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          'Step 1: Upload your image',
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

                      _buildRoundedButton(
                        label: 'Camera',
                        icon: Icons.camera_alt,
                        onPressed: widget.onNext,
                      ),

                      const SizedBox(height: 20),

                      Text(
                        'or',
                        style: GoogleFonts.poppins(
                          fontSize: 14,
                          fontStyle: FontStyle.italic,
                          color: const Color(0xFF372623),
                        ),
                      ),

                      const SizedBox(height: 20),

                      _buildRoundedButton(
                        label: 'Gallery',
                        icon: Icons.image,
                        onPressed: widget.onNext,
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
}
