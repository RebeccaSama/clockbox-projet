import 'package:clockbox_projet/core/constants/themes.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ButtonsWidgets extends StatelessWidget {
  const ButtonsWidgets({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Container(
          height: 56,
          width: MediaQuery.of(context).size.width * 0.8,
          decoration: const BoxDecoration(
              color: kPrimaryColor,
              borderRadius: BorderRadius.only(
                bottomRight: Radius.circular(8),
                topRight: Radius.circular(8),
              ),
              boxShadow: [
                BoxShadow(
                  color: Color.fromRGBO(0, 0, 0, 0.3),
                  blurRadius: 3,
                  spreadRadius: 0,
                  offset: Offset(0, 1), // Shadow position
                )
              ]),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 24),
                child: IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: const Icon(Icons.arrow_back, color: kWhiteColor),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(right: 110),
                child: Center(
                  child: Text(
                    'Annuler',
                    textAlign: TextAlign.center,
                    style: GoogleFonts.jetBrainsMono(
                        textStyle: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                            color: kWhiteColor)),
                  ),
                ),
              )
            ],
          ),
        ),
        Container(
          height: 56,
          width: 25,
          decoration: const BoxDecoration(
              color: kPrimaryColor,
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(8),
                topLeft: Radius.circular(8),
              ),
              boxShadow: [
                BoxShadow(
                  color: Color.fromRGBO(0, 0, 0, 0.3),
                  blurRadius: 3,
                  spreadRadius: 0,
                  offset: Offset(0, 1), // Shadow position
                )
              ]),
        ),
      ],
    );
  }
}
