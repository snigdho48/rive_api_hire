import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:rive/rive.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body:
          // TODO: use state management solution to effeciently change state
          // TODO: show assets/loading_new.riv animation while loadin data from the web, show no data text on app initial load
          Obx(
        () => controller.isloading.value
            ? Center(
                child: SizedBox(
                  width: Get.width * 0.4,
                  height: Get.width * 0.4,
                  child: const RiveAnimation.asset(
                    'assets/animation/loading_new.riv',
                    fit: BoxFit.cover,
                  ),
                ),
              )
            // ignore: deprecated_member_use
            : controller.data.isNull
                ? const Center(
                    child: Text('No Data Found'),
                  )
                : Center(
                    child: Container(
                    color: Colors.grey,
                    height: 300,
                    width: 300,
                    padding: const EdgeInsets.all(12),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Image.network(
                          // TODO: use avatar field from json
                          controller.data!.avatar!,
                          width: 150,
                          height: 150,
                          //loadingbuilder with percentage
                          loadingBuilder: (context, child, loadingProgress) {
                            if (loadingProgress == null) return child;
                            return Container(
                              alignment: Alignment.centerLeft,
                              width: 150 / 2,
                              height: 150,
                              child: CircularProgressIndicator(
                                value: loadingProgress.expectedTotalBytes !=
                                        null
                                    ? loadingProgress.cumulativeBytesLoaded /
                                        loadingProgress.expectedTotalBytes!
                                    : null,
                              ),
                            );
                          },
                          errorBuilder: (context, error, stackTrace) =>
                              Container(
                                  alignment: Alignment.centerLeft,
                                  width: 150,
                                  height: 15,
                                  child: const Icon(
                                    Icons.error,
                                    size: 100,
                                  )),
                        ),
                        const SizedBox(height: 40),
                        // TODO: use first_name & last_name fields from json
                        Text(
                            controller.data!.firstName! +
                                controller.data!.lastName!,
                            style: ThemeData().textTheme.labelLarge),
                        // TODO: phone_number
                        Text(controller.data!.phoneNumber!,
                            style: ThemeData().textTheme.labelLarge),
                        // TODO: format date_of_birth properly
                        Text(controller.data!.dateOfBirth!,
                            style: ThemeData().textTheme.labelLarge),
                      ],
                    ),
                  )),
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.refresh),
        onPressed: () {
          controller.fetchurl();
        },
      ),
    );
  }
}
