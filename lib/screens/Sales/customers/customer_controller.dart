import 'package:accountieons_flutter/constants/constants.dart';
import 'package:accountieons_flutter/utils/fatch_api.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';

class CustomerController extends GetxController {
  TextEditingController name = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController phone = TextEditingController();
  TextEditingController address = TextEditingController();
  TextEditingController shippingName = TextEditingController();
  TextEditingController shippingNo = TextEditingController();
  TextEditingController shippingAdd = TextEditingController();
  TextEditingController number = TextEditingController();

  List<String> taxTpye = [
    'select',
    'GST Number',
    'Tax Number',
    'Vat Number',
    'Tax/Vat Number'
  ];
  int? selectedTax;
  int? selectedCountry;
  List mainData = [];
  List listOfCountry = [];
  int currPage = 0;

  getData(int page,
      {String? search, bool? isLoader, bool? pageUpdate, int? limit}) {
    fetchApi(
      url: 'sales/customer_list',
      params: {
        'business_id': userData.data!.businessId,
        'offset': (page * dataLimit),
        'limit': limit ?? dataLimit,
        'search': search
      },
      isLoader: isLoader ?? true,
      onSucess: (val) {
        if (val['status'].toString() != '0') {
          if (limit != null) {
            mainData = val['data'];
          } else {
            (currPage != 0 && val['data'] != null)
                ? mainData.addAll(val['data'])
                : mainData = val['data'];
            (pageUpdate ?? true) ? currPage++ : null;
          }
        } else {}
        update();
      },
    );
  }

  addData(bool isAdd, {String? id, int? index}) {
    fetchApi(
      url: 'sales/add_customer_data',
      params: {
        'id': isAdd ? null : id,
        'user_id': userData.data!.id,
        'business_id': userData.data!.businessId,
        'name': name.text,
        'email': email.text,
        'phone': phone.text,
        'address': address.text,
        'tax_format': selectedTax != null ? taxTpye[selectedTax!] : null,
        'vat_code': number.text,
        'country': selectedCountry != null
            ? listOfCountry[selectedCountry!]['id']
            : null,
        'currency': selectedCountry != null
            ? listOfCountry[selectedCountry!]['currency_code']
            : null,
        'address1': shippingAdd.text,
        's_name': shippingName.text,
        's_phone': shippingNo.text,
      },
      isLoader: true,
      onSucess: (val) {
        Get.back();
        if (val['status'].toString() != '0') {
          getData(0, limit: mainData.length + 1, isLoader: false);
          EasyLoading.showSuccess('Data Added Successfully');
        } else {}
        update();
      },
    );
  }

  deleteData(String id, int index) {
    fetchApi(
      url: 'sales/delete_customer',
      params: {
        'id': id,
      },
      onSucess: (val) {
        if (val['status'].toString() != '0') {
          mainData.removeAt(index);
        } else {}
        update();
      },
    );
  }

  countryData() {
    fetchApi(
      url: 'user/get_country',
      get: true,
      onSucess: (val) {
        if (val['status'].toString() != '0') {
          listOfCountry = val['data'];
        } else {}
        update();
      },
    );
  }

  @override
  void onInit() {
    getData(0);
    countryData();
    super.onInit();
  }
}

class CustomerBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => CustomerController(), fenix: true);
  }
}
