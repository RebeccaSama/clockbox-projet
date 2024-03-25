import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../core/commons/logoContainer_widget.dart';
import '../../core/constants/themes.dart';
import '../home/home_view.dart';

class SuccessView extends StatefulWidget {
  const SuccessView({super.key});

  @override
  State<SuccessView> createState() => _SuccessViewState();
}

class _SuccessViewState extends State<SuccessView> {
  @override
  void initState() {
    super.initState();
    Timer(
        const Duration(seconds: 3),
        () => Navigator.pushReplacement(context,
            MaterialPageRoute(builder: (context) => const HomeView())));
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: kPrimaryColor,
          automaticallyImplyLeading: false,
        ),
        body: Column(
          children: [
            const LogoContainerWidget(),
            const Gap(12),
            Container(
              width: double.infinity,
              color: kWhiteColor,
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Center(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        'Connexion réussie',
                        style: GoogleFonts.jetBrainsMono(
                            textStyle: AppTheme.kBigTitle,
                            color: kPrimaryColor),
                      ),
                      const Gap(16),
                      Text(
                        'Vous serez redirigé vers votre tableau de bord',
                        maxLines: 2,
                        style: GoogleFonts.jetBrainsMono(
                            textStyle: AppTheme.kBodyText),
                      ),
                      SizedBox(
                          height: MediaQuery.of(context).size.height * 0.07),
                      Center(
                          child: TweenAnimationBuilder<double>(
                        tween: Tween<double>(begin: 0, end: 1),
                        duration: const Duration(seconds: 3),
                        builder: (BuildContext context, double scaleValue,
                            Widget? child) {
                          double bounceValue =
                              Curves.elasticOut.transform(scaleValue);
        
                          return Transform.scale(
                            scale: bounceValue,
                            child: TweenAnimationBuilder<double>(
                              tween: Tween<double>(begin: 0, end: 2),
                              duration: const Duration(seconds: 1),
                              builder: (BuildContext context,
                                  double rotateValue, Widget? child) {
                                return Transform.rotate(
                                  angle: rotateValue * 2 * 3.141592,
                                  child: SvgPicture.asset(
                                    'assets/Check_circle.svg',
                                    width: 100,
                                  ),
                                );
                              },
                            ),
                          );
                        },
                      ))
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
