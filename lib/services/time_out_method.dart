import 'package:get/get.dart';

import '../view/widgets/widget_utils.dart';

timeOutException({loading}) {
  Get.back();
  timeOutExceptionDialogBox();
  if (loading != null) loading.value = false;
}