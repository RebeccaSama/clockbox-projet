

import 'package:flutter/material.dart';
import 'package:speech_to_text/speech_to_text.dart';

import '../../core/commons/login_widget.dart';
import '../pinkCode/pinkcode_view.dart';

class VoiceNoteView extends StatefulWidget {
  const VoiceNoteView({Key? key}) : super(key: key);

  @override
  State<VoiceNoteView> createState() => _VoiceNoteViewState();
}

class _VoiceNoteViewState extends State<VoiceNoteView> {
  final SpeechToText _speech = SpeechToText();

  @override
  Widget build(BuildContext context) {
    return LoginWidget(
      title1: "Authentifiez votre voix d'identité SVP !",
      title: 'Utiliser un code OTP',
      onPressed: () async {
         Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const PinkCodeView()),
          );
        // bool voiceAuthenticated = await _authenticateVoice();
        // if (voiceAuthenticated) {
         
        // } else {
        //   // Gérer l'échec d'authentification par la voix
        // }
      },
      child: IconButton(
        onPressed: () {},
        icon: const Icon(
          Icons.keyboard_voice_sharp,
          size: 60,
        ),
        color: const Color.fromRGBO(48, 80, 131, 0.54),
      ),
    );
  }

  Future<bool> _authenticateVoice() async {
    bool isAvailable = await _speech.initialize(
      onStatus: (status) {
        print('Speech recognition status: $status');
      },
      onError: (error) {
        print('Speech recognition error: $error');
      },
    );

    if (isAvailable) {
      // Commencez la reconnaissance vocale
      await _speech.listen(
        onResult: (result) {
          // Traitement du résultat de la reconnaissance vocale
          print('Speech recognition result: $result');
        },
      );

      // Vous pouvez implémenter une logique d'authentification ici
      // Comparer le résultat avec des modèles vocaux enregistrés, etc.

      // Arrêtez la reconnaissance vocale après l'authentification
      await _speech.stop();
      
      return true; // Authentification réussie
    } else {
      print('La reconnaissance vocale n\'est pas disponible');
      return false; // Authentification échouée
    }
  }
}
