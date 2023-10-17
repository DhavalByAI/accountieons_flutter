import 'package:accountieons_flutter/constants/constants.dart';
import 'package:accountieons_flutter/utils/fatch_api.dart';
import 'package:accountieons_flutter/widgets/cAppBar.dart';
import 'package:accountieons_flutter/widgets/sub_widgets/c_bounce.dart';
import 'package:accountieons_flutter/widgets/sub_widgets/c_card.dart';
import 'package:accountieons_flutter/widgets/sub_widgets/ctext.dart';
import 'package:accountieons_flutter/widgets/sub_widgets/form_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';

class ChangePasswordScreen extends StatelessWidget {
  const ChangePasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          GetBuilder<ChangePasswordController>(
            initState: (_) {},
            builder: (_) {
              return cAppBar(
                  pageName: 'Change Password',
                  suffix: cBounce(
                      onPressed: () {
                        (_.oldPassword.text.isNotEmpty &&
                                _.newPassword.text.isNotEmpty &&
                                _.confirmPassword.text.isNotEmpty)
                            ? fetchApi(
                                url: 'setting/change_password',
                                params: {
                                  'user_id': userData.data?.id,
                                  'role': userData.data?.role,
                                  'old_pass': _.oldPassword.text,
                                  'new_pass': _.newPassword.text,
                                  'confirm_pass': _.confirmPassword.text
                                },
                                onSucess: (p0) {
                                  if (p0['msg'] ==
                                      'Your Old Password doesn\'t Match') {
                                    EasyLoading.showError(
                                        "Your old password doesn't match");
                                  } else {
                                    Get.back();
                                    EasyLoading.showSuccess(
                                        "Password Changed Successfully");
                                  }
                                },
                              )
                            : EasyLoading.showError(
                                "Please fill all the valid details");
                      },
                      child: ctext('Save',
                          fontSize: 14, fontWeight: FontWeight.w600)));
            },
          ),
          Padding(
            padding: const EdgeInsets.all(20),
            child: cCard(
              color: Colors.white,
              shadow: true,
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: GetBuilder<ChangePasswordController>(
                  initState: (_) {},
                  builder: (_) {
                    return Column(
                      children: [
                        cFormField(
                            title: 'Old Password', controller: _.oldPassword),
                        cFormField(
                            title: 'New Password', controller: _.newPassword),
                        cFormField(
                            title: 'Confirm New Password',
                            controller: _.confirmPassword),
                      ],
                    );
                  },
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}

class ChangePasswordController extends GetxController {
  TextEditingController oldPassword = TextEditingController();
  TextEditingController newPassword = TextEditingController();
  TextEditingController confirmPassword = TextEditingController();
}

class ChangePasswordBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => ChangePasswordController(), fenix: true);
  }
}
