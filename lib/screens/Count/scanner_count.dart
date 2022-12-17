import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:mobile_scanner/mobile_scanner.dart';

import '../../const/color.dart';

class CountOrderScanner extends StatefulWidget {
  String? barcode;
  CountOrderScanner({super.key, required this.barcode});

  @override
  State<CountOrderScanner> createState() => _CountOrderScannerState();
}

class _CountOrderScannerState extends State<CountOrderScanner> {
  MobileScannerController cameraController = MobileScannerController();
  bool _screenOpened = false;
  // bool torch = false;
  bool hasflashlight = false;
  bool isturnon = false;

  // final player = AudioPlayer(); barcode open

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    cameraController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var hi = MediaQuery.of(context).size.height;

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text(
            "Barcode Scanner",
            style: TextStyle(
              fontSize: 23,
              fontWeight: FontWeight.bold,
            ),
          ),
          actions: [
            IconButton(
              color: Colors.white,
              onPressed: () {
                cameraController.toggleTorch();
              },
              icon: ValueListenableBuilder(
                valueListenable: cameraController.torchState,
                builder: (context, value, child) {
                  switch (value as TorchState) {
                    case TorchState.off:
                      return const Icon(
                        Icons.flash_off,
                        color: Colors.grey,
                      );
                    case TorchState.on:
                      return const Icon(
                        Icons.flash_on,
                        color: Colors.white,
                      );
                  }
                },
              ),
            ),
            IconButton(
              onPressed: () {
                cameraController.switchCamera();
              },
              iconSize: 32,
              icon: ValueListenableBuilder(
                valueListenable: cameraController.cameraFacingState,
                builder: (context, value, child) {
                  switch (value as CameraFacing) {
                    case CameraFacing.back:
                      return const Icon(
                        Icons.camera_rear,
                        color: Colors.grey,
                      );
                    case CameraFacing.front:
                      return const Icon(
                        Icons.camera_front,
                        color: Colors.white,
                      );
                  }
                },
              ),
            ),
          ],
          backgroundColor: CustomColor.yellow,
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              height: 200,
              width: 400,
              child: MobileScanner(
                allowDuplicates: false,
                controller: cameraController,
                onDetect: _getQRcode,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> _getQRcode(Barcode qrCode, MobileScannerArguments? args) async {
    // TorchState val = cameraController.torchState as TorchState;

    if (!_screenOpened) {
      String code = qrCode.rawValue.toString().trim();
      AudioPlayer().play(AssetSource("audio/scanner.mp3"));
      print("QRcode Fount -->$code");

      _screenOpened = true;
      cameraController.dispose();
    }
  }
}

class CountOrderLineScanner extends StatefulWidget {
  String? barcode;
  CountOrderLineScanner({super.key, required this.barcode});

  @override
  State<CountOrderLineScanner> createState() => _CountOrderLineScannerState();
}

class _CountOrderLineScannerState extends State<CountOrderLineScanner> {
  MobileScannerController cameraController = MobileScannerController();
  bool _screenOpened = false;
  // bool torch = false;
  bool hasflashlight = false;
  bool isturnon = false;

  // final player = AudioPlayer(); barcode open

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    cameraController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var hi = MediaQuery.of(context).size.height;

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text(
            "Barcode Scanner",
            style: TextStyle(
              fontSize: 23,
              fontWeight: FontWeight.bold,
            ),
          ),
          actions: [
            IconButton(
              color: Colors.white,
              onPressed: () {
                cameraController.toggleTorch();
              },
              icon: ValueListenableBuilder(
                valueListenable: cameraController.torchState,
                builder: (context, value, child) {
                  switch (value as TorchState) {
                    case TorchState.off:
                      return const Icon(
                        Icons.flash_off,
                        color: Colors.grey,
                      );
                    case TorchState.on:
                      return const Icon(
                        Icons.flash_on,
                        color: Colors.white,
                      );
                  }
                },
              ),
            ),
            IconButton(
              onPressed: () {
                cameraController.switchCamera();
              },
              iconSize: 32,
              icon: ValueListenableBuilder(
                valueListenable: cameraController.cameraFacingState,
                builder: (context, value, child) {
                  switch (value as CameraFacing) {
                    case CameraFacing.back:
                      return const Icon(
                        Icons.camera_rear,
                        color: Colors.grey,
                      );
                    case CameraFacing.front:
                      return const Icon(
                        Icons.camera_front,
                        color: Colors.white,
                      );
                  }
                },
              ),
            ),
          ],
          backgroundColor: CustomColor.yellow,
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              height: 200,
              width: 400,
              child: MobileScanner(
                allowDuplicates: false,
                controller: cameraController,
                onDetect: _getQRcode,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> _getQRcode(Barcode qrCode, MobileScannerArguments? args) async {
    // TorchState val = cameraController.torchState as TorchState;

    if (!_screenOpened) {
      String code = qrCode.rawValue.toString().trim();
      AudioPlayer().play(AssetSource("audio/scanner.mp3"));
      print("QRcode Fount -->$code");

      _screenOpened = true;
      cameraController.dispose();
    }
  }
}
