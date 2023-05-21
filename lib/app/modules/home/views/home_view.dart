import 'package:flutter/material.dart';

import 'package:get/get.dart';

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
            ? const Center(
                child: CircularProgressIndicator(),
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
                          errorBuilder: (context, error, stackTrace) =>
                              const Icon(Icons.error),
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
