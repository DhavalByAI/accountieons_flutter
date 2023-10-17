import 'package:accountieons_flutter/constants/constants.dart';
import 'package:accountieons_flutter/screens/Auth/login/login_controller.dart';
import 'package:accountieons_flutter/utils/app_colors.dart';
import 'package:accountieons_flutter/widgets/sub_widgets/c_bounce.dart';
import 'package:accountieons_flutter/widgets/sub_widgets/cbutton.dart';
import 'package:accountieons_flutter/widgets/sub_widgets/ctext.dart';
import 'package:accountieons_flutter/widgets/sub_widgets/ctextfield.dart';
import 'package:accountieons_flutter/widgets/sub_widgets/ctextfield_common.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.mainColor,
      resizeToAvoidBottomInset: false,
      body: Stack(
        children: [
          Scaffold(
            resizeToAvoidBottomInset: true,
            backgroundColor: AppColors.mainColor,
            body: Stack(children: [
              Image.asset(
                'assets/images/login_bg.png',
                fit: BoxFit.fill,
                height: dheight,
                width: dwidth,
              ),
              SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(kPadding),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const SizedBox(
                        height: 100,
                      ),
                      Image.asset(
                        'assets/icons/logo.png',
                        width: 120,
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8),
                        child: ctext('ACCOUNTIEONS',
                            color: Colors.white,
                            fontSize: 22,
                            latterSpacing: 2,
                            fontWeight: FontWeight.w300),
                      ),
                      const SizedBox(
                        height: 24,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset(
                            'assets/icons/flash_left.png',
                            width: 100,
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: ctext('LOGIN',
                                color: Colors.white,
                                fontSize: 18,
                                latterSpacing: 2,
                                fontWeight: FontWeight.w300),
                          ),
                          Image.asset(
                            'assets/icons/flash_right.png',
                            width: 100,
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 24,
                      ),
                      GetBuilder<LoginController>(
                        initState: (_) {},
                        builder: (_) {
                          return cTextFiled(
                              title: 'Email',
                              icon: 'at',
                              textField: cTextFieldCommon(
                                controller: _.username,
                                hint: 'Enter Email Address',
                              ));
                        },
                      ),
                      const SizedBox(
                        height: 24,
                      ),
                      GetBuilder<LoginController>(
                        initState: (_) {},
                        builder: (_) {
                          return cTextFiled(
                              title: 'Password',
                              icon: 'password',
                              isObsecure: _.isObsecure,
                              onPressed: () {
                                _.isObsecure = !_.isObsecure;
                                _.update();
                              },
                              isPassword: true,
                              textField: cTextFieldCommon(
                                controller: _.password,
                                obscureText: _.isObsecure,
                                hint: 'Password',
                              ));
                        },
                      ),
                      const SizedBox(
                        height: 14,
                      ),
                      Align(
                          alignment: Alignment.centerRight,
                          child:
                              ctext('Forgot Password?', color: Colors.white)),
                      const SizedBox(
                        height: 20,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 24),
                        child: GetBuilder<LoginController>(
                          initState: (_) {},
                          builder: (_) {
                            return cButton(
                              onTap: () {
                                if (_.username.text.isEmpty) {
                                  EasyLoading.showError(
                                      'Please Enter Valid Username');
                                } else if (_.password.text.isEmpty) {
                                  EasyLoading.showError(
                                      'Please Enter Valid Password');
                                } else {
                                  _.login();
                                }
                              },
                              'Login',
                              btnColor: Colors.white,
                              txtColor: Colors.black,
                            );
                          },
                        ),
                      ),
                      const SizedBox(
                        height: 24,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          ctext('Don\'t Have an Account? ',
                              fontSize: 14, color: Colors.white60),
                          cBounce(
                              onPressed: () {},
                              child: ctext('Signup',
                                  color: Colors.white, fontSize: 14)),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ]),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: SizedBox(
              width: dwidth,
              child: Padding(
                padding: const EdgeInsets.all(12),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    ctext('Powered by',
                        fontWeight: FontWeight.w600,
                        fontSize: 12,
                        color: Colors.white),
                    ctext('Softieons Technology',
                        fontWeight: FontWeight.w600,
                        fontSize: 12,
                        color: Colors.white),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
