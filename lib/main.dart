import 'package:clockbox_projet/core/provider/providers.dart';
import 'package:clockbox_projet/views/signIn/signIn_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_libphonenumber/flutter_libphonenumber.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Supabase.initialize(
    url: "https://itwbecetcrtesdtoiuww.supabase.co",
    anonKey:
     "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6Iml0d2JlY2V0Y3J0ZXNkdG9pdXd3Iiwicm9sZSI6ImFub24iLCJpYXQiOjE3MDI5ODc5NzYsImV4cCI6MjAxODU2Mzk3Nn0.kWL0-Gv9_7TkiQkMgg66e-gPuYz-ltUmiitKgrKNM6Y",
  );
  await init();
  var phoneMasks = await getAllSupportedRegions();
  print(phoneMasks["CM"]);

  runApp(ProviderScope(
    overrides: [
      phoneMasksProvider.overrideWithValue(phoneMasks),
      //supabaseClientProvider.overrideWithValue(Supabase.instance.client)
    ],
    child: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'ClockBox',
      theme: ThemeData(
        datePickerTheme: DatePickerThemeData(
          surfaceTintColor: Colors.transparent,
          shape: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: const BorderSide(width: 1)),
        ),
        colorScheme: ColorScheme.fromSeed(
            seedColor: const Color.fromRGBO(8, 66, 160, 1)),
        useMaterial3: true,
      ),
      home: const SignInView(),
    );
  }
}


