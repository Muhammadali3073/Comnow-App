import 'dart:developer';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../utils/color_data.dart';
import '../../navBarScreen/team_member_nav_bar_screen.dart';
import '../../widgets/widget_utils.dart';

class ScanQRCodeScreen extends StatefulWidget {
  const ScanQRCodeScreen({super.key});

  @override
  State<ScanQRCodeScreen> createState() => _ScanQRCodeScreenState();
}

class _ScanQRCodeScreenState extends State<ScanQRCodeScreen> {
  QRViewController? qRViewController;
  Barcode? result;
  final GlobalKey qrKey = GlobalKey(debugLabel: 'QR');

  @override
  void reassemble() {
    super.reassemble();
    if (Platform.isAndroid) {
      qRViewController!.pauseCamera();
    }
    qRViewController!.resumeCamera();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: MediaQuery.sizeOf(context).height,
        width: MediaQuery.sizeOf(context).width,
        padding:
            EdgeInsets.only(top: 4.h, left: 5.5.h, right: 5.5.h, bottom: 25.h),
        decoration: BoxDecoration(
            image: const DecorationImage(
                image: AssetImage('assets/png/auth_background_image.png'),
                fit: BoxFit.fitWidth),
            gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.center,
                colors: [topBackgroundColor, bottomBackgroundColor])),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Column(
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 5.h),
                  child: getAssetPng('splash_logo.png'),
                ),
                customWhiteMediumText(
                  text: 'Scan QR Code',
                  fontSize: 20.px,
                ),
              ],
            ),
            SizedBox(height: 24.h, width: 24.h, child: buildQrView(context)),
          ],
        ),
      ),
    );
  }

  Widget buildQrView(BuildContext context) {
    return QRView(
      key: qrKey,
      onQRViewCreated: onQRViewCreated,
      overlay: QrScannerOverlayShape(
        borderColor: blueColor,
        cutOutSize: 24.h,
        overlayColor: Colors.transparent,
      ),
      onPermissionSet: (ctrl, p) => onPermissionSet(context, ctrl, p),
    );
  }

  void onQRViewCreated(QRViewController controller) {
    qRViewController = controller;
    qRViewController!.scannedDataStream.listen((scanData) {
      setState(() {
        result = scanData;
        log('result: ${result!.code}');
      });
      goToHomeScreenAfterGetData(result!.code.toString());
    });
  }

  void onPermissionSet(BuildContext context, QRViewController ctrl, bool p) {
    log('${DateTime.now().toIso8601String()}_onPermissionSet $p');
    if (!p) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('no Permission')),
      );
    }
  }

  void goToHomeScreenAfterGetData(String data) {
    if (data.isNotEmpty) {
      qRViewController!.pauseCamera();
      qRViewController?.dispose();
      Get.offAll(() => const TeamMemberBottomNavigationBarScreen());
    }
  }

  @override
  void dispose() {
    qRViewController?.dispose();
    super.dispose();
  }
}
