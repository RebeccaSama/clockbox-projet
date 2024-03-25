// ignore_for_file: file_names

import 'package:clockbox_projet/core/commons/login_widget.dart';
import 'package:clockbox_projet/views/voiceNote/voice_note_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:local_auth/local_auth.dart';

class FaceId extends StatefulWidget {
  const FaceId({super.key});

  @override
  State<FaceId> createState() => _FaceIdState();
}

class _FaceIdState extends State<FaceId> {
  final LocalAuthentication _localAuth = LocalAuthentication();

  @override
  Widget build(BuildContext context) {
    return LoginWidget(
      title1: "Authentifiez votre identifiant faciale SVP !",
      title: "Utiliser une autre méthode",
      onPressed: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const VoiceNoteView()),
        );
      },
      child: ElevatedButton(
        onPressed: _authenticate,
        child: SvgPicture.asset(
          'assets/Frame.svg',
          width: 60,
        ),
      ),
    );
  }

  Future<void> _authenticate() async {
    try {
      bool authenticated = await _localAuth.authenticate(
        localizedReason: 'Veuillez utiliser Face ID pour vous authentifier',
      //  biometricOnly: true, // Vous pouvez ajuster cela en fonction de vos besoins
      );

      if (authenticated) {
     
        print('Utilisateur authentifié avec Face ID');
      } else {
        
        print("L'authentification avec Face ID a échoué");
      }
    } catch (e) {
      
      print("Erreur d'authentification avec Face ID: $e");
    }
  }
}
