import 'package:accountieons_flutter/utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'c_bounce.dart';
import 'c_card.dart';
import 'ctext.dart';

Future<dynamic> bottomSheet(
    {required BuildContext context,
    required String title,
    required Widget child,
    ScrollController? controller}) {
  return showModalBottomSheet(
    enableDrag: true,
    isScrollControlled: true,
    useSafeArea: true,
    backgroundColor: Colors.transparent,
    context: context,
    builder: (BuildContext context) {
      return SingleChildScrollView(
        controller: controller,
        child: Padding(
          padding: MediaQuery.of(context).viewInsets,
          child: cCard(
              color: Colors.white,
              borderRadius: const BorderRadius.only(
                  bottomLeft: Radius.circular(0),
                  bottomRight: Radius.circular(0),
                  topLeft: Radius.circular(24),
                  topRight: Radius.circular(24)),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const SizedBox(
                    height: 20 - 4,
                  ),
                  cCard(color: Colors.grey, height: 4, width: 45),
                  const SizedBox(
                    height: 20,
                  ),
                  cCard(
                      radius: 0,
                      color: AppColors.mainColor,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 24, vertical: 12),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            ctext(title, color: Colors.white, fontSize: 14),
                            cBounce(
                              onPressed: () {
                                Get.back();
                              },
                              child: const Icon(
                                Icons.cancel_rounded,
                                color: Colors.white,
                              ),
                            )
                          ],
                        ),
                      )),
                  child
                ],
              )),
        ),
      );
    },
  );
}
