import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:hire/app/modules/home/model/example_model.dart';
import 'package:intl/intl.dart';

import '../providers/example_provider.dart';

class HomeController extends GetxController with StateMixin<Example> {
  final isloading = false.obs;
  ExampleProvider dataprovider = ExampleProvider();
  Example? data;

  Future<void> fetchurl() async {
    isloading.value = true;
    await dataprovider.getExample().then((result) {
      data = result;
      data!.dateOfBirth =
          (DateFormat.yMMMd().format(DateTime.parse(data!.dateOfBirth!)))
              .toString();
    }).catchError((onError) {
      data = null;
      Get.snackbar('Error', onError.toString(),
          isDismissible: true,
          margin: EdgeInsets.only(
            top: Get.statusBarHeight / 2,
          ));
    });
    await Future.delayed(const Duration(seconds: 1))
        .then((value) => isloading.value = false);
  }
}
