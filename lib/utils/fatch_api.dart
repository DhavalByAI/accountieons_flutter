import 'dart:convert';
import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import '../constants/constants.dart';

Future<dynamic> fetchApi(
    {required String url,
    bool? get,
    Map<String, dynamic>? params,
    Function(dynamic)? onSucess,
    Function(dynamic)? onFailed,
    bool isLoader = true,
    bool errorLogShow = false}) async {
  // try {
  isLoader ? EasyLoading.show() : null;
  log("API Calling ${AppConst.baseUrl + url} --> ${params.toString()}");

  var response = get == null
      ? await dio.post(
          AppConst.baseUrl + url,
          data: FormData.fromMap(params!),
        )
      : await dio.get(
          AppConst.baseUrl + url,
        );

  var resData = json.decode(response.data.toString());
  if (kDebugMode) {
    print(response.data.toString());
  }

  if (response.statusCode == 200) {
    if (resData['status'].toString() == 'true' ||
        resData['status'].toString() == 'success' ||
        resData['status'].toString() == '1') {
      log("Got Data Successfully");

      EasyLoading.dismiss();
      onSucess != null ? onSucess(resData) : null;
      return resData;
    } else {
      isLoader ? EasyLoading.showError(resData['msg']) : null;
      onFailed != null ? onFailed(resData) : null;
      return null;
    }
  } else {
    isLoader ? EasyLoading.showError("Didn't Get Data From API") : null;
    if (kDebugMode) {
      print(resData.toString());
    }
    log(response.toString());
    return null;
  }

  // } catch (e) {
  //   EasyLoading.dismiss();
  //   ErrorLogShow ? EasyLoading.showError(e.toString()) : null;
  //   ErrorLogShow ? log(e.toString()) : null;
  // }
}
