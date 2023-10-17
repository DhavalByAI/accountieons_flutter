import 'package:accountieons_flutter/screens/Auth/login/user_model.dart';
import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';

class AppConst {
  static const int bounceDuration = 110;
  static const String baseUrl = "https://accountieons.com/api/";
  static const String baseImageUrl = "https://accountieons.com/";
}

var box = Hive.box('myBox');
final dio = Dio();
const double kPadding = 20;
var dheight = Get.height;
var dwidth = Get.width;
String krupee = '₹';
int dataLimit = 2;
UserData userData = UserData();
