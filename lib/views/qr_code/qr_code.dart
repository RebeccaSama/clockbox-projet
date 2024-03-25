// ignore_for_file: deprecated_member_use

import 'dart:io';

import 'package:clockbox_projet/core/constants/themes.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';

class QrCodeView extends StatefulWidget {
  const QrCodeView({super.key});

  @override
  State<QrCodeView> createState() => _QrCodeViewState();
}

class _QrCodeViewState extends State<QrCodeView> {
  final GlobalKey qrKey = GlobalKey(debugLabel: 'QR');
  Barcode? result;
  QRViewController? controller;

  @override
  void reassemble() {
    super.reassemble();
    if (Platform.isAndroid) {
      controller!.pauseCamera();
    } else if (Platform.isIOS) {
      controller!.resumeCamera();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kPrimaryColor,
        leading: const BackButton(
          color: kWhiteColor,
        ),
      ),
      body: Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(24),
            child: RichText(
              textAlign: TextAlign.center,
              text: TextSpan(
                text: 'Pointer votre \n présence par \n',
                style: GoogleFonts.jetBrainsMono(
                    textStyle: const TextStyle(
                        fontSize: 24, fontWeight: FontWeight.w100),
                    color: kBlackColor),
                children: <TextSpan>[
                  TextSpan(
                    text: ' QR-Code',
                    style: GoogleFonts.jetBrainsMono(
                        textStyle: const TextStyle(
                            fontSize: 24, fontWeight: FontWeight.w700),
                        color: kBlackColor),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            flex: 5,
            child: Padding(
              padding: const EdgeInsets.all(60),
              child: QRView(
                key: qrKey,
                cameraFacing: CameraFacing.back,
                onQRViewCreated: _onQRViewCreated,
              ),
            ),
          ),
          Expanded(
            flex: 1,
            child: Center(
              child: (result != null)
                  ? Text(
                      'Barcode Type: ${describeEnum(result!.format)}   Data: ${result!.code}')
                  : Text('En cours de capture ...',
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: GoogleFonts.jetBrainsMono(
                          textStyle: const TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w100,
                          ),
                          color: kBlackColor)),
            ),
          ),
        ],
      ),
    );
  }

  void _onQRViewCreated(QRViewController controller) {
    this.controller = controller;
    controller.scannedDataStream.listen((scanData) {
      setState(() {
        result = scanData;
      });
    });
  }

  @override
  void dispose() {
    controller?.dispose();
    super.dispose();
  }
}
