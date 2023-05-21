import 'package:get/get.dart';
import 'package:hire/app/modules/home/model/example_model.dart';

import '../providers/example_provider.dart';

class HomeController extends GetxController with StateMixin<Example> {
  final isloading = false.obs;
  ExampleProvider dataprovider = ExampleProvider();
  Example? data;

  Future<void> fetchurl() async {
    isloading.value = true;
    await dataprovider.getExample().then((result) {
      data = result;
    }).catchError((onError) {
      data = null;
      Get.snackbar('Error', onError.toString());
    });
    isloading.value = false;
  }
}
