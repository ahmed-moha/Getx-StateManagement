import 'package:get/get.dart';

class HomeController extends GetxController {
  int number = 0;
 

  increament() {
    number++;
    update();
  }

  decreament() {
    number--;
    update();
  }
}
