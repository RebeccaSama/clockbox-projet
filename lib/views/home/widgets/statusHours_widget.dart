// ignore_for_file: file_names

import 'package:clockbox_projet/views/presenses/presenses_view.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tuple/tuple.dart';

import '../../../core/constants/themes.dart';

class RetardWidget extends StatefulWidget {
  const RetardWidget({Key? key}) : super(key: key);

  @override
  State<RetardWidget> createState() => _RetardWidgetState();
}

class _RetardWidgetState extends State<RetardWidget> {
  List<Tuple4> retards = const [
    Tuple4("Retards \ncummulés", Icons.watch_later, "12H", kPrimaryColor),
    Tuple4("jours en \nretard", Icons.date_range, "02Jrs",
        Color.fromRGBO(13, 182, 255, 1)),
    Tuple4("jours  \nd'absence ", Icons.date_range, "03Jrs",
        Color.fromRGBO(121, 116, 126, 1)),
  ];
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => const PresensesView()));
      },
      child: SizedBox(
        height: 100,
        child: ListView.separated(
            scrollDirection: Axis.horizontal,
            shrinkWrap: true,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.only(
                  left: 16,
                ),
                child: Container(
                  padding: const EdgeInsets.all(1),
                  decoration: BoxDecoration(
                      border: Border.all(
                        width: 2,
                        color: retards[index].item4,
                      ),
                      borderRadius: BorderRadius.circular(8)),
                  child: Container(
                    width: 154,
                    height: 100,
                    padding: const EdgeInsets.all(12),
                    decoration: BoxDecoration(
                        color: retards[index].item4,
                        borderRadius: BorderRadius.circular(8)),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              retards[index].item1,
                              style: GoogleFonts.jetBrainsMono(
                                  fontSize: 12,
                                  fontWeight: FontWeight.w300,
                                  color: Colors.white),
                            ),
                            Icon(retards[index].item2,
                                size: 24, color: Colors.white)
                          ],
                        ),
                        Text(
                          retards[index].item3,
                          style: GoogleFonts.jetBrainsMono(
                              fontSize: 24,
                              fontWeight: FontWeight.w800,
                              color: Colors.white),
                        )
                      ],
                    ),
                  ),
                ),
              );
            },
            separatorBuilder: (_, __) {
              return const SizedBox();
            },
            itemCount: retards.length),
      ),
    );
  }
}
