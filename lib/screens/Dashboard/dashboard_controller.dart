import 'package:get/get.dart';

class DashboardController extends GetxController {}

class DashboardBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => DashboardController());
  }
}
