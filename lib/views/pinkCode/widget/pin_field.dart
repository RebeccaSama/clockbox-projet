import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:pinput/pinput.dart';

import '../../../core/commons/buttonNav.dart';
import '../../../core/constants/themes.dart';
import '../../success/success_view.dart';

class PinField extends StatelessWidget {
  final void Function(String)? onChanged;
  const PinField({Key? key, this.onChanged}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Container(
          height: 65,
          width: 28,
          decoration: const BoxDecoration(
              color: kPrimaryColor,
              borderRadius: BorderRadius.only(
                bottomRight: Radius.circular(8),
                topRight: Radius.circular(8),
              ),
              boxShadow: [
                BoxShadow(
                  color: Color.fromRGBO(0, 0, 0, 0.3),
                  blurRadius: 3,
                  spreadRadius: 0,
                  offset: Offset(0, 1), 
                )
              ]),
        ),
        Expanded(
          flex: 2,
          child: Pinput(
            onChanged: onChanged,
            autofocus: false,
            length: 4,
            showCursor: false,
            inputFormatters: [FilteringTextInputFormatter.digitsOnly],
            defaultPinTheme: PinTheme(
                textStyle:
                    const TextStyle(fontSize: 14, fontWeight: FontWeight.w600),
                width: 65,
                height: 65,
                decoration: BoxDecoration(
                  border: Border.all(color: const Color.fromRGBO(0, 0, 0, 0.12)),
                  borderRadius: BorderRadius.circular(8),
                )),
            focusedPinTheme: PinTheme(
                textStyle:
                    const TextStyle(fontSize: 14, fontWeight: FontWeight.w600),
                width: 65,
                height: 65,
                decoration: BoxDecoration(
                  border: Border.all(color: const Color.fromRGBO(0, 0, 0, 0.12)),
                  borderRadius: BorderRadius.circular(8),
                )),
            submittedPinTheme: PinTheme(
                textStyle:
                    const TextStyle(fontSize: 14, fontWeight: FontWeight.w600),
                width: 59,
                height: 59,
                decoration: BoxDecoration(
                  border: Border.all(width: 2),
                  borderRadius: BorderRadius.circular(8),
                )),
            pinputAutovalidateMode: PinputAutovalidateMode.disabled,
          ),
        ),
        ButtonNext(
          onPressed: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => const SuccessView()));
          },
        )
      ],
    );
  }
}
