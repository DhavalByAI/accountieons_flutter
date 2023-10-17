import 'package:flutter/material.dart';

import '../../utils/app_colors.dart';
import 'c_card.dart';
import 'ctext.dart';
import 'ctextfield_common.dart';

Widget cFormField(
    {TextEditingController? controller,
    Widget? dropDown,
    required String title,
    TextInputType? textInputType,
    int? maxlines}) {
  return Column(
    mainAxisAlignment: MainAxisAlignment.start,
    crossAxisAlignment: CrossAxisAlignment.start,
    mainAxisSize: MainAxisSize.min,
    children: [
      ctext(' $title', color: Colors.black, fontSize: 14),
      const SizedBox(
        height: 4,
      ),
      dropDown ??
          cCard(
              height: maxlines != null ? null : 40,
              color: AppColors.textFieldBG,
              child: Padding(
                padding: const EdgeInsets.all(4).copyWith(left: 12),
                child: cTextFieldCommon(
                  maxLines: maxlines,
                  textInputType: textInputType,
                  controller: controller,
                  fontColor: Colors.black,
                  cursorColor: Colors.black,
                ),
              )),
      const SizedBox(
        height: 12,
      ),
    ],
  );
}
