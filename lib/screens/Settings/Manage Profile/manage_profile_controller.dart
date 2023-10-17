import 'package:accountieons_flutter/constants/constants.dart';
import 'package:accountieons_flutter/utils/fatch_api.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ManageProfileController extends GetxController {
  TextEditingController name = TextEditingController(text: userData.data?.name);
  TextEditingController phone =
      TextEditingController(text: userData.data?.phone);
  TextEditingController email =
      TextEditingController(text: userData.data?.email);
  TextEditingController country =
      TextEditingController(text: userData.data?.country);
  TextEditingController city = TextEditingController(text: userData.data?.city);
  TextEditingController state =
      TextEditingController(text: userData.data?.state);
  TextEditingController postcode =
      TextEditingController(text: userData.data?.postcode);
  TextEditingController address =
      TextEditingController(text: userData.data?.address);
  List countryList = [];
  int selectedCountry = 0;

  @override
  void onInit() {
    fetchApi(
      url: 'user/get_country',
      get: true,
      isLoader: false,
      onSucess: (val) {
        countryList = val['data'];
        var data = countryList.firstWhereOrNull((element) {
          return element['id'].toString() == userData.data!.country.toString();
        });
        selectedCountry = data != null ? countryList.indexOf(data) : 0;
        update();
      },
    );

    super.onInit();
  }
}

class ManageProfileBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => ManageProfileController(), fenix: true);
  }
}
