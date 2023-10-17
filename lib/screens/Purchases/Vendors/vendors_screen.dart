import 'package:accountieons_flutter/utils/app_colors.dart';
import 'package:accountieons_flutter/widgets/cAppBar.dart';
import 'package:accountieons_flutter/widgets/sub_widgets/bottom_sheet.dart';
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

import 'vendors_controller.dart';

class VendorsScreen extends StatelessWidget {
  const VendorsScreen({super.key});

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
          bottomSheet(
              context: context,
              title: 'Add Vendors',
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: Column(
                  children: [
                    cFormField(title: 'Vendor Name *'),
                    cFormField(title: 'Email'),
                    cFormField(title: 'Phone'),
                    cFormField(title: 'Address'),
                    ctext('Billing Information',
                        fontWeight: FontWeight.w700,
                        color: Colors.black,
                        fontSize: 14),
                    const SizedBox(
                      height: 12,
                    ),
                    GetBuilder<VendorsController>(
                      initState: (_) {},
                      builder: (_) {
                        return cFormField(
                            title: 'Select Tax Type',
                            dropDown: cDropDown(
                                borderColor: Colors.transparent,
                                fillColor: AppColors.textFieldBG,
                                onChanged: (p0) {
                                  if (p0 != 0) {
                                    _.selectedTax = p0;
                                  } else {
                                    _.selectedTax = null;
                                  }
                                  _.update();
                                },
                                items: _.taxTpye));
                      },
                    ),
                    GetBuilder<VendorsController>(
                      initState: (_) {},
                      builder: (_) {
                        return _.selectedTax != null
                            ? cFormField(
                                title: _.taxTpye[_.selectedTax!],
                              )
                            : const SizedBox();
                      },
                    ),
                    GetBuilder<VendorsController>(
                      initState: (_) {},
                      builder: (_) {
                        return cFormField(
                          title: 'Select Country',
                          dropDown: cDropDown(
                              borderColor: Colors.transparent,
                              fillColor: AppColors.textFieldBG,
                              onChanged: (p0) {},
                              items: _.listOfCountry),
                        );
                      },
                    ),
                    GetBuilder<VendorsController>(
                      initState: (_) {},
                      builder: (_) {
                        return cFormField(
                          title: 'Select Currency',
                          dropDown: cDropDown(
                              borderColor: Colors.transparent,
                              fillColor: AppColors.textFieldBG,
                              onChanged: (p0) {},
                              items: _.listOfCurrency),
                        );
                      },
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    cButton(
                      'Save',
                    )
                  ],
                ),
              ));
        },
      ),
      body: ListViewPagination(
          cAppBar: cAppBar(pageName: 'Vendors'),
          controller: RefreshController(),
          onLoad: () {},
          child: (index) => Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  children: [
                    cCard(
                        shadow: true,
                        border: true,
                        color: Colors.white,
                        borderColor: Colors.black12,
                        child: Padding(
                          padding: const EdgeInsets.all(8).copyWith(bottom: 3),
                          child: Column(
                            children: [
                              textWithHeading(
                                  title: 'Name', subTitle: 'Teju Patel'),
                              textWithHeading(
                                  title: 'Created', subTitle: '23 jan 2023'),
                              textWithHeading(
                                  title: 'Mobile', subTitle: '7573063415'),
                              textWithHeading(
                                  title: 'Email',
                                  subTitle: 'tulsi@softieons.com'),
                              // textWithHeading(
                              //     title: 'Info', subTitle: 'United Arab Emirates'),
                              widgetWithHeading(
                                  title: 'Actions',
                                  subTitle: Row(
                                    children: [
                                      CircleAvatar(
                                        radius: 12,
                                        backgroundColor: AppColors.iconButtonBG,
                                        child: Image.asset(
                                          'assets/icons/edit.png',
                                          height: 12,
                                        ),
                                      ),
                                      const SizedBox(
                                        width: 8,
                                      ),
                                      CircleAvatar(
                                        radius: 12,
                                        backgroundColor: AppColors.iconButtonBG,
                                        child: Image.asset(
                                          'assets/icons/delete.png',
                                          height: 12,
                                        ),
                                      )
                                    ],
                                  ))
                            ],
                          ),
                        ))
                  ],
                ),
              )),
    );
  }
}
