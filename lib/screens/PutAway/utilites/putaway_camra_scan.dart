import 'package:flutter/material.dart';
import 'package:mobile_scanner/mobile_scanner.dart';
import 'package:provider/provider.dart';
import 'package:warehouse/screens/PutAway/put_away_provider/put_away_orderline_provider.dart';
import 'package:warehouse/screens/PutAway/put_away_widget/custom_putaway_button.dart';
import 'package:warehouse/widgets/custom_alert_dialog.dart';

class PutAwayBarCodeScanner extends StatefulWidget {
  String scanValue;
  PutAwayBarCodeScanner({super.key, required this.scanValue});

  @override
  State<PutAwayBarCodeScanner> createState() => _PutAwayBarCodeScannerState();
}

class _PutAwayBarCodeScannerState extends State<PutAwayBarCodeScanner> {
  MobileScannerController cameraController = MobileScannerController();
  String locationDestination = '';
  Future<void> productUpdate({required String id}) async {
    final data = Provider.of<PutAwayOrderLineProvid>(context, listen: false);
    if (locationDestination == id) {
      print('------CORRECT LOCATION---');
      data.correctproductUpdateInpallet(context: context, id: id);
    } else {
       print('------WRONG LOCATION---');
      MyCustomAlertDialog().showCustomAlertdialog(
          context: context,
          title: 'Note',
          button: true,
          onTapCancelButt: () {
            Navigator.of(context).pop();
          },
          subtitle:
              'The entered Bin $locationDestination does not match the expected value $id. Do you want to use it anyway',
          onTapOkButt: () {
            data.wrongproductUpdateInPallet(
                context: context, id: id, locationId: locationDestination);
          });
    }
  }

  Future<void> _getQRcode(Barcode qrCode, MobileScannerArguments? args) async {
    print(qrCode.rawValue);

    if (locationDestination != '') {
      await productUpdate(id: qrCode.rawValue.toString());
      await cameraController.stop();
    }

    if (locationDestination == '') {
      locationDestination = qrCode.rawValue.toString();
      setState(() {
        print(locationDestination);
      });
      await cameraController.stop();
    }
  }

  @override
  Widget build(BuildContext context) {
    final data = Provider.of<PutAwayOrderLineProvid>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text(
            locationDestination == '' ? 'Location Scanner' : 'Product Scanner'),
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
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
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
          Text(
            'Your Location is $locationDestination',
            style: TextStyle(fontSize: 20),
          ),
          SizedBox(
            height: 40,
          ),
          Text(locationDestination == ''
              ? 'Please Start scan your Location'
              : 'Please Start scan your Product'),
         locationDestination == ''
              ?Container() : PutAwayCustomButton(
              title: 'Scan Product',
              onTap: () {
                cameraController.start();
              })
        ],
      ),
    );
  }
}
