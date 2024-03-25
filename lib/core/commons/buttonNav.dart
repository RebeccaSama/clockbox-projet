// ignore_for_file: file_names

import 'package:flutter/material.dart';

import '../constants/themes.dart';

class ButtonNext extends StatelessWidget {
  const ButtonNext({
    Key? key,
    required this.onPressed, 
  }) : super(key: key);
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 63,
      width: 58,
      //padding: const EdgeInsets.all(10),
      decoration: const BoxDecoration(
        color: kPrimaryColor,
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(9),
          topLeft: Radius.circular(9),
        ),
        boxShadow: [
          BoxShadow(
            color: Color.fromRGBO(0, 0, 0, 0.3),
            blurRadius: 3,
            spreadRadius: 0,
            offset: Offset(0, 1),
          )
        ],
      ),
      child: IconButton(
          onPressed: onPressed,
          icon: const Icon(
            Icons.arrow_right_alt,
            color: Colors.white,
          )),
    );
  }
}
