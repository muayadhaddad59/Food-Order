import 'package:get/get.dart';

class DetailsController extends GetxController {
  int number = 1;

  void increment() {
    number++;
    update();
  }

  void decrement() {
    number--;
    update();
  }
}
