import 'package:accountieons_flutter/constants/constants.dart';
import 'package:accountieons_flutter/routes/app_routes.dart';
import 'package:accountieons_flutter/screens/Auth/login/user_model.dart';
import 'package:accountieons_flutter/utils/fatch_api.dart';
import 'package:get/get.dart';

class SplashController extends GetxController {
  @override
  void onInit() {
    if (box.get('email') != null) {
      fetchApi(
        url: 'user/login',
        params: {'email': box.get('email'), 'password': box.get('password')},
        isLoader: false,
        onSucess: (val) {
          userData = UserData.fromJson(val);
          Get.offAllNamed(AppRoutes.dashboard);
        },
        onFailed: (val) {
          Future.delayed(
            const Duration(milliseconds: 1000),
            () {
              Get.offAllNamed(AppRoutes.loginScreen);
            },
          );
        },
      );
    } else {
      Future.delayed(
        const Duration(milliseconds: 1500),
        () {
          Get.offAllNamed(AppRoutes.loginScreen);
        },
      );
    }
    super.onInit();
  }
}

class InitialBindings extends Bindings {
  @override
  dependencies() {
    Get.put(SplashController());
  }
}
