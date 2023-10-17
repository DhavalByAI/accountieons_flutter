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
import 'stock_n_service_purchase_controller.dart';

class StockNServicePurchaseScreen extends StatelessWidget {
  const StockNServicePurchaseScreen({super.key});

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
              title: 'Add Product',
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: Column(
                  children: [
                    GetBuilder<StockNServicePurchaseController>(
                      initState: (_) {},
                      builder: (_) {
                        return cFormField(
                            title: 'Types *',
                            dropDown: cDropDown(
                                borderColor: Colors.transparent,
                                fillColor: AppColors.textFieldBG,
                                onChanged: (p0) {
                                  _.selectedType = p0!;
                                  _.update();
                                },
                                items: _.types));
                      },
                    ),
                    GetBuilder<StockNServicePurchaseController>(
                      initState: (_) {},
                      builder: (_) {
                        return cFormField(
                            title: _.selectedType == 0
                                ? 'HSN Code *'
                                : 'SAC Code *');
                      },
                    ),
                    cFormField(title: 'Product Name'),
                    cFormField(title: 'Price *'),
                    cFormField(title: 'Product Stock Quantity *'),
                    GetBuilder<StockNServicePurchaseController>(
                      initState: (_) {},
                      builder: (_) {
                        return cFormField(
                            title: 'Unit',
                            dropDown: cDropDown(
                                borderColor: Colors.transparent,
                                fillColor: AppColors.textFieldBG,
                                onChanged: (p0) {},
                                items: ['Dozen', 'Gram', 'Etc']));
                      },
                    ),
                    GetBuilder<StockNServicePurchaseController>(
                      initState: (_) {},
                      builder: (_) {
                        return Row(
                          children: [
                            SizedBox(
                              height: 30,
                              width: 30,
                              child: Checkbox(
                                value: _.isBoth,
                                onChanged: (value) {
                                  _.isBoth = value ?? false;
                                  _.update();
                                },
                              ),
                            ),
                            ctext(
                                'Add Product for both type (Sales & Purchases)'),
                          ],
                        );
                      },
                    ),
                    const SizedBox(
                      height: 12,
                    ),
                    cFormField(title: 'Product Image'),
                    cFormField(title: 'Product Details', maxlines: 4),
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
      body: ListViewPagination(
          cAppBar: cAppBar(
              pageName: '(Purchase)Stocks & Services',
              suffix: cBounce(
                onPressed: () {
                  bottomSheet(
                      context: context,
                      title: 'Filter',
                      child: Padding(
                        padding: const EdgeInsets.all(20),
                        child: Column(
                          children: [
                            GetBuilder<StockNServicePurchaseController>(
                              initState: (_) {},
                              builder: (_) {
                                return cFormField(
                                    title: 'Product Name',
                                    dropDown: cDropDown(
                                        borderColor: Colors.transparent,
                                        fillColor: AppColors.textFieldBG,
                                        onChanged: (p0) {},
                                        items: ['Dozen', 'Gram', 'Etc']));
                              },
                            ),
                            GetBuilder<StockNServicePurchaseController>(
                              initState: (_) {},
                              builder: (_) {
                                return cFormField(
                                    title: 'Unit',
                                    dropDown: cDropDown(
                                        borderColor: Colors.transparent,
                                        fillColor: AppColors.textFieldBG,
                                        onChanged: (p0) {},
                                        items: ['Dozen', 'Gram', 'Etc']));
                              },
                            ),
                            cFormField(
                              title: 'HSN/SAC Code',
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
                                  title: 'Name', subTitle: 'IPhone'),
                              widgetWithHeading(
                                  title: 'HSN / SAC Code',
                                  subTitle: Row(
                                    children: [
                                      cCard(
                                          radius: 4,
                                          color: Colors.green[200],
                                          child: Padding(
                                            padding: const EdgeInsets.symmetric(
                                                horizontal: 4),
                                            child: Row(
                                              children: [
                                                ctext('HSN',
                                                    color: Colors.black54),
                                              ],
                                            ),
                                          )),
                                      const SizedBox(
                                        width: 4,
                                      ),
                                      ctext(
                                        '85171912',
                                      )
                                    ],
                                  )),
                              textWithHeading(
                                  title: 'Price', subTitle: '7573063415'),
                              textWithHeading(
                                  title: 'Quantity',
                                  subTitle: 'tulsi@softieons.com'),
                              textWithHeading(
                                  title: 'Unit',
                                  subTitle: 'United Arab Emirates'),
                              widgetWithHeading(
                                  title: 'Type',
                                  subTitle: Row(
                                    children: [
                                      cCard(
                                          radius: 4,
                                          border: true,
                                          borderColor: Colors.green,
                                          color: AppColors.radiumGreen,
                                          child: Padding(
                                            padding: const EdgeInsets.symmetric(
                                                horizontal: 6, vertical: 2),
                                            child: ctext('Purchases'),
                                          )),
                                      const SizedBox(
                                        width: 6,
                                      ),
                                      cCard(
                                          radius: 4,
                                          border: true,
                                          borderColor: Colors.red,
                                          color: AppColors.radiumRed,
                                          child: Padding(
                                            padding: const EdgeInsets.symmetric(
                                                horizontal: 6, vertical: 2),
                                            child: ctext('Sales'),
                                          ))
                                    ],
                                  )),
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
