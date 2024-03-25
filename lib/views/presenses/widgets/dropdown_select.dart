import 'package:clockbox_projet/core/constants/themes.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';

class DropdownSelect extends StatefulWidget {
  const DropdownSelect({super.key});

  @override
  State<DropdownSelect> createState() => _DropdownSelectState();
}

class _DropdownSelectState extends State<DropdownSelect> {
  final List<String> items = [
    'Arrivee ',
    'En retard',
  ];
  String? selectedValue;

  @override
  Widget build(BuildContext context) {
    return DropdownButtonHideUnderline(
      child: DropdownButton2<String>(
        isExpanded: true,
        hint: Row(
          children: [
            const Gap(8),
            Expanded(
              child: Text(
                items.first,
                style: GoogleFonts.jetBrainsMono(
                    textStyle: const TextStyle(
                        fontWeight: FontWeight.w400,
                        fontSize: 13,
                        color: Color.fromRGBO(0, 0, 0, 0.87))),
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ],
        ),
        items: items
            .map((String item) => DropdownMenuItem<String>(
                  value: item,
                  child: Text(
                    item,
                    style: GoogleFonts.jetBrainsMono(
                        textStyle: const TextStyle(
                            fontWeight: FontWeight.w400,
                            fontSize: 13,
                            color: Color.fromRGBO(0, 0, 0, 0.87))),
                    overflow: TextOverflow.ellipsis,
                  ),
                ))
            .toList(),
        value: selectedValue,
        onChanged: (String? value) {
          setState(() {
            selectedValue = value;
          });
        },
        buttonStyleData: ButtonStyleData(
          height: 56,
          width: 149,
          padding: const EdgeInsets.only(left: 14, right: 14),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            border: Border.all(color: kGreyColor),
          ),
        ),
        iconStyleData: const IconStyleData(
          icon: Icon(
            Icons.arrow_drop_down,
            size: 24,
          ),
        ),
        dropdownStyleData: DropdownStyleData(
          decoration: BoxDecoration(
              color: Colors.white, borderRadius: BorderRadius.circular(8)),
          offset: const Offset(-20, 0),
          scrollbarTheme: ScrollbarThemeData(
            thickness: MaterialStateProperty.all<double>(2),
            thumbVisibility: MaterialStateProperty.all<bool>(true),
          ),
        ),
        menuItemStyleData: const MenuItemStyleData(
          padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
        ),
      ),
    );
  }
}
