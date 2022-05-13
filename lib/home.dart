import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_statemanagement/controllers/home_controller.dart';

class Home extends StatelessWidget {
  Home({Key? key}) : super(key: key);
  final controller = Get.put(HomeController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          'Get Statemanagement',
          style: TextStyle(color: Colors.white),
        ),
        elevation: 0,
        backgroundColor: Colors.cyan,
      ),
      body: GetBuilder<HomeController>(builder: (cont) {
        return Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                ElevatedButton(
                  style: ElevatedButton.styleFrom(primary: Colors.green),
                  onPressed: () => controller.increament(),
                  child: const Icon(Icons.add),
                ),
                Text(
                  controller.number.toString(),
                  style: const TextStyle(color: Colors.black, fontSize: 33),
                ),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(primary: Colors.red),
                  onPressed: () => controller.decreament(),
                  child: const Icon(CupertinoIcons.minus),
                ),
              ],
            ),
          ],
        );
      }),
    );
  }
}
