import 'package:get/get.dart';

class CategoriesController extends GetxController {}

class CategoriesBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => CategoriesController(), fenix: true);
  }
}
