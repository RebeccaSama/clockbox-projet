import 'package:clockbox_projet/views/presenses/widgets/dropdown_select.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class DropdownWidget0 extends StatelessWidget {
  const DropdownWidget0({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.only(left:16,right: 16, top: 24),
      child: Row(
        children: [
          Expanded(child: DropdownSelect()),
          Gap(16),
          Expanded(child: DropdownSelect()),
        ],
      ),
    );
  }
}
