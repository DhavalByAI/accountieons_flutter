import 'package:accountieons_flutter/constants/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bounce/flutter_bounce.dart';

Bounce cBounce(
    {required Widget child,
    Duration duration = const Duration(milliseconds: AppConst.bounceDuration),
    void Function()? onPressed}) {
  return Bounce(
      duration: duration, onPressed: onPressed ?? () {}, child: child);
}
