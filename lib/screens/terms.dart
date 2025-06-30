import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TermsPage extends StatefulWidget {
  final VoidCallback onNext;

  const TermsPage({super.key, required this.onNext});

  @override
  State<TermsPage> createState() => _TermsPageState();
}

class _TermsPageState extends State<TermsPage> {
  bool _agreed = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFE40078),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 40.0, vertical: 32.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Text(
                  'Terms & Conditions',
                  style: GoogleFonts.poppins(
                    fontSize: 32,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),
              const SizedBox(height: 24),

              Text(
                'Before using Kikay, please review the following:\n\n✔ We analyze uploaded images solely for shade matching.\n✔ Your data will be securely stored and used only for improving recommendation accuracy.\n✔ By proceeding, you agree to our Privacy Policy and Terms of Use.',
                style: GoogleFonts.poppins(
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
                textAlign: TextAlign.left,
              ),
              const SizedBox(height: 40),

              CheckboxListTile(
                value: _agreed,
                onChanged: (value) {
                  setState(() {
                    _agreed = value ?? false;
                  });
                },
                controlAffinity: ListTileControlAffinity.leading,
                contentPadding: EdgeInsets.zero,
                title: Text(
                  'Agree to the terms',
                  style: GoogleFonts.poppins(
                    fontSize: 14,
                    color: Colors.white,
                  ),
                ),
                activeColor: Colors.white,
                checkColor: const Color(0xFFE40078),
              ),
              const SizedBox(height: 40),

              Center(
                child: ElevatedButton(
                  onPressed: _agreed ? widget.onNext : null,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.white,
                    elevation: 12,
                    shadowColor: Colors.black,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(40),
                    ),
                    padding: const EdgeInsets.symmetric(
                      horizontal: 80,
                      vertical: 16,
                    ),
                  ),
                  child: Text(
                    "Let's get started",
                    style: GoogleFonts.poppins(
                      color: const Color(0xFFE40078),
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
