import 'package:flutter/material.dart';
import 'package:mobile_scanner/mobile_scanner.dart';
import 'package:wearhouse/const/color.dart';

import 'package:audioplayers/audioplayers.dart';

class BarcodeScanner extends StatefulWidget {
  const BarcodeScanner({
    super.key,
  });

  @override
  State<BarcodeScanner> createState() => _BarcodeScannerState();
}

class _BarcodeScannerState extends State<BarcodeScanner> {
  MobileScannerController cameraController = MobileScannerController();
  bool _screenOpened = false;
  // bool torch = false;
  bool hasflashlight = false;
  bool isturnon = false;

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
                allowDuplicates: true,
                controller: cameraController,
                onDetect: _getQRcode,
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _getQRcode(Barcode qrCode, MobileScannerArguments? args) {
    // TorchState val = cameraController.torchState as TorchState;

    if (!_screenOpened) {
      final String code = qrCode.rawValue ?? "---";
      debugPrint("QRcode Fout --> $code");
      _screenOpened = true;
      // var torch = TorchState.on;
      // print(TorchState.on.name + 'hello hello');
      // if (torch == true) {
      //   print("hello world");
      //   cameraController.toggleTorch();
      // }
      // Navigator.push(
      //     context,
      //     MaterialPageRoute(
      //         builder: (context) => FountCode(
      //               screenClose: _screenWasClosed,
      //               value: code,
      //             )));
      showDialog(
          context: context,
          builder: (BuildContext? context) {
            return AlertDialog(
              title: Text("QR Code"),
              content: Text(code),
              actions: [
                TextButton(
                    onPressed: () {
                      // Navigator.push(
                      //     context!,
                      //     MaterialPageRoute(
                      //         builder: (context) => ReceiveOrders()));
                      Navigator.pop(context!);
                      Navigator.pop(context);
                    },
                    child: Text("OK"))
              ],
            );
          });
    }
  }
}
