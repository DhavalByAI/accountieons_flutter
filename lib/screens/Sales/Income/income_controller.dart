import 'package:get/get.dart';

class IncomeController extends GetxController {
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

class IncomeBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => IncomeController(), fenix: true);
  }
}
