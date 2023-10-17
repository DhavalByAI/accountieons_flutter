import 'package:get/get.dart';

class GeneralSettingsController extends GetxController {}

class GeneralSettingsBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => GeneralSettingsController(), fenix: true);
  }
}
