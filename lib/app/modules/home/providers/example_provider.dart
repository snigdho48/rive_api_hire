import 'package:get/get.dart';

import '../../../constants.dart';
import '../model/example_model.dart';

class ExampleProvider extends GetConnect {
  @override
  void onInit() {
    httpClient.defaultDecoder = (map) {
      if (map is Map<String, dynamic>) return Example.fromJson(map);
      if (map is List) {
        return map.map((item) => Example.fromJson(item)).toList();
      }
    };
    httpClient.baseUrl = Constants.url;
  }

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
