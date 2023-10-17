import 'package:accountieons_flutter/constants/constants.dart';
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
import 'bills_controller.dart';

class BillsScreen extends StatelessWidget {
  const BillsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        backgroundColor: AppColors.mainColor,
        child: const Icon(
          Icons.add,
          size: 30,
        ),
        onPressed: () {},
      ),
      body: ListViewPagination(
          cAppBar: cAppBar(
              pageName: 'Bills',
              suffix: cBounce(
                onPressed: () {
                  bottomSheet(
                      context: context,
                      title: 'Filter',
                      child: Padding(
                        padding: const EdgeInsets.all(20),
                        child: Column(
                          children: [
                            GetBuilder<BillsController>(
                              initState: (_) {},
                              builder: (_) {
                                return cFormField(
                                    title: 'Vendors',
                                    dropDown: cDropDown(
                                        borderColor: Colors.transparent,
                                        fillColor: AppColors.textFieldBG,
                                        onChanged: (p0) {},
                                        items: [
                                          'All Customer',
                                          'Dinesh',
                                          'Ashok'
                                        ]));
                              },
                            ),
                            GetBuilder<BillsController>(
                              initState: (_) {},
                              builder: (_) {
                                return cFormField(
                                    title: 'Status',
                                    dropDown: cDropDown(
                                        borderColor: Colors.transparent,
                                        fillColor: AppColors.textFieldBG,
                                        onChanged: (p0) {},
                                        items: [
                                          'All Status',
                                          'Paid',
                                          'Unpaid',
                                          'Draft'
                                        ]));
                              },
                            ),
                            GetBuilder<BillsController>(
                              initState: (_) {},
                              builder: (_) {
                                return cFormField(
                                    title: 'From',
                                    dropDown: cBounce(
                                      onPressed: () {
                                        showDatePicker(
                                            context: context,
                                            initialDate: DateTime.now(),
                                            firstDate: DateTime(2023),
                                            lastDate: DateTime.now());
                                      },
                                      child: cCard(
                                          height: 36,
                                          width: dwidth,
                                          color: AppColors.textFieldBG,
                                          child: Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: ctext('08 May 2023',
                                                fontSize: 14),
                                          )),
                                    ));
                              },
                            ),
                            GetBuilder<BillsController>(
                              initState: (_) {},
                              builder: (_) {
                                return cFormField(
                                    title: 'To',
                                    dropDown: cBounce(
                                      onPressed: () {
                                        showDatePicker(
                                            context: context,
                                            initialDate: DateTime.now(),
                                            firstDate: DateTime(2023),
                                            lastDate: DateTime.now());
                                      },
                                      child: cCard(
                                          height: 36,
                                          width: dwidth,
                                          color: AppColors.textFieldBG,
                                          child: Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: ctext('08 May 2023',
                                                fontSize: 14),
                                          )),
                                    ));
                              },
                            ),
                            cFormField(
                              title: 'Invoice No.',
                            ),
                            Center(child: cButton('Search'))
                          ],
                        ),
                      ));
                },
                child: Image.asset(
                  'assets/icons/filter.png',
                  height: 20,
                ),
              )),
          controller: RefreshController(),
          onLoad: () {},
          child: (index) => Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  children: [
                    cCard(
                        shadow: true,
                        border: true,
                        borderColor: AppColors.mainColor,
                        color: Colors.white,
                        child: Padding(
                          padding: const EdgeInsets.all(12),
                          child: Column(
                            children: [
                              Row(
                                children: [
                                  Expanded(
                                    child: Column(
                                      mainAxisSize: MainAxisSize.min,
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        ctext('Overdue',
                                            fontSize: 16,
                                            fontWeight: FontWeight.w600),
                                        const SizedBox(
                                          height: 4,
                                        ),
                                        ctext('${krupee}35,800', fontSize: 14)
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        )),
                    const SizedBox(
                      height: 12,
                    ),
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
                                  title: 'Status',
                                  subTitle: cCard(
                                      radius: 4,
                                      color: Colors.green.withOpacity(0.3),
                                      border: true,
                                      borderColor: Colors.green,
                                      child: Padding(
                                        padding: const EdgeInsets.symmetric(
                                            vertical: 2, horizontal: 6),
                                        child:
                                            ctext('Paid', color: Colors.green),
                                      ))),
                              textWithHeading(
                                  title: 'Date', subTitle: '30 May 2023'),
                              textWithHeading(
                                  title: 'Number', subTitle: 'EST-2023-5'),
                              textWithHeading(
                                  title: 'Vendors', subTitle: 'Tulsi Chauhan'),
                              textWithHeading(
                                  title: 'Total', subTitle: 'INR 18,000'),
                              textWithHeading(
                                  title: 'Amount Due', subTitle: 'INR 3,000'),
                              widgetWithHeading(
                                  title: 'Action',
                                  subTitle: cDropDown(
                                      width: 200,
                                      borderColor: Colors.transparent,
                                      fillColor: AppColors.mainColor,
                                      hintText: '   Action',
                                      hintTextColor: Colors.white,
                                      iconColor: Colors.white,
                                      heightPadding: 2,
                                      items: [
                                        'View',
                                        'Send',
                                        'Record a payment',
                                        'Convert to invoice',
                                        'Preview as a customer',
                                        'Print',
                                        'Edit',
                                        'Delete'
                                      ]))
                            ],
                          ),
                        ))
                  ],
                ),
              )),
    );
  }
}
