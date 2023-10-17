import 'package:get/get.dart';

class VendorsController extends GetxController {
  List<String> taxTpye = [
    'select',
    'GST Number',
    'Tax Number',
    'Vat Number',
    'Tax/Vat Number'
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
  int? selectedTax;
}

class VendorsBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => VendorsController(), fenix: true);
  }
}
