import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../core/constants/themes.dart';

class RowTitle extends StatelessWidget {
  const RowTitle({super.key, required this.title});
  final String title;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 24),
      child: Row(
        children: [
          const Icon(Icons.control_point_duplicate),
          const Gap(12),
          Text(
            title,
            style:
                GoogleFonts.jetBrainsMono(textStyle: AppTheme.kactivityTitle),
          )
        ],
      ),
    );
  }
}
