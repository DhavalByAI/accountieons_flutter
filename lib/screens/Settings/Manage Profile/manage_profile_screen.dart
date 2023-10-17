import 'package:accountieons_flutter/constants/constants.dart';
import 'package:accountieons_flutter/screens/Auth/login/user_model.dart';
import 'package:accountieons_flutter/utils/app_colors.dart';
import 'package:accountieons_flutter/utils/fatch_api.dart';
import 'package:accountieons_flutter/widgets/cAppBar.dart';
import 'package:accountieons_flutter/widgets/sub_widgets/c_bounce.dart';
import 'package:accountieons_flutter/widgets/sub_widgets/c_dropdown.dart';
import 'package:accountieons_flutter/widgets/sub_widgets/ctext.dart';
import 'package:accountieons_flutter/widgets/sub_widgets/form_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';

import 'manage_profile_controller.dart';

class ManageProfileScreen extends StatelessWidget {
  const ManageProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            GetBuilder<ManageProfileController>(
              initState: (_) {},
              builder: (_) {
                return cAppBar(
                    pageName: 'Manage Profile',
                    suffix: cBounce(
                        onPressed: () {
                          fetchApi(
                            url: 'setting/general_setting',
                            params: {
                              'user_id': userData.data!.id,
                              'name': _.name.text,
                              'email': _.email.text,
                              'country': _.countryList[_.selectedCountry]['id'],
                              'address': _.address.text,
                              'city': _.city.text,
                              'state': _.state.text,
                              'phone': _.phone.text,
                              'postcode': _.postcode.text
                            },
                            onSucess: (val) {
                              EasyLoading.showSuccess(
                                  'Data Updated Successfully');
                              fetchApi(
                                url:
                                    'setting/get_user_profile/${userData.data!.id}',
                                get: true,
                                isLoader: false,
                                onSucess: (p0) {
                                  userData = UserData.fromJson(p0);
                                },
                              );
                            },
                          );
                        },
                        child: ctext('Save',
                            fontSize: 14, fontWeight: FontWeight.w600)));
              },
            ),
            Padding(
              padding: const EdgeInsets.all(20),
              child: GetBuilder<ManageProfileController>(
                initState: (_) {},
                builder: (_) {
                  return Column(
                    children: [
                      const SizedBox(
                        height: 12,
                      ),
                      CircleAvatar(
                        backgroundImage: NetworkImage(AppConst.baseImageUrl +
                            userData.data!.image.toString()),
                        backgroundColor: AppColors.greyBG,
                        radius: 70,
                      ),
                      const SizedBox(
                        height: 24,
                      ),
                      cFormField(title: 'Name', controller: _.name),
                      cFormField(title: 'Phone', controller: _.phone),
                      cFormField(title: 'Email', controller: _.email),
                      cFormField(
                          title: 'Country',
                          dropDown: cDropDown(
                              borderColor: Colors.transparent,
                              fillColor: AppColors.textFieldBG,
                              value: _.selectedCountry,
                              onChanged: (val) {
                                _.selectedCountry = val!;
                                _.update();
                              },
                              items: List.generate(_.countryList.length,
                                  (index) => _.countryList[index]['name']))),
                      cFormField(title: 'Country', controller: _.country),
                      cFormField(title: 'City', controller: _.city),
                      cFormField(title: 'State', controller: _.state),
                      cFormField(title: 'Postcode', controller: _.postcode),
                      cFormField(
                          title: 'Address', controller: _.address, maxlines: 3),
                    ],
                  );
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
