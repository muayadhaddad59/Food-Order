import 'package:food_order/Model/Data/Categories/categories_data.dart';
import 'package:food_order/Model/Data/Categories/categories_model.dart';
import 'package:get/get.dart';

class CategoriesController extends GetxController {
  int selectedIndex = 0;

  void changeActice(int index) {
    selectedIndex = index;
    update();
  }
}
