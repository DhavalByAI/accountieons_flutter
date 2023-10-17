import 'package:accountieons_flutter/constants/constants.dart';
import 'package:accountieons_flutter/routes/app_routes.dart';
import 'package:accountieons_flutter/screens/Auth/login/user_model.dart';
import 'package:accountieons_flutter/utils/fatch_api.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class LoginController extends GetxController {
  TextEditingController username = TextEditingController();
  TextEditingController password = TextEditingController();
  bool isObsecure = true;

  login() {
    fetchApi(
      url: 'user/login',
      params: {'email': username.text, 'password': password.text},
      onSucess: (val) {
        userData = UserData.fromJson(val);
        box.put('email', userData.data?.email);
        box.put('password', password.text);
        Get.offAllNamed(AppRoutes.dashboard);
      },
    );
  }
}

class LoginBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => LoginController());
  }
}
