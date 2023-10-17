import 'package:accountieons_flutter/routes/app_routes.dart';
import 'package:get/get.dart';

class SettingsController extends GetxController {
  List<SettingItems> settingItems = [
    SettingItems(
        icon: 's_bussiness',
        name: 'Business',
        onTap: () {
          Get.toNamed(AppRoutes.business);
        }),
    SettingItems(icon: 's_general', name: 'General Settings', onTap: () {}),
    SettingItems(
        icon: 's_manager',
        name: 'Manage Profile',
        onTap: () {
          Get.toNamed(AppRoutes.manageProfile);
        }),
    SettingItems(
        icon: 's_change',
        name: 'Change Password',
        onTap: () {
          Get.toNamed(AppRoutes.changePassword);
        }),
    SettingItems(
        icon: 's_invoice', name: 'Invoice Customization', onTap: () {}),
    SettingItems(icon: 's_role', name: 'Role Permissions', onTap: () {}),
    SettingItems(icon: 's_role_m', name: 'Role Management', onTap: () {}),
    SettingItems(icon: 's_subscription', name: 'Subscription', onTap: () {}),
    SettingItems(icon: 's_country', name: 'Country', onTap: () {}),
    SettingItems(icon: 's_tax', name: 'Tax', onTap: () {}),
    SettingItems(icon: 's_unit', name: 'Unit', onTap: () {}),
    SettingItems(icon: 's_payment', name: 'Payment Settings', onTap: () {}),
  ];
}

class SettingsBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => SettingsController(), fenix: true);
  }
}

class SettingItems {
  String icon;
  String name;
  Function() onTap;
  SettingItems({required this.icon, required this.name, required this.onTap});
}
