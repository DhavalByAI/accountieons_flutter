import 'dart:developer';

import 'package:accountieons_flutter/screens/Sales/customers/customer_controller.dart';
import 'package:accountieons_flutter/utils/app_colors.dart';
import 'package:accountieons_flutter/widgets/cAppBar.dart';
import 'package:accountieons_flutter/widgets/sub_widgets/bottom_sheet.dart';
import 'package:accountieons_flutter/widgets/sub_widgets/c_bounce.dart';
import 'package:accountieons_flutter/widgets/sub_widgets/c_card.dart';
import 'package:accountieons_flutter/widgets/sub_widgets/c_dropdown.dart';
import 'package:accountieons_flutter/widgets/sub_widgets/cbutton.dart';
import 'package:accountieons_flutter/widgets/sub_widgets/ctext.dart';
import 'package:accountieons_flutter/widgets/sub_widgets/form_field.dart';
import 'package:accountieons_flutter/widgets/sub_widgets/list_view_pegination.dart';
import 'package:accountieons_flutter/widgets/sub_widgets/text_with_heading.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class CustomerScreen extends StatelessWidget {
  const CustomerScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        backgroundColor: AppColors.mainColor,
        child: const Icon(
          Icons.add,
          size: 30,
        ),
        onPressed: () {
          addData(context: context, isAdd: true);
        },
      ),
      body: GetBuilder<CustomerController>(
        initState: (_) {},
        builder: (_) {
          return ListViewPagination(
              cAppBar: cAppBar(pageName: 'Customers'),
              controller: RefreshController(),
              onLoad: () {
                _.getData(_.currPage, isLoader: false);
              },
              onRefresh: () {
                _.currPage = 0;
                _.getData(0, isLoader: false);
              },
              data: _.mainData,
              child: (index) => cCard(
                  shadow: true,
                  border: true,
                  color: Colors.white,
                  borderColor: Colors.black12,
                  child: Padding(
                    padding: const EdgeInsets.all(8).copyWith(bottom: 3),
                    child: Column(
                      children: [
                        textWithHeading(
                            title: 'Name', subTitle: _.mainData[index]['name']),
                        textWithHeading(
                            title: 'Created',
                            subTitle: _.mainData[index]['created_at']),
                        textWithHeading(
                            title: 'Mobile',
                            subTitle: _.mainData[index]['phone']),
                        textWithHeading(
                            title: 'Email',
                            subTitle: _.mainData[index]['email']),
                        textWithHeading(
                            title: 'Country',
                            subTitle: _.mainData[index]['country_name']),
                        textWithHeading(
                            title: 'Currency',
                            subTitle:
                                '${_.mainData[index]['currency_code']}-${_.mainData[index]['currency_name']}(${_.mainData[index]['currency_symbol']})'),
                        widgetWithHeading(
                            title: 'Actions',
                            subTitle: Row(
                              children: [
                                cBounce(
                                  onPressed: () {
                                    addData(
                                        index: index,
                                        context: context,
                                        isAdd: false);
                                  },
                                  child: CircleAvatar(
                                    radius: 12,
                                    backgroundColor: AppColors.iconButtonBG,
                                    child: Image.asset(
                                      'assets/icons/edit.png',
                                      height: 12,
                                    ),
                                  ),
                                ),
                                const SizedBox(
                                  width: 8,
                                ),
                                cBounce(
                                  onPressed: () {
                                    _.deleteData(
                                        _.mainData[index]['id'], index);
                                  },
                                  child: CircleAvatar(
                                    radius: 12,
                                    backgroundColor: AppColors.iconButtonBG,
                                    child: Image.asset(
                                      'assets/icons/delete.png',
                                      height: 12,
                                    ),
                                  ),
                                )
                              ],
                            ))
                      ],
                    ),
                  )));
        },
      ),
    );
  }

  addData({required BuildContext context, required bool isAdd, int? index}) {
    CustomerController _ = Get.find();
    if (isAdd) {
      log('Adding Customer');
      _.name.clear();
      _.address.clear();
      _.email.clear();
      _.phone.clear();
      _.shippingName.clear();
      _.shippingNo.clear();
      _.shippingAdd.clear();
      _.number.clear();
      _.selectedTax = null;
      _.selectedCountry = null;
    } else {
      _.name.text = _.mainData[index!]['name'].toString();
      _.address.text = _.mainData[index]['address'].toString();
      _.email.text = _.mainData[index]['email'].toString();
      _.phone.text = _.mainData[index]['phone'].toString();
      _.shippingName.text = _.mainData[index]['s_name'].toString();
      _.shippingNo.text = _.mainData[index]['s_phone'].toString();
      _.shippingAdd.text = _.mainData[index]['address1'].toString();
      _.number.text = _.mainData[index]['vat_code'].toString();
      var tmpTaxType = _.taxTpye.firstWhereOrNull(
          (element) => element == _.mainData[index]['tax_format'].toString());
      if (tmpTaxType != null) {
        _.selectedTax = _.taxTpye.indexOf(tmpTaxType);
      } else {
        _.selectedTax = null;
      }
      var tmpCountry = _.listOfCountry.firstWhereOrNull((element) =>
          element['currency_code'].toString() ==
          _.mainData[index]['currency_code'].toString());
      if (tmpCountry != null) {
        _.selectedCountry = _.listOfCountry.indexOf(tmpCountry);
      } else {
        _.selectedCountry = null;
      }
    }
    _.update();
    bottomSheet(
        context: context,
        title: 'Add Customer',
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [
              GetBuilder<CustomerController>(
                initState: (_) {},
                builder: (_) {
                  return Column(
                    children: [
                      cFormField(
                        title: 'Customer Name *',
                        controller: _.name,
                      ),
                      cFormField(title: 'Email', controller: _.email),
                      cFormField(
                          title: 'Phone',
                          controller: _.phone,
                          textInputType: TextInputType.phone),
                      cFormField(title: 'Address', controller: _.address),
                      cFormField(
                          title: 'Shipping Contact Person Name',
                          controller: _.shippingName),
                      cFormField(
                          title: 'Shipping Phone No.',
                          textInputType: TextInputType.phone,
                          controller: _.shippingNo),
                      cFormField(
                          title: 'Shipping Address',
                          maxlines: 4,
                          controller: _.shippingAdd),
                    ],
                  );
                },
              ),
              ctext('Billing Information',
                  fontWeight: FontWeight.w700,
                  color: Colors.black,
                  fontSize: 14),
              const SizedBox(
                height: 12,
              ),
              GetBuilder<CustomerController>(
                initState: (_) {},
                builder: (_) {
                  return cFormField(
                      title: 'Select Tax Type',
                      dropDown: cDropDown(
                          borderColor: Colors.transparent,
                          fillColor: AppColors.textFieldBG,
                          value: _.selectedTax,
                          onChanged: (p0) {
                            p0 == 0 ? _.selectedTax = p0 : _.selectedTax = null;
                            _.update();
                          },
                          items: _.taxTpye));
                },
              ),
              GetBuilder<CustomerController>(
                initState: (_) {},
                builder: (_) {
                  return _.selectedTax != null
                      ? cFormField(
                          title: _.taxTpye[_.selectedTax!],
                          controller: _.number)
                      : const SizedBox();
                },
              ),
              GetBuilder<CustomerController>(
                initState: (_) {},
                builder: (_) {
                  return cFormField(
                    title: 'Select Country',
                    dropDown: cDropDown(
                        borderColor: Colors.transparent,
                        fillColor: AppColors.textFieldBG,
                        value: _.selectedCountry,
                        onChanged: (p0) {
                          _.selectedCountry = p0;
                          _.update();
                        },
                        items: List.generate(_.listOfCountry.length,
                            (index) => _.listOfCountry[index]['name'])),
                  );
                },
              ),
              GetBuilder<CustomerController>(
                initState: (_) {},
                builder: (_) {
                  return cFormField(
                    title: 'Select Currency',
                    dropDown: cDropDown(
                        borderColor: Colors.transparent,
                        fillColor: AppColors.textFieldBG,
                        value: _.selectedCountry,
                        onChanged: (p0) {
                          _.selectedCountry = p0;
                          _.update();
                        },
                        items: List.generate(
                            _.listOfCountry.length,
                            (index) =>
                                _.listOfCountry[index]['currency_code'])),
                  );
                },
              ),
              const SizedBox(
                height: 8,
              ),
              cButton(
                onTap: () {
                  _.addData(isAdd,
                      id: isAdd ? null : _.mainData[index!]['id'],
                      index: isAdd ? null : index);
                },
                'Save',
              )
            ],
          ),
        ));
  }
}
