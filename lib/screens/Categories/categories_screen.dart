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

import 'categories_controller.dart';

class CategoriesScreen extends StatelessWidget {
  const CategoriesScreen({super.key});

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
              title: 'Add Category',
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: Column(
                  children: [
                    cFormField(title: 'Category Name *'),
                    GetBuilder<CategoriesController>(
                      initState: (_) {},
                      builder: (_) {
                        return cFormField(
                            title: 'Category Type *',
                            dropDown: cDropDown(
                                borderColor: Colors.transparent,
                                fillColor: AppColors.textFieldBG,
                                items: ['Income', 'Expense']));
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
          cAppBar: cAppBar(pageName: 'Categories'),
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
                              widgetWithHeading(
                                  title: 'Type',
                                  subTitle: Row(
                                    children: [
                                      cCard(
                                          color: Colors.green[100],
                                          border: true,
                                          borderColor: Colors.green,
                                          child: Padding(
                                            padding: const EdgeInsets.symmetric(
                                                horizontal: 4, vertical: 2),
                                            child: ctext('Income'),
                                          )),
                                    ],
                                  )),
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
