import 'package:get/get.dart';

import '../../../constants.dart';
import '../model/example_model.dart';

class ExampleProvider extends GetConnect {
  Future<Example?> getExample() async {
    final response =
        await get(Constants.url).timeout(const Duration(seconds: 30));

    if (response.status.hasError) {
      return Future.error(response.statusText!);
    } else {
      return Example.fromJson(response.body);
    }
  }
}
