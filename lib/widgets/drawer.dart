import 'package:accountieons_flutter/constants/constants.dart';
import 'package:accountieons_flutter/utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../routes/app_routes.dart';
import 'sub_widgets/c_bounce.dart';
import 'sub_widgets/c_card.dart';
import 'sub_widgets/ctext.dart';

class CDrawer extends StatefulWidget {
  const CDrawer({super.key});

  @override
  State<CDrawer> createState() => _CDrawerState();
}

class _CDrawerState extends State<CDrawer> {
  int currIndex = 0;
  bool isExpand = false;
  @override
  Widget build(BuildContext context) {
    List<DrawerTile> drawerTile = [
      DrawerTile(
          icon: 'dashboard_color',
          title: "Dashboard",
          onPressed: () {
            Get.back();
            Get.toNamed(AppRoutes.dashboard);
          }),
      DrawerTile(
          icon: 'banking',
          title: "Banking",
          isDropDown: true,
          items: [
            DrawerTile(
                icon: '',
                title: "Bank/Cash",
                onPressed: () {
                  Get.back();
                  // Get.toNamed(AppRoutes.dashboard);
                }),
            DrawerTile(
                icon: '',
                title: "Loan System",
                onPressed: () {
                  Get.back();
                  // Get.toNamed(AppRoutes.dashboard);
                }),
            DrawerTile(
                icon: '',
                title: "Bank Transfer",
                onPressed: () {
                  Get.back();
                  // Get.toNamed(AppRoutes.dashboard);
                }),
            DrawerTile(
                icon: '',
                title: "All Transaction",
                onPressed: () {
                  Get.back();
                  // Get.toNamed(AppRoutes.dashboard);
                }),
          ],
          onPressed: () {
            Get.back();
            // Get.toNamed(AppRoutes.query);
          }),
      DrawerTile(
          icon: 'sales',
          title: "Sales",
          isDropDown: true,
          items: [
            DrawerTile(
                icon: '',
                title: "Customers",
                onPressed: () {
                  Get.back();
                  Get.toNamed(AppRoutes.customers);
                }),
            DrawerTile(
                icon: '',
                title: "Stocks & Services",
                onPressed: () {
                  Get.back();
                  Get.toNamed(AppRoutes.stockNService);
                }),
            DrawerTile(
                icon: '',
                title: "Estimates",
                onPressed: () {
                  Get.back();
                  Get.toNamed(AppRoutes.estimate);
                }),
            DrawerTile(
                icon: '',
                title: "Income",
                onPressed: () {
                  Get.back();
                  Get.toNamed(AppRoutes.income);
                }),
            DrawerTile(
                icon: '',
                title: "Delivery Challan",
                onPressed: () {
                  Get.back();
                  Get.toNamed(AppRoutes.deliveryChallan);
                }),
            DrawerTile(
                icon: '',
                title: "Invoices",
                onPressed: () {
                  Get.back();
                  Get.toNamed(AppRoutes.invoices);
                }),
            DrawerTile(
                icon: '',
                title: "Recurring Invoice",
                onPressed: () {
                  Get.back();
                  // Get.toNamed(AppRoutes.dashboard);
                }),
            DrawerTile(
                icon: '',
                title: "Sale Return / Dr Note",
                onPressed: () {
                  Get.back();
                  Get.toNamed(AppRoutes.saleReturn);
                }),
          ],
          onPressed: () {
            Get.back();
            Get.toNamed(AppRoutes.dashboard);
          }),
      DrawerTile(
          icon: 'purchase',
          title: "Purchase",
          isDropDown: true,
          items: [
            DrawerTile(
                icon: '',
                title: "Vendors",
                onPressed: () {
                  Get.back();
                  Get.toNamed(AppRoutes.vendors);
                }),
            DrawerTile(
                icon: '',
                title: "Stocks & Services",
                onPressed: () {
                  Get.back();
                  Get.toNamed(AppRoutes.stocknServicePurchase);
                }),
            DrawerTile(
                icon: '',
                title: "Expense",
                onPressed: () {
                  Get.back();
                  Get.toNamed(AppRoutes.expense);
                }),
            DrawerTile(
                icon: '',
                title: "Bills",
                onPressed: () {
                  Get.back();
                  Get.toNamed(AppRoutes.bills);
                }),
            DrawerTile(
                icon: '',
                title: "Bills Return / Dr Note",
                onPressed: () {
                  Get.back();
                  Get.toNamed(AppRoutes.billReturn);
                }),
          ],
          onPressed: () {
            Get.back();
            Get.toNamed(AppRoutes.dashboard);
          }),
      DrawerTile(
          icon: 'categories',
          title: "Categories",
          onPressed: () {
            Get.back();
            Get.toNamed(AppRoutes.categories);
          }),
      DrawerTile(
          icon: 'reports',
          title: "Reports",
          onPressed: () {
            Get.back();
            Get.toNamed(AppRoutes.dashboard);
          }),
    ];

    return Drawer(
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
              topRight: Radius.circular(20), bottomRight: Radius.circular(20))),
      backgroundColor: Colors.white,
      child: Column(
        children: [
          cCard(
            height: 180,
            color: AppColors.mainColor,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  'assets/icons/logo.png',
                  height: 80,
                ),
                const SizedBox(
                  width: 8,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ctext('ACCOUNTIEONS',
                        fontSize: 20,
                        fontWeight: FontWeight.w600,
                        color: Colors.white),
                    ctext('INVOICE, BILLING, REPORTS',
                        fontSize: 10,
                        fontWeight: FontWeight.w400,
                        color: Colors.white),
                  ],
                )
              ],
            ),
          ),
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: List.generate(
                          drawerTile.length,
                          (index) => drawerTileWidget(
                              index: index,
                              icon: drawerTile[index].icon,
                              title: drawerTile[index].title,
                              isDropDown: drawerTile[index].isDropDown,
                              onPressed: drawerTile[index].onPressed,
                              items: drawerTile[index].items)),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 50),
                    child: cCard(
                      height: 1.5,
                      color: Colors.grey[300],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(10).copyWith(top: 8),
                    child: drawerTileWidget(
                        index: 6,
                        icon: 'dashboard',
                        title: "Customer Support",
                        onPressed: () {
                          Get.back();
                          Get.toNamed(AppRoutes.dashboard);
                        }),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(10).copyWith(top: 0),
                    child: drawerTileWidget(
                        index: 7,
                        icon: 'setting',
                        title: "Settings",
                        onPressed: () {
                          Get.back();
                          Get.toNamed(AppRoutes.settings);
                        }),
                  ),
                  // const Spacer(),
                  Padding(
                    padding: const EdgeInsets.only(left: 10),
                    child: drawerTileWidget(
                      index: 100,
                      icon: 'logout',
                      title: 'Logout',
                      onPressed: () {
                        Get.back();
                        box.clear();
                        Get.offAllNamed(AppRoutes.loginScreen);
                      },
                    ),
                  ),
                  const SizedBox(
                    height: 12,
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget drawerTileWidget(
      {required String icon,
      required String title,
      required Function() onPressed,
      required int index,
      List<DrawerTile>? items,
      bool? isDropDown = false}) {
    return Column(
      children: [
        cBounce(
          onPressed: () {
            (isDropDown ?? false)
                ? currIndex == index
                    ? isExpand = !isExpand
                    : isExpand = true
                : onPressed();
            setState(() {
              currIndex = index;
            });
          },
          child: cCard(
            shadow: false,
            color: currIndex == index ? Colors.white : Colors.transparent,
            width: double.maxFinite,
            child: Padding(
              padding: const EdgeInsets.all(10),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Image.asset(
                        'assets/icons/$icon.png',
                        height: 26,
                        // color: currIndex == index ? Colors.black : Colors.white,
                      ),
                      const SizedBox(width: 20),
                      ctext(title,
                          color: index == 0
                              ? AppColors.mainColor
                              : AppColors.drawerText,
                          fontWeight: FontWeight.w500,
                          fontSize: 16),
                      const Spacer(),
                      isDropDown ?? false
                          ? Container(
                              child: Icon(
                                isExpand && currIndex == index
                                    ? Icons.keyboard_arrow_down_rounded
                                    : Icons.chevron_right_rounded,
                                color: Colors.black,
                              ),
                              // Image.asset(
                              //   'assets/icons/down_arrow.png',
                              //   width: 15,
                              //   color: currIndex == index
                              //       ? Colors.black
                              //       : Colors.white,
                              // ),
                            )
                          : const SizedBox()
                    ],
                  ),

                  // Flexible(
                  //   child: SizedBox(
                  //     height: bottomPadding ?? kPadding,
                  //   ),
                  // )
                ],
              ),
            ),
          ),
        ),
        SizedBox(
          height: (isExpand &&
                  currIndex == index &&
                  (isDropDown ?? false) &&
                  items != null)
              ? 4
              : 0,
        ),
        (isExpand &&
                currIndex == index &&
                (isDropDown ?? false) &&
                items != null)
            ? cCard(
                shadow: false,
                color: currIndex == index ? Colors.white : Colors.transparent,
                width: double.maxFinite,
                child: Padding(
                  padding: const EdgeInsets.all(10).copyWith(top: 0),
                  child: Column(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: List.generate(
                          items.length,
                          (i) => cBounce(
                                onPressed: items[i].onPressed,
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0).copyWith(
                                    left: 44,
                                    top: 0,
                                  ),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      // const Icon(
                                      //   Icons.circle,
                                      //   size: 8,
                                      //   color: AppColors.mainColor,
                                      // ),
                                      // const SizedBox(
                                      //   width: 8,
                                      // ),
                                      // Image.asset(items[i].icon,
                                      //     height: 18, color: Colors.black),
                                      // const SizedBox(width: 16),
                                      ctext(items[i].title,
                                          color: index == 0
                                              ? AppColors.mainColor
                                              : AppColors.drawerText,
                                          fontSize: 14),
                                    ],
                                  ),
                                ),
                              ))),
                ),
              )
            : const SizedBox()
      ],
    );
  }
}

class DrawerTile {
  String icon;
  String title;
  Function() onPressed;
  bool? isDropDown = false;
  List<DrawerTile>? items;

  DrawerTile(
      {required this.icon,
      required this.title,
      required this.onPressed,
      this.isDropDown,
      this.items});
}
