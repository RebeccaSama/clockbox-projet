// import 'package:clockbox_projet/core/provider/providers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../core/commons/logoContainer_widget.dart';
import '../../core/constants/themes.dart';
import 'widget/pin_field.dart';


class PinkCodeView extends ConsumerStatefulWidget {
  const PinkCodeView({super.key});

  @override
  ConsumerState<PinkCodeView> createState() => _PinkCodeViewState();
}

class _PinkCodeViewState extends ConsumerState<PinkCodeView> {
  @override
  Widget build(BuildContext context) {
    //  var authController = ref.read(phoneAuthProvider);
    // var supabase = ref.read(supabaseClientProvider);

    Future<void> _signInWithPhoneNumber() async {
      try {
        // Envoyer le code OTP (ajuster le endpoint et le body selon votre configuration Supabase)
        /*var response = await supabase.auth.api
            .signIn(
              phone: authController.phoneNumberController.text,
              password: authController.otpController.text,
              // options: AuthOptions(
              //   redirectTo: 'YOUR_REDIRECT_URL',
              // ),
            )
            .execute();

        if (response.error == null) {
          // Authentification réussie
          print('Authentification réussie');
        } else {
          // Authentification échouée
          print('Authentification échouée: ${response.error?.message}');
        }*/
      } catch (e) {
        // Gérer les erreurs
        print('Erreur lors de l\'authentification: $e');
      }
    }
    return SafeArea(
      child: Scaffold(
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(55.0),
          child: AppBar(
            backgroundColor: kPrimaryColor,
            elevation: 0,
            leading: const BackButton(
              color: kWhiteColor,
            ),
          ),
        ),
        body: CustomScrollView(
          slivers: [
            SliverAppBar(
              automaticallyImplyLeading: false,
              backgroundColor: kPrimaryColor,
              expandedHeight: MediaQuery.of(context).size.height * 2.1 / 4,
              pinned: true,
              flexibleSpace: const FlexibleSpaceBar(
                background: LogoContainerWidget(),
              ),
            ),
            SliverToBoxAdapter(
              child: Container(
                width: double.infinity,
                color: Colors.white,
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(
                          left: 16, right: 16, top: 38, bottom: 20),
                      child: Center(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(
                              'Hello Junior-steve',
                              style: GoogleFonts.jetBrainsMono(
                                  fontWeight: FontWeight.w500,
                                  textStyle: AppTheme.kBigTitle),
                            ),
                            const Gap(6),
                            Center(
                              child: Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 16),
                                child: RichText(
                                    text: TextSpan(
                                        text:
                                            "Veillez renseigner le code OTP qui a été envoyé sur le numéro  ",
                                        style: GoogleFonts.jetBrainsMono(
                                            fontSize: 12,
                                            fontWeight: FontWeight.w100,
                                            height: 2,
                                            color: Colors.black),
                                        children: [
                                      TextSpan(
                                          text: "+237 674053983. ",
                                          style: GoogleFonts.jetBrainsMono(
                                              fontSize: 12,
                                              fontWeight: FontWeight.w500,
                                              color: Colors.black))
                                    ])),
                              ),
                            ),
                            const Gap(22),
                            Text(
                              'Renvoyer le code (Dans 29s)',
                              style: GoogleFonts.jetBrainsMono(
                                  fontWeight: FontWeight.w300,
                                  color: const Color.fromRGBO(48, 80, 131, 1)),
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(height: MediaQuery.of(context).size.height * 0.02),
                    const PinField(),
                    const Gap(13)
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
