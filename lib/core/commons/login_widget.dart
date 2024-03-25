import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';

import '../constants/themes.dart';
import 'logoContainer_widget.dart';

class LoginWidget extends StatelessWidget {
  final Widget child;
  final VoidCallback onPressed;
  final String title;
  final String title1;
  const LoginWidget({
    Key? key,
    required this.child,
    required this.onPressed,
    required this.title,
    required this.title1,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          appBar: AppBar(
            backgroundColor: kPrimaryColor,
            leading: const BackButton(
              color: kWhiteColor,
            ),
          ),
          body: Stack(children: [
            Column(children: [
              const LogoContainerWidget(),
              Container(
                width: double.infinity,
                color: Colors.white,
                child: Column(children: [
                  Center(
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          const Gap(40),
                          Text(
                            'Hello Junior-steve',
                            style: GoogleFonts.jetBrainsMono(
                                textStyle: AppTheme.kBigTitle),
                          ),
                          const Gap(16),
                          Text(
                            title1,
                            maxLines: 2,
                            style: GoogleFonts.jetBrainsMono(
                                textStyle: AppTheme.kBodyText),
                          ),
                        ]),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 35),
                    child: child,
                  )
                ]),
              )
            ]),
            Positioned(
                bottom: 12,
                left: 0,
                right: 0,
                child: Material(
                  child: Center(
                      child: TextButton(
                          onPressed: onPressed,
                          child: Text(
                            title,
                            style: const TextStyle(
                                fontWeight: FontWeight.bold,
                                color: kPrimaryColor),
                          ))),
                ))
          ])),
    );
  }
}
