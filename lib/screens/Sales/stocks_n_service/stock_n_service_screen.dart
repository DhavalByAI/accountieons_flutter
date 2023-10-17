import 'dart:developer';

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
import 'package:image_picker/image_picker.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'stock_n_service_controller.dart';

class StockNServiceScreen extends GetView<StockNServiceController> {
  const StockNServiceScreen({super.key});

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
            addUpdateData(isAdd: true, context: context);
          },
        ),
        body: GetBuilder<StockNServiceController>(
          initState: (_) {},
          builder: (_) {
            return ListViewPagination(
                cAppBar: cAppBar(
                    pageName: '(Sales)Stocks & Services',
                    suffix: cBounce(
                      onPressed: () {
                        bottomSheet(
                            context: context,
                            title: 'Filter',
                            child: Padding(
                              padding: const EdgeInsets.all(20),
                              child: Column(
                                children: [
                                  GetBuilder<StockNServiceController>(
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
                                  GetBuilder<StockNServiceController>(
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
                              title: 'Name',
                              subTitle: _.mainData[index]['name']),
                          widgetWithHeading(
                              title: 'HSN / SAC Code',
                              subTitle: _.mainData[index]['pro_type'] == '1'
                                  ? Row(
                                      children: [
                                        cCard(
                                            radius: 4,
                                            color: Colors.green[100],
                                            child: Padding(
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                      horizontal: 4),
                                              child: Row(
                                                children: [
                                                  ctext('HSN',
                                                      color: Colors.green),
                                                ],
                                              ),
                                            )),
                                        const SizedBox(
                                          width: 4,
                                        ),
                                        ctext(
                                          _.mainData[index]['hsn_code']
                                              .toString(),
                                        )
                                      ],
                                    )
                                  : Row(
                                      children: [
                                        cCard(
                                            radius: 4,
                                            color: Colors.blue[100],
                                            child: Padding(
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                      horizontal: 4),
                                              child: Row(
                                                children: [
                                                  ctext('SAC',
                                                      color: Colors.blue),
                                                ],
                                              ),
                                            )),
                                        const SizedBox(
                                          width: 4,
                                        ),
                                        ctext(
                                          _.mainData[index]['hsn_code']
                                              .toString(),
                                        )
                                      ],
                                    )),
                          textWithHeading(
                              title: 'Price',
                              subTitle: _.mainData[index]['price'].toString()),
                          textWithHeading(
                              title: 'Quantity',
                              subTitle:
                                  _.mainData[index]['quantity'].toString()),
                          textWithHeading(
                              title: 'Unit',
                              subTitle: _.mainData[index]['unit'].toString()),
                          widgetWithHeading(
                              title: 'Type',
                              subTitle: Row(
                                children: [
                                  _.mainData[index]['is_buy'] == '1'
                                      ? cCard(
                                          radius: 4,
                                          color: AppColors.radiumGreen,
                                          child: Padding(
                                            padding: const EdgeInsets.symmetric(
                                                horizontal: 6, vertical: 2),
                                            child: ctext('Purchases'),
                                          ))
                                      : const SizedBox(),
                                  const SizedBox(
                                    width: 6,
                                  ),
                                  _.mainData[index]['is_sell'] == '1'
                                      ? cCard(
                                          radius: 4,
                                          color: AppColors.radiumRed,
                                          child: Padding(
                                            padding: const EdgeInsets.symmetric(
                                                horizontal: 6, vertical: 2),
                                            child: ctext('Sales'),
                                          ))
                                      : const SizedBox(),
                                ],
                              )),
                          widgetWithHeading(
                              title: 'Action',
                              subTitle: Row(
                                children: [
                                  cBounce(
                                    onPressed: () {
                                      addUpdateData(
                                          isAdd: false,
                                          context: context,
                                          index: index);
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
                    )));
          },
        ));
  }

  addUpdateData(
      {required BuildContext context, required bool isAdd, int? index}) {
    StockNServiceController _ = Get.find();
    if (isAdd) {
      log('Adding Customer');
      _.name.clear();
      _.hsnCode.clear();
      _.isBoth = false;
      _.productDetails.clear();
      _.price.clear();
      _.qyt.clear();
      _.selectedTax = 0;
      _.selectedCountry = null;
      _.productImage = null;
    } else {
      _.name.text = _.mainData[index!]['name'].toString();
      _.hsnCode.text = _.mainData[index]['hsn_code'].toString();
      _.productDetails.text = _.mainData[index]['details'].toString();
      _.price.text = _.mainData[index]['price'].toString();
      _.qyt.text = _.mainData[index]['quantity'].toString();
      _.selectedTax = int.parse(_.mainData[index]['pro_type'].toString()) - 1;
      _.productImage = null;
      var tmpCountry = _.listOfUnit.firstWhereOrNull((element) =>
          element['unit'].toString() == _.mainData[index]['unit'].toString());
      tmpCountry != null
          ? _.selectedCountry = _.listOfUnit.indexOf(tmpCountry)
          : _.selectedCountry = null;
      _.mainData[index]['is_sell'].toString() == '1' &&
              _.mainData[index]['is_buy'].toString() == '1'
          ? _.isBoth = true
          : null;
    }
    _.update();
    bottomSheet(
        context: context,
        title: 'Add Product',
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [
              GetBuilder<StockNServiceController>(
                initState: (_) {},
                builder: (_) {
                  return cFormField(
                      title: 'Types *',
                      dropDown: cDropDown(
                          borderColor: Colors.transparent,
                          fillColor: AppColors.textFieldBG,
                          value: _.selectedTax,
                          onChanged: (p0) {
                            _.selectedType = p0!;
                            _.update();
                          },
                          items: _.taxTpye));
                },
              ),
              GetBuilder<StockNServiceController>(
                initState: (_) {},
                builder: (_) {
                  return cFormField(
                      textInputType: TextInputType.number,
                      controller: _.hsnCode,
                      title: _.selectedType == 0 ? 'HSN Code *' : 'SAC Code *');
                },
              ),
              GetBuilder<StockNServiceController>(
                initState: (_) {},
                builder: (_) {
                  return cFormField(title: 'Product Name', controller: _.name);
                },
              ),
              GetBuilder<StockNServiceController>(
                initState: (_) {},
                builder: (_) {
                  return cFormField(
                      textInputType: TextInputType.number,
                      title: 'Price *',
                      controller: _.price);
                },
              ),
              GetBuilder<StockNServiceController>(
                initState: (_) {},
                builder: (_) {
                  return cFormField(
                      textInputType: TextInputType.number,
                      title: 'Product Stock Quantity *',
                      controller: _.qyt);
                },
              ),
              GetBuilder<StockNServiceController>(
                initState: (_) {},
                builder: (_) {
                  return cFormField(
                      title: 'Unit',
                      dropDown: cDropDown(
                          borderColor: Colors.transparent,
                          fillColor: AppColors.textFieldBG,
                          value: _.selectedCountry,
                          onChanged: (p0) {
                            _.selectedCountry = p0;
                          },
                          items: List.generate(_.listOfUnit.length,
                              (index) => _.listOfUnit[index]['unit'])));
                },
              ),
              GetBuilder<StockNServiceController>(
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
                      ctext('Add Product for both type (Sales & Purchases)'),
                    ],
                  );
                },
              ),
              const SizedBox(
                height: 12,
              ),
              GetBuilder<StockNServiceController>(
                initState: (_) {},
                builder: (_) {
                  return cFormField(
                      title: 'Product Image',
                      dropDown: cBounce(
                        onPressed: () async {
                          final ImagePicker picker = ImagePicker();
                          _.productImage = await picker.pickImage(
                              source: ImageSource.gallery);
                          _.update();
                        },
                        child: cCard(
                            height: 40,
                            color: AppColors.textFieldBG,
                            child: Padding(
                              padding:
                                  const EdgeInsets.all(4).copyWith(left: 12),
                              child: SizedBox(
                                // width: double.maxFinite,
                                child: _.productImage != null
                                    ? Row(
                                        // mainAxisAlignment:
                                        //     MainAxisAlignment.spaceBetween,
                                        children: [
                                          Expanded(
                                              child: ctext(
                                                  minFontSize: 10,
                                                  _.productImage!.name,
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                  maxLines: 1)),
                                          cBounce(
                                              onPressed: () {
                                                _.productImage = null;
                                                _.update();
                                              },
                                              child: const Icon(
                                                  Icons.cancel_outlined)),
                                          const SizedBox(
                                            width: 8,
                                          ),
                                        ],
                                      )
                                    : const Row(),
                              ),
                            )),
                      ));
                },
              ),
              cFormField(
                  title: 'Product Details',
                  maxlines: 4,
                  controller: _.productDetails),
              const SizedBox(
                height: 8,
              ),
              Center(
                child: cButton(
                  onTap: () {
                    _.addData(isAdd,
                        id: _.mainData[index!]['id'].toString(), index: index);
                  },
                  'Save',
                ),
              )
            ],
          ),
        ));
  }
}
