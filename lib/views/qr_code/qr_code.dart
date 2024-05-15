import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mobile_scanner/mobile_scanner.dart';

import '../../core/constants/themes.dart';

class QrCodeView extends StatefulWidget {
  const QrCodeView({Key? key}) : super(key: key);

  @override
  State<QrCodeView> createState() => _QrCodeViewState();
  
}
  String _scanBarcode = 'Unknown';

class _QrCodeViewState extends State<QrCodeView> {

  Future<void> scanQR() async {
    String barcodeScanRes;
    // Platform messages may fail, so we use a try/catch PlatformException.
    try {
      barcodeScanRes = await FlutterBarcodeScanner.scanBarcode(
          '#ff6666', 'Cancel', true, ScanMode.QR);
      print(barcodeScanRes);
    } on PlatformException {
      barcodeScanRes = 'Failed to get platform version.';
    }

    // If the widget was removed from the tree while the asynchronous platform
    // message was in flight, we want to discard the reply rather than calling
    // setState to update our non-existent appearance.
    if (!mounted) return;

    setState(() {
      _scanBarcode = barcodeScanRes;
    });
  }

  final GlobalKey qrKey = GlobalKey(debugLabel: 'QR');
  MobileScannerController cameraController = MobileScannerController();
  bool isFlashOn = false;
  bool isFrontCamera = false;
  
  // @override
  // void reassemble() {
  //   super.reassemble();
  //   if (Platform.isAndroid) {
  //     controller.pauseCamera();
  //   } else if (Platform.isIOS) {
  //     controller.resumeCamera();
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kPrimaryColor,
        leading: const BackButton(
          color: kWhiteColor,
        ),
        actions: [
            IconButton(
              color: Colors.white,
              icon: ValueListenableBuilder(
                valueListenable: cameraController.torchState,
                builder: (context, state, child) {
                  switch (state as TorchState) {
                    case TorchState.off:
                      return const Icon(Icons.flash_off, color: Colors.grey);
                    case TorchState.on:
                      return const Icon(Icons.flash_on, color: Colors.yellow);
                  }
                },
              ),
              iconSize: 32.0,
              onPressed: () => cameraController.toggleTorch(),
            ),
            IconButton(
              color: Colors.white,
              // icon: ValueListenableBuilder(
              //   valueListenable: cameraController.cameraFacingState,
              //   builder: (context, state, child) {
              //     switch (state as CameraFacing) {
              //       case CameraFacing.front:
              //         return const Icon(Icons.camera_front);
              //       case CameraFacing.back:
              //         return const Icon(Icons.camera_rear);
              //     }
              //   },
              // ),
              iconSize: 32.0,
               icon: Icon(Icons.barcode_reader), 
               onPressed: ()=> scanQR()
                  
            ),
          ],
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
                    fontSize: 24,
                    fontWeight: FontWeight.w100,
                  ),
                  color: kBlackColor,
                ),
                children: <TextSpan>[
                  TextSpan(
                    text: ' QR-Code',
                    style: GoogleFonts.jetBrainsMono(
                      textStyle: const TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.w700,
                      ),
                      color: kBlackColor,
                    ),
                  ),
                ],
              ),
            ),
          ),
           Expanded(
            flex: 2,
            child: Stack(
              children: [
                MobileScanner(
          // fit: BoxFit.contain,
          controller: cameraController,
          onDetect: (capture) {
            final List<Barcode> barcodes = capture.barcodes;
            final Uint8List? image = capture.image;
            for (final barcode in barcodes) {
              debugPrint('Barcode found! ${barcode.rawValue}');
            }
          },
        ),
              ],
            ),),

          // Expanded(
          //   flex: 5,
          //   child: QRView(
          //     key: qrKey,
          //     onQRViewCreated: _onQRViewCreated,
          //   ),
          // ),
          Expanded(
            flex: 1,
            child: Center(
              child: Text(
                'En cours de capture ...',
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: GoogleFonts.jetBrainsMono(
                  textStyle: const TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w100,
                  ),
                  color: kBlackColor,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  // void _onQRViewCreated(QRViewController controller) {
  //   this.controller = controller;
  //   controller.scannedDataStream.listen((scanData) {
  //     setState(() {
  //       // Traiter ici le scan du QR code
  //     });
  //   });
  // }

  // @override
  // void dispose() {
  //   controller.dispose();
  //   super.dispose();
  // }
}
