// ignore_for_file: file_names
import 'package:clockbox_projet/core/commons/background.dart';
import 'package:clockbox_projet/views/signIn/controller/auth_controller.dart';
import 'package:clockbox_projet/views/signIn/widget/phoneWidget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../core/commons/buttonNav.dart';
import '../../core/constants/themes.dart';
import '../fingerPrint/fingerPrint_view.dart';

class SignInView extends ConsumerStatefulWidget {
  const SignInView({super.key});

  @override
  ConsumerState<SignInView> createState() => _SignInViewState();
}

class _SignInViewState extends ConsumerState<SignInView> {
  @override
  Widget build(BuildContext context) {
    var authController = ref.watch(authControllerProvider);

    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: true,
        body: CustomScrollView(
          slivers: [
            SliverAppBar(
              backgroundColor: kPrimaryColor,
              expandedHeight: MediaQuery.of(context).size.height * 2.4 / 4,
              pinned: true,
              flexibleSpace: FlexibleSpaceBar(
                background: Stack(
                  children: [
                    const Positioned(
                      bottom: 42,
                      child: BackgrounWidget(),
                    ),
                    Positioned(
                      top: 380,
                      left: 16,
                      child: SvgPicture.asset(
                        'assets/logo.svg',
                        width: 150,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SliverToBoxAdapter(
              child: Container(
                width: double.infinity,
                color: kWhiteColor,
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 18,
                        vertical: 38,
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text(
                            'Se Connecter',
                            style: GoogleFonts.jetBrainsMono(
                              textStyle: AppTheme.kBigTitle,
                            ),
                          ),
                          const Gap(14),
                          Text(
                            'Veuillez entrer votre numéro de téléphone valide pour accéder à votre session',
                            maxLines: 2,
                            style: GoogleFonts.jetBrainsMono(
                              textStyle: AppTheme.kBodyText,
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: MediaQuery.of(context).size.height * 0.04),
                    Row(
                      children: [
                        Expanded(
                          child: PhoneField(
                            controller: authController.phoneController,
                            onChanged: (_) => setState(() {}),
                          ),
                        ),
                        const Gap(16.0),
                        ButtonNext(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const FingerPrint(),
                              ),
                            );
                          },
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
