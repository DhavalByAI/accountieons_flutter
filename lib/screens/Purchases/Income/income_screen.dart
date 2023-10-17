import 'package:accountieons_flutter/constants/constants.dart';
import 'package:accountieons_flutter/routes/app_routes.dart';
import 'package:accountieons_flutter/screens/Sales/Income/income_controller.dart';
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

class IncomeScreen extends StatelessWidget {
  const IncomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            heroTag: 'category',
            backgroundColor: AppColors.mainColor,
            tooltip: 'Add New Category',
            onPressed: () {
              Get.toNamed(AppRoutes.categories);
            },
            child: Image.asset(
              'assets/icons/add_category.png',
              height: 24,
            ),
          ),
          const SizedBox(
            height: 12,
          ),
          FloatingActionButton(
            backgroundColor: AppColors.mainColor,
            child: const Icon(
              Icons.add,
              size: 30,
            ),
            onPressed: () {
              bottomSheet(
                  context: context,
                  title: 'Add Income',
                  child: Padding(
                    padding: const EdgeInsets.all(20),
                    child: Column(
                      children: [
                        GetBuilder<IncomeController>(
                          initState: (_) {},
                          builder: (_) {
                            return cFormField(
                                title: 'Select Bank',
                                dropDown: cDropDown(
                                    borderColor: Colors.transparent,
                                    fillColor: AppColors.textFieldBG,
                                    onChanged: (p0) {},
                                    items: ['HDFC Bank', 'Axis Bank']));
                          },
                        ),
                        cFormField(title: 'Income Amount *'),
                        GetBuilder<IncomeController>(
                          initState: (_) {},
                          builder: (_) {
                            return cFormField(
                                title: 'Income Category *',
                                dropDown: cDropDown(
                                    borderColor: Colors.transparent,
                                    fillColor: AppColors.textFieldBG,
                                    onChanged: (p0) {},
                                    items: ['Dozen', 'Gram', 'Etc']));
                          },
                        ),
                        cFormField(
                            title: 'Date *',
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
                                    child: ctext('08 May 2023', fontSize: 14),
                                  )),
                            )),
                        cFormField(title: 'Choose Image'),
                        cFormField(title: 'Notes', maxlines: 4),
                        const SizedBox(
                          height: 8,
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
        ],
      ),
      body: ListViewPagination(
          cAppBar: cAppBar(
              pageName: 'Income',
              suffix: cBounce(
                onPressed: () {
                  bottomSheet(
                      context: context,
                      title: 'Filter',
                      child: Padding(
                        padding: const EdgeInsets.all(20),
                        child: Column(
                          children: [
                            GetBuilder<IncomeController>(
                              initState: (_) {},
                              builder: (_) {
                                return cFormField(
                                    title: 'Category',
                                    dropDown: cDropDown(
                                        borderColor: Colors.transparent,
                                        fillColor: AppColors.textFieldBG,
                                        onChanged: (p0) {},
                                        items: [
                                          'select',
                                          'All Customer',
                                          'Dinesh',
                                          'Ashok'
                                        ]));
                              },
                            ),
                            GetBuilder<IncomeController>(
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
                            GetBuilder<IncomeController>(
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
                        color: Colors.white,
                        borderColor: Colors.black12,
                        child: Padding(
                          padding: const EdgeInsets.all(8).copyWith(bottom: 3),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              textWithHeading(
                                  title: 'Date', subTitle: '20 Sep 2023'),
                              textWithHeading(
                                  title: 'Bank Name',
                                  subTitle: 'Current Account - (0)'),
                              textWithHeading(
                                  title: 'Amount', subTitle: 'INR 45.00'),
                              textWithHeading(
                                  title: 'Category', subTitle: 'Electronics'),
                              textWithHeading(title: 'Notes', subTitle: 'Test'),
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
                                      const SizedBox(
                                        width: 8,
                                      ),
                                      CircleAvatar(
                                        radius: 12,
                                        backgroundColor: AppColors.iconButtonBG,
                                        child: Image.asset(
                                          'assets/icons/download.png',
                                          height: 14,
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
