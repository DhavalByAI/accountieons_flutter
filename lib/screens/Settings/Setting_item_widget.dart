import 'package:accountieons_flutter/widgets/sub_widgets/c_bounce.dart';
import 'package:accountieons_flutter/widgets/sub_widgets/ctext.dart';
import 'package:flutter/material.dart';
import 'settings_controller.dart';

Widget SettingItem(SettingItems settingItems) {
  return cBounce(
    onPressed: settingItems.onTap,
    child: Padding(
      padding: const EdgeInsets.all(10),
      child: Row(
        children: [
          SizedBox(
            width: 24,
            child: Image.asset(
              'assets/icons/${settingItems.icon}.png',
              height: 24,
              fit: BoxFit.scaleDown,
            ),
          ),
          const SizedBox(
            width: 16,
          ),
          ctext(settingItems.name, fontSize: 14, fontWeight: FontWeight.w600),
          const Spacer(),
          const Icon(Icons.chevron_right_rounded)
        ],
      ),
    ),
  );
}
