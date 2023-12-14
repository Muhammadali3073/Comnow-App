import 'dart:async';
import 'dart:developer';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

class NetworkController extends GetxController {
  var connectionType = 0.obs;
  final Connectivity _connectivity = Connectivity();
  late StreamSubscription _streamSubscription;

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    getConnectionType();
    _streamSubscription =
        _connectivity.onConnectivityChanged.listen(_updateStatus);
  }

  Future<void> getConnectionType() async {
    dynamic connectivityResult;
    try {
      connectivityResult = await (_connectivity.checkConnectivity());
    } on PlatformException catch (e) {
      log(e.toString());
    }
    return _updateStatus(connectivityResult);
  }

  _updateStatus(ConnectivityResult result) {
    switch (result) {
      case ConnectivityResult.wifi:
        connectionType.value = 1;
        update();
        break;
      case ConnectivityResult.mobile:
        connectionType.value = 2;
        update();
        break;
      case ConnectivityResult.none:
        connectionType.value = 0;
        update();
        break;
      default:
        Get.snackbar('Something went wrong', 'There is no internet!');
    }
  }

  @override
  void onClose() {
    // TODO: implement onClose
    super.onClose();
    _streamSubscription.cancel();
  }
}
