import 'package:clockbox_projet/core/constants/themes.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';

class ActivitesPointages extends StatelessWidget {
  const ActivitesPointages({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color.fromRGBO(8, 66, 160, 0.08),
      child: Padding(
        padding: const EdgeInsets.only(left: 16, right: 16, top: 16),
        child: ListView.separated(
          physics: const NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          itemBuilder: (context, index) {
            return Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      height: 64,
                      padding: const EdgeInsets.all(12),
                      width: 64,
                      decoration: BoxDecoration(
                        border: Border.all(width: 1, color: kPrimaryColor),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Center(
                          child: RichText(
                        text: TextSpan(
                          text: 'Lun',
                          style: GoogleFonts.jetBrainsMono(
                              textStyle: const TextStyle(
                                  fontSize: 10, fontWeight: FontWeight.w700),
                              color: kPrimaryColor),
                          children: <TextSpan>[
                            TextSpan(
                              text: '04',
                              style: GoogleFonts.jetBrainsMono(
                                fontSize: 16,
                                fontWeight: FontWeight.w700,
                                color: kPrimaryColor,
                              ),
                            ),
                            TextSpan(
                              text: '12/23',
                              style: GoogleFonts.jetBrainsMono(
                                  textStyle: const TextStyle(
                                      fontSize: 10,
                                      fontWeight: FontWeight.w700),
                                  color: kPrimaryColor),
                            ),
                          ],
                        ),
                      )),
                    ),
                    const Gap(12),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Icon(
                              index % 2 == 0
                                  ? Icons.fingerprint
                                  : Icons.qr_code,
                              size: 24,
                              color: const Color.fromRGBO(48, 80, 131, 0.54),
                            ),
                            const Gap(10),
                            Text(
                              '09H 41min 12sec',
                              style: GoogleFonts.jetBrainsMono(
                                fontSize: 12,
                                fontWeight: FontWeight.w700,
                                color: Colors.black,
                              ),
                            ),
                          ],
                        ),
                        const Gap(4),
                        Text(
                          'QR-Code Bonamoussadi Sable',
                          style: GoogleFonts.jetBrainsMono(
                            fontSize: 10,
                            fontWeight: FontWeight.w300,
                            color: Colors.black,
                          ),
                        ),
                        const Gap(4),
                        Text(
                          'Retard : 41min',
                          style: GoogleFonts.jetBrainsMono(
                            fontSize: 12,
                            fontWeight: FontWeight.w700,
                            color: kRedColor,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                Icon(Icons.keyboard_arrow_right, size: 24, color: kSecondaryColor),
              ],
            );
          },
          separatorBuilder: (_, __) {
            return const Column(
              children: [
                Gap(10),
                Divider(
                  height: 1,
                  thickness: 1,
                  color: Color.fromRGBO(48, 80, 131, 0.08),
                ),
                Gap(10),
              ],
            );
          },
          itemCount: 10,
        ),
      ),
    );
  }
}
