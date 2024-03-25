import 'dart:convert';
import 'package:crypto/crypto.dart';
import 'package:flutter/material.dart';
import 'package:clockbox_projet/core/commons/login_widget.dart';
import 'package:clockbox_projet/views/faceId/faceId_view.dart';
import 'package:local_auth/local_auth.dart';
import 'package:supabase/supabase.dart';

class FingerPrint extends StatefulWidget {
  const FingerPrint({Key? key}) : super(key: key);

  @override
  State<FingerPrint> createState() => _FingerPrintState();
}

class _FingerPrintState extends State<FingerPrint> {
  final LocalAuthentication _localAuth = LocalAuthentication();
  final supabase = SupabaseClient(
    'https://itwbecetcrtesdtoiuww.supabase.co',
    'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6Iml0d2JlY2V0Y3J0ZXNkdG9pdXd3Iiwicm9sZSI6ImFub24iLCJpYXQiOjE3MDI5ODc5NzYsImV4cCI6MjAxODU2Mzk3Nn0.kWL0-Gv9_7TkiQkMgg66e-gPuYz-ltUmiitKgrKNM6Y',
  );

  @override
  Widget build(BuildContext context) {
    return LoginWidget(
      title1: "Authentifiez votre empreinte digitale SVP ! ",
      title: "Utiliser une autre méthode",
      onPressed: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const FaceId()),
        );
      },
      child: IconButton(
        icon: const Icon(Icons.fingerprint),
        iconSize: 60,
        color: const Color.fromRGBO(48, 80, 131, 0.54),
        onPressed: _authenticate,
      ),
    );
  }

  Future<void> _authenticate() async {
    try {
      setState(() {});

      bool authenticated = await _localAuth.authenticate(
        localizedReason:
            'Veuillez scanner votre empreinte digitale pour vous authentifier',
      );

      if (authenticated) {
        // Récupérer l'empreinte (vous devrez ajuster cette partie selon votre application)
        String fingerprint = 'empreinte_a_recuperer';

        // Appeler la fonction pour stocker l'empreinte dans la base de données
        await storeHashedFingerprint('userId', fingerprint);

        setState(() {});
      } else {
        setState(() {});
      }
    } catch (e) {
      setState(() {});
    }
  }

  Future<void> storeHashedFingerprint(String userId, String fingerprint) async {
    try {
      // Hasher l'empreinte (vous devrez utiliser une bibliothèque de hachage appropriée)
      final hashedFingerprint =
          sha256.convert(utf8.encode(fingerprint)).toString();

      // Insérer l'empreinte dans la table Supabase
      final response = await supabase.from('nom_de_votre_table').upsert([
        {
          'user_id': userId,
          'hashed_fingerprint': hashedFingerprint,
        },
      ]);

      if (response.error != null) {
        print('Error storing fingerprint: ${response.error}');
      } else {
        print('Fingerprint stored successfully');
      }
    } catch (e) {
      print('Error storing fingerprint: $e');
    }
  }
}
