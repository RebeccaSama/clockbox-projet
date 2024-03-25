import 'package:flutter/material.dart';
import 'package:flutter_libphonenumber/flutter_libphonenumber.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

final phoneMasksProvider = Provider<Map<String, CountryWithPhoneCode>>((ref) {
  throw UnimplementedError();
});

final localeProvider = StateProvider<Locale?>(
  (ref) => null,
);

final visibleNavBarProvider = StateProvider<bool>(
  (ref) => true,
);
final phoneAuthProvider = Provider<PhoneAuthController>((ref) {
  return PhoneAuthController();
});

class PhoneAuthController {
  TextEditingController phoneNumberController = TextEditingController();
  TextEditingController otpController = TextEditingController();
}

final supabaseClientProvider = Provider<SupabaseClient>((ref) {
  return SupabaseClient(
    "https://itwbecetcrtesdtoiuww.supabase.co",
    "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6Iml0d2JlY2V0Y3J0ZXNkdG9pdXd3Iiwicm9sZSI6ImFub24iLCJpYXQiOjE3MDI5ODc5NzYsImV4cCI6MjAxODU2Mzk3Nn0.kWL0-Gv9_7TkiQkMgg66e-gPuYz-ltUmiitKgrKNM6Y",
  );
});
