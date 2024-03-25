import 'package:flutter/material.dart';

class CustomTextController extends TextEditingController {
  final String maskText;

  CustomTextController(this.maskText);

  @override
  TextSpan buildTextSpan({
    required BuildContext context,
    TextStyle? style,
    required bool withComposing,
  }) {
    return TextSpan(style: style, children: [
      TextSpan(text: text, style: const TextStyle(color: Colors.black)),
      TextSpan(
          text: maskText.substring(text.length),
          style: const TextStyle(color: Colors.black26))
    ]);
  }
}
