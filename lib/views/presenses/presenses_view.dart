import 'package:clockbox_projet/views/home/widgets/activites_pointages.dart';
import 'package:clockbox_projet/views/home/widgets/date_picker.dart';
import 'package:clockbox_projet/views/home/widgets/row_title.dart';
import 'package:clockbox_projet/views/presenses/widgets/dropdown_widget.dart';
// import 'package:clockbox_projet/views/home/widgets/statusHours_widget.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../core/constants/themes.dart';

class PresensesView extends StatefulWidget {
  const PresensesView({super.key});

  @override
  State<PresensesView> createState() => _PresensesViewState();
}

class _PresensesViewState extends State<PresensesView> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: kWhiteColor,
        appBar: AppBar(
          leading: const BackButton(color: kWhiteColor),
          backgroundColor: kPrimaryColor,
          title: Text(
            "Presenses",
            style: GoogleFonts.jetBrainsMono(
                textStyle: const TextStyle(color: kWhiteColor),
                fontSize: 16,
                fontWeight: FontWeight.w500),
          ),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                width: double.infinity,
                color: Colors.white,
                child: const Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    DropdownWidget0(),
                    DatePicker(),
                    // RetardWidget(),
                    RowTitle(
                      title: '04 activités trouvées',
                    ),
                  ],
                ),
              ),
              const Gap(14),
              const ActivitesPointages()
            ],
          ),
        ),
      ),
    );
  }
}
