// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import 'package:clockbox_projet/core/commons/background.dart';

import '../constants/themes.dart';

class LogoContainerWidget extends StatelessWidget {
  const LogoContainerWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: MediaQuery.of(context).size.height * 2.1 / 4,
      decoration: const BoxDecoration(
        color: kPrimaryColor,
      ),
      child: Stack(children: [
        const Stack(
          children: [
            Positioned(bottom: 35, child: BackgrounWidget()),
          ],
        ),
        Positioned(
            top: 330,
            left: 16,
            child: SvgPicture.asset(
              'assets/logo.svg',
              width: 150,
            ))
      ]),
    );
  }
}
