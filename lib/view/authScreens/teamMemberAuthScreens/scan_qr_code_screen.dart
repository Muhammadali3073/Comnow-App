import 'dart:developer';
import 'dart:io';

import 'package:comnow/controller/authControllers/member_login_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../utils/color_data.dart';

class ScanQRCodeScreen extends StatefulWidget {
  const ScanQRCodeScreen({super.key});

  @override
  State<ScanQRCodeScreen> createState() => _ScanQRCodeScreenState();
}

class _ScanQRCodeScreenState extends State<ScanQRCodeScreen> {
  MemberLoginController memberLoginController =
      Get.put(MemberLoginController(), tag: 'memberLoginController');

  QRViewController? qRViewController;
  Barcode? result;
  final GlobalKey qrKey = GlobalKey(debugLabel: 'QR');

  String? selectedLanguageCode;

  sharedPreferences() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    // Get App Language in SharedPreferences
    selectedLanguageCode =
        sharedPreferences.getString('selectedLanguageCode') ?? 'en';

    log('App Language: $selectedLanguageCode');
  }

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
      body: Stack(
        children: [
          buildQrView(context),
        ],
      ),
    );
  }

  Widget buildQrView(BuildContext context) {
    return QRView(
      key: qrKey,
      onQRViewCreated: onQRViewCreated,
      overlay: QrScannerOverlayShape(
        borderColor: CustomColors.blueColor,
        borderRadius: 10.px,
        borderWidth: 10.px,
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

      memberLoginController.handleMemberLogin(
        context,
        enrollmentCode: data.toString(),
        language: selectedLanguageCode,
      );
    }
  }

  @override
  void dispose() {
    qRViewController?.dispose();
    super.dispose();
  }
}
