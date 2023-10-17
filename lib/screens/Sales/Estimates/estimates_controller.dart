import 'package:get/get.dart';

class EstimateController extends GetxController {
  List<String> types = [
    'Goods',
    'Service',
  ];
  List<String> listOfCountry = [
    'select',
    'India',
    'Israel',
    'United Arab Emirates',
    'United State'
  ];
  List<String> listOfCurrency = [
    'select',
    'INR - Indian Rupee',
    'ILS - Israeli New Shekel',
    'AED - United Arab Emirates',
    'USD - United State Dollar'
  ];
  int selectedType = 0;
  bool isBoth = false;
}

class EstimateBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => EstimateController(), fenix: true);
  }
}
