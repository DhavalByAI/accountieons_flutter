import 'package:accountieons_flutter/utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'c_bounce.dart';
import 'ctext.dart';

Widget cButton(String text,
    {double? height,
    double? width,
    String? icon,
    double? iconHeight,
    double? iconWidth,
    Function()? onTap,
    double? fontSize,
    FontWeight? fontWeight,
    EdgeInsetsGeometry? padding,
    Color? btnColor,
    Color? txtColor,
    Color? iconColor,
    BoxBorder? border}) {
  return cBounce(
    onPressed: onTap,
    child: Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
          decoration: BoxDecoration(
              border: border,
              color: btnColor ?? AppColors.mainColor,
              borderRadius: BorderRadius.circular(12)),
          child: Center(
              child: Padding(
            padding: padding ??
                const EdgeInsets.symmetric(horizontal: 40, vertical: 10),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                icon != null
                    ? Padding(
                        padding: const EdgeInsets.only(right: 6),
                        child: Image.asset(
                          icon,
                          color: iconColor,
                          height: iconHeight ?? 16,
                          width: iconWidth ?? 16,
                        ),
                      )
                    : const SizedBox(),
                ctext(text,
                    color: txtColor ?? Colors.white,
                    fontSize: fontSize ?? 14,
                    fontWeight: fontWeight ?? FontWeight.w600),
              ],
            ),
          )),
        ),
      ],
    ),
  );
}
