import 'package:clockbox_projet/core/constants/themes.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Logo2Widget extends StatelessWidget {
  const Logo2Widget({super.key});

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
        text: 'QS-',
        style: GoogleFonts.jetBrainsMono(
            textStyle:
                const TextStyle(fontSize: 16, fontWeight: FontWeight.w700),
            color: const Color.fromRGBO(255, 255, 255, 0.54)),
        children: <TextSpan>[
          TextSpan(
            text: 'Clock',
            style: GoogleFonts.jetBrainsMono(
                textStyle: const TextStyle(
                    fontSize: 16, fontWeight: FontWeight.w700),
                color: kSecondaryColor),
          ),
          TextSpan(
            text: 'Box',
            style: GoogleFonts.jetBrainsMono(
                textStyle: const TextStyle(
                    fontSize: 16, fontWeight: FontWeight.w700),
                color: kWhiteColor),
          ),
        ],
      ),
    );
  }
}
