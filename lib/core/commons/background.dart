import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../constants/themes.dart';

class BackgrounWidget extends StatelessWidget {
  const BackgrounWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 2, bottom: 10),
          child: Text(
            'Q',
            style: GoogleFonts.jetBrainsMono(textStyle: AppTheme.kBigbigTitle),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 88),
          child: Transform.translate(
            offset: const Offset(-30, 0),
            child: Text(
              'S',
              style: GoogleFonts.jetBrainsMono(textStyle: AppTheme.kBigbigTitle),
            ),
          ),
        ),
      ],
    );
  }
}
