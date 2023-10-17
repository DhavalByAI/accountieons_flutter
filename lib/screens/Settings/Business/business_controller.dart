import 'package:get/get.dart';

class BusinessController extends GetxController {}

class BusinessBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => BusinessController(), fenix: true);
  }
}
