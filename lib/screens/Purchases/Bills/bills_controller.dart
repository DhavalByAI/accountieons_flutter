import 'package:get/get.dart';

class BillsController extends GetxController {}

class BillsBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => BillsController(), fenix: true);
  }
}
