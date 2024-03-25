import 'package:clockbox_projet/core/provider/providers.dart';
import 'package:clockbox_projet/core/utils/custom_text_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

final authControllerProvider =
    ChangeNotifierProvider((ref) => AuthController(ref: ref));

class AuthController extends ChangeNotifier {
  late SupabaseClient supabaseClient;

  final TextEditingController otpController = TextEditingController();
  final TextEditingController numberController = TextEditingController();
  bool acceptTerms = false;
  String countryCode = "CM";
  String phoneCode = "+237";
  final Ref ref;

  late String mask = getMaskFromCode();
  late var phoneController = CustomTextController(mask);
  late MaskTextInputFormatter maskTextInputFormatter =
      MaskTextInputFormatter(mask: getMaskFromCode(pattern: "#"));

  AuthController({required this.ref});

  void toggleAcceptTerms() {
    acceptTerms = !acceptTerms;
    notifyListeners();
  }

  void setCountryCode(String value, String phonePrefix) {
    countryCode = value;
    phoneCode = phonePrefix;
    notifyListeners();
  }

  String getMaskFromCode({String pattern = "X"}) {
    return ref
        .read(phoneMasksProvider)[countryCode]!
        .exampleNumberMobileNational
        .replaceAll("-", " ")
        .replaceAll(RegExp(r'\d'), pattern);
  }

  void changeCountryCode() async {
    mask = getMaskFromCode();
    phoneController = CustomTextController(mask);
    maskTextInputFormatter =
        MaskTextInputFormatter(mask: getMaskFromCode(pattern: "#"));
    notifyListeners();
  }
}
