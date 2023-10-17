import 'package:accountieons_flutter/widgets/sub_widgets/c_bounce.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'sub_widgets/c_card.dart';
import 'sub_widgets/ctext.dart';

Widget cAppBar({String? pageName, Widget? leading, Widget? suffix}) {
  return cCard(
      color: Colors.white,
      height: 75,
      borderRadius: const BorderRadius.only(
          bottomLeft: Radius.circular(25), bottomRight: Radius.circular(25)),
      shadow: true,
      child: Padding(
        padding: const EdgeInsets.only(left: 15, top: 15),
        child: Row(
          children: [
            leading ??
                cBounce(
                    onPressed: () {
                      Get.back();
                    },
                    child: const Icon(
                      Icons.chevron_left_rounded,
                      size: 28,
                    )),
            const SizedBox(
              width: 16,
            ),
            pageName != null
                ? ctext(pageName,
                    color: Colors.black,
                    fontSize: 18,
                    fontWeight: FontWeight.w600)
                : const SizedBox(),
            const Spacer(),
            suffix ?? const SizedBox(),
            const SizedBox(
              width: 18,
            ),
          ],
        ),
      ));
}
