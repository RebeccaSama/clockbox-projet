import 'package:clockbox_projet/views/home/widgets/logo2.dart';
import 'package:clockbox_projet/views/pointage/pointage_view.dart';
import 'package:flutter/material.dart';

import '../../core/constants/themes.dart';
import 'widgets/activites_pointages.dart';
import 'widgets/date_picker.dart';
import 'widgets/header.dart';
import 'widgets/row_title.dart';
import 'widgets/statusHours_widget.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kWhiteColor,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: kPrimaryColor,
        title: const Logo2Widget(),
        actions: [
          Transform.translate(
            offset: const Offset(8, 0),
            child: IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.logout_outlined,
                  color: kLogoColor,
                )),
          ),
          Padding(
            padding: const EdgeInsets.only(right: 6),
            child: IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.more_vert,
                  color: kLogoColor,
                )),
          )
        ],
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
                  Header(),
                  DatePicker(),
                  RetardWidget(),
                  RowTitle(
                    title: 'Vos activités de pointages',
                  ),
                ],
              ),
            ),
            const ActivitesPointages()
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: const Color.fromRGBO(13, 182, 255, 1),
        onPressed: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => const PointageView()));
        },
        child: const Icon(
          Icons.qr_code,
          size: 24,
        ),
      ),
    );
  }
}
