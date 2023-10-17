import 'package:accountieons_flutter/constants/constants.dart';
import 'package:accountieons_flutter/utils/fatch_api.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class StockNServiceController extends GetxController {
  TextEditingController name = TextEditingController();
  TextEditingController price = TextEditingController();
  TextEditingController productDetails = TextEditingController();
  TextEditingController qyt = TextEditingController();
  TextEditingController hsnCode = TextEditingController();
  bool isBoth = false;
  int selectedTax = 0;
  int? selectedCountry;
  List mainData = [];
  List listOfUnit = [];
  int currPage = 0;
  int selectedType = 0;
  XFile? productImage;
  List<String> taxTpye = [
    'Goods',
    'Service',
  ];

  getData(int page,
      {String? search, bool? isLoader, bool? pageUpdate, int? limit}) {
    fetchApi(
      url: 'sales/get_list_product',
      params: {
        'user_id': userData.data!.id,
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
            mainData.removeWhere((element) => element['is_sell'] != '1');
          } else {
            (currPage != 0 && val['data'] != null)
                ? mainData.addAll(val['data'])
                : mainData = val['data'];
            (pageUpdate ?? true) ? currPage++ : null;
            mainData.removeWhere((element) => element['is_sell'] != '1');
          }
        } else {}
        update();
      },
    );
  }

  addData(bool isAdd, {String? id, int? index}) async {
    fetchApi(
      url: 'sales/add_product_and_service_data',
      params: {
        'id': isAdd ? null : id,
        'user_id': userData.data!.id,
        'business_id': userData.data!.businessId,
        'name': name.text,
        'price': price.text,
        'income_category': '1',
        'details': productDetails.text,
        'is_both': isBoth ? 1 : 0,
        'is_sell': 1,
        'is_buy': isBoth ? 1 : 0,
        'product_image': productImage != null
            ? MultipartFile(productImage!.path, filename: productImage!.name)
            : null,
        'unit': selectedCountry != null
            ? listOfUnit[selectedCountry!]['unit']
            : null,
        'quantity': qyt.text,
        'pro_type': selectedTax + 1,
        'hsn_code': hsnCode.text,
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
      url: 'sales/delete_product',
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

  unitData() {
    fetchApi(
      url: 'setting/get_list_of_Unit',
      params: {
        'user_id': userData.data!.id,
        'business_id': userData.data!.businessId
      },
      onSucess: (val) {
        if (val['status'].toString() != '0') {
          listOfUnit = val['data'];
        } else {}
        update();
      },
    );
  }

  @override
  void onInit() {
    getData(0);
    unitData();
    super.onInit();
  }
}

class StockNServiceBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => StockNServiceController(), fenix: true);
  }
}
