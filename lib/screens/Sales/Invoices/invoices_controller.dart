import 'package:get/get.dart';

class InvoicesController extends GetxController {}

class InvoicesBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => InvoicesController(), fenix: true);
  }
}
