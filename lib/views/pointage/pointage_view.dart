import 'package:clockbox_projet/core/constants/themes.dart';
// import 'package:clockbox_projet/views/pointage/widgets/buttons_widget.dart';
import 'package:clockbox_projet/views/pointage/widgets/container_widget.dart';
import 'package:clockbox_projet/views/qr_code/qr_code.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';

class PointageView extends StatefulWidget {
  const PointageView({super.key});

  @override
  State<PointageView> createState() => _PointageViewState();
}

class _PointageViewState extends State<PointageView> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        leading: const BackButton(color: kWhiteColor),
        backgroundColor: kPrimaryColor,
        title: Text(
          "Pointage",
          style: GoogleFonts.jetBrainsMono(
              textStyle: const TextStyle(color: kWhiteColor),
              fontSize: 16,
              fontWeight: FontWeight.w500),
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        // mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 40.0),
            child: RichText(
              textAlign: TextAlign.center,
              text: TextSpan(
                text: 'Quel moyen pour',
                style: GoogleFonts.jetBrainsMono(
                    textStyle: const TextStyle(
                        fontSize: 24, fontWeight: FontWeight.w100),
                    color: kBlackColor),
                children: <TextSpan>[
                  TextSpan(
                    text: ' Pointer',
                    style: GoogleFonts.jetBrainsMono(
                        textStyle: const TextStyle(
                            fontSize: 24, fontWeight: FontWeight.w700),
                        color: kBlackColor),
                  ),
                  TextSpan(
                    text: ' votre Présence ?',
                    style: GoogleFonts.jetBrainsMono(
                        textStyle: const TextStyle(
                            fontSize: 24, fontWeight: FontWeight.w100),
                        color: kBlackColor),
                  ),
                ],
              ),
            ),
          ),
          const Gap(80),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              ContainerWidget(
                child: IconButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => QrCodeView()));
                  },
                  icon: const Icon(
                    Icons.qr_code,
                    size: 50,
                  ),
                  color: kLightThirthcolor,
                ),
              ),
              const Gap(24),
              ContainerWidget(
                child: Container(
                  padding: const EdgeInsets.all(24),
                  child: SvgPicture.asset(
                    'assets/Frame.svg',
                    width: 40,
                    color: kLightThirthcolor,
                  ),
                ),
              )
            ],
          ),
          const Gap(24),
          const Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              ContainerWidget(
                child: Icon(
                  Icons.keyboard_voice_sharp,
                  size: 50,
                  color: kLightThirthcolor,
                ),
              ),
              Gap(24),
              ContainerWidget(
                child: Icon(
                  Icons.fingerprint,
                  size: 50,
                  color: kLightThirthcolor,
                ),
              )
            ],
          ),
          // SizedBox(
          //   height: MediaQuery.of(context).size.height * 0.01,
          // ),
          // const ButtonsWidgets()
        ],
      ),
    ));
  }
}
