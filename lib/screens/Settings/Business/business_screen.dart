import 'package:accountieons_flutter/constants/constants.dart';
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
import 'business_controller.dart';

class BusinessScreen extends StatelessWidget {
  const BusinessScreen({super.key});

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
              title: 'Add Business',
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: Column(
                  children: [
                    cFormField(title: 'Upload Business Logo'),
                    cFormField(title: 'Name *'),
                    cFormField(title: 'Title'),
                    cFormField(title: 'Contact Number *'),
                    cFormField(title: 'Website URL'),
                    GetBuilder<BusinessController>(
                      initState: (_) {},
                      builder: (_) {
                        return cFormField(
                            title: 'Select Type',
                            dropDown: cDropDown(
                                borderColor: Colors.transparent,
                                fillColor: AppColors.textFieldBG,
                                items: [
                                  'GST Number',
                                  'Tax Number',
                                  'Vat Number',
                                ]));
                      },
                    ),
                    cFormField(title: 'Document Number'),
                    cFormField(title: 'Phone, Address', maxlines: 3),
                    GetBuilder<BusinessController>(
                      initState: (_) {},
                      builder: (_) {
                        return cFormField(
                            title: 'Business Category *',
                            dropDown: cDropDown(
                                borderColor: Colors.transparent,
                                fillColor: AppColors.textFieldBG,
                                onChanged: (p0) {},
                                items: ['Dozen', 'Gram', 'Etc']));
                      },
                    ),
                    GetBuilder<BusinessController>(
                      initState: (_) {},
                      builder: (_) {
                        return cFormField(
                            title: 'Country *',
                            dropDown: cDropDown(
                                borderColor: Colors.transparent,
                                fillColor: AppColors.textFieldBG,
                                onChanged: (p0) {},
                                items: ['Dozen', 'Gram', 'Etc']));
                      },
                    ),
                    GetBuilder<BusinessController>(
                      initState: (_) {},
                      builder: (_) {
                        return Row(
                          children: [
                            cCard(
                                width: 4, height: 60, color: AppColors.greyBG),
                            const SizedBox(
                              width: 12,
                            ),
                            Expanded(
                              child: ctext(
                                  'This is your reporting currency and cannot be changed. You can still send invoices, track expenses and enter transactions in any currency and an exchange rate is applied for you.'),
                            ),
                          ],
                        );
                      },
                    ),
                    const SizedBox(
                      height: 12,
                    ),
                    Center(
                      child: cButton(
                        'Save',
                      ),
                    )
                  ],
                ),
              ));
        },
      ),
      body: ListViewPagination(
          cAppBar: cAppBar(
            pageName: 'Business',
          ),
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
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              widgetWithHeading(
                                  title: 'Logo',
                                  subTitle: const CircleAvatar(
                                    backgroundColor: AppColors.greyBG,
                                    radius: 20,
                                  )),
                              textWithHeading(
                                  title: 'Business Name',
                                  subTitle: 'Accountieons'),
                              textWithHeading(
                                  title: 'Category',
                                  subTitle: 'Electronics And Telecom'),
                              textWithHeading(
                                  title: 'Currency',
                                  subTitle: 'INR - Indian Rupee ($krupee)'),
                              widgetWithHeading(
                                title: 'Status',
                                subTitle: Row(
                                  children: [
                                    cCard(
                                        radius: 4,
                                        color: Colors.green[100],
                                        border: true,
                                        borderColor: Colors.green,
                                        child: Padding(
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 4),
                                          child: Row(
                                            children: [
                                              ctext('Active',
                                                  color: Colors.green),
                                            ],
                                          ),
                                        )),
                                  ],
                                ),
                              ),
                              widgetWithHeading(
                                  title: 'Action',
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
                                      ),
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
