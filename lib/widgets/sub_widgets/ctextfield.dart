import 'package:accountieons_flutter/widgets/sub_widgets/c_bounce.dart';
import 'package:flutter/material.dart';

import 'c_card.dart';
import 'ctext.dart';
import 'ctextfield_common.dart';

Widget cTextFiled(
    {required String title,
    required cTextFieldCommon textField,
    required String icon,
    bool? isPassword,
    bool? isObsecure,
    Function()? onPressed}) {
  return cCard(
      child: Column(
    mainAxisAlignment: MainAxisAlignment.start,
    crossAxisAlignment: CrossAxisAlignment.start,
    mainAxisSize: MainAxisSize.min,
    children: [
      ctext(
        title,
        color: Colors.white,
        fontSize: 12,
      ),
      const SizedBox(
        height: 10,
      ),
      Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Image.asset(
            'assets/icons/$icon.png',
            height: 16,
            width: 16,
          ),
          const SizedBox(
            width: 12,
          ),
          Expanded(child: textField),
          isPassword ?? false
              ? Padding(
                  padding: const EdgeInsets.only(right: 8),
                  child: cBounce(
                    onPressed: onPressed,
                    child: Image.asset(
                      (isObsecure ?? false)
                          ? 'assets/icons/view_pass.png'
                          : 'assets/icons/hide_pass.png',
                      height: 20,
                      color: Colors.white,
                    ),
                  ),
                )
              : const SizedBox()
        ],
      ),
      const SizedBox(
        height: 8,
      ),
      cCard(height: 1.5, color: Colors.white24)
    ],
  ));
}
