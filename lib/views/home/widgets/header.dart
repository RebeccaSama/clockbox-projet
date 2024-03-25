import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../core/constants/themes.dart';

class Header extends StatelessWidget {
  const Header({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
                    padding: const EdgeInsets.only(left:16,right: 16, top: 24),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Hello \nJunior-steve',
                          style: GoogleFonts.jetBrainsMono(
                              textStyle: AppTheme.kBigTitle),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 6),
                          child: Text(
                            'Consultez et imprimez vos états de \nprésences en toute simplicitié ici !',
                            maxLines: 2,
                            style: GoogleFonts.jetBrainsMono(
                                textStyle: AppTheme.kBodyText),
                          ),
                        )
                      ],
                    ),
                  );
  }
}