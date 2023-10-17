import 'package:accountieons_flutter/screens/Categories/categories_controller.dart';
import 'package:accountieons_flutter/screens/Categories/categories_screen.dart';
import 'package:accountieons_flutter/screens/Dashboard/dashboard_controller.dart';
import 'package:accountieons_flutter/screens/Dashboard/dashboard_screen.dart';
import 'package:accountieons_flutter/screens/Purchases/Bills%20Return/bills_return_controller.dart';
import 'package:accountieons_flutter/screens/Purchases/Bills%20Return/bills_return_screen.dart';
import 'package:accountieons_flutter/screens/Purchases/Bills/bills_controller.dart';
import 'package:accountieons_flutter/screens/Purchases/Bills/bills_screen.dart';
import 'package:accountieons_flutter/screens/Purchases/Expense/expense_controller.dart';
import 'package:accountieons_flutter/screens/Purchases/Expense/expense_screen.dart';
import 'package:accountieons_flutter/screens/Purchases/Vendors/vendors_controller.dart';
import 'package:accountieons_flutter/screens/Purchases/Vendors/vendors_screen.dart';
import 'package:accountieons_flutter/screens/Purchases/stocks_n_service(purchase)/stock_n_service_purchase_controller.dart';
import 'package:accountieons_flutter/screens/Purchases/stocks_n_service(purchase)/stock_n_service_purchase_screen.dart';
import 'package:accountieons_flutter/screens/Sales/Delivery_challan/delivery_challan_controller.dart';
import 'package:accountieons_flutter/screens/Sales/Delivery_challan/delivery_challan_screen.dart';
import 'package:accountieons_flutter/screens/Sales/Estimates/estimates_controller.dart';
import 'package:accountieons_flutter/screens/Sales/Estimates/estimates_screen.dart';
import 'package:accountieons_flutter/screens/Sales/Income/income_controller.dart';
import 'package:accountieons_flutter/screens/Sales/Income/income_screen.dart';
import 'package:accountieons_flutter/screens/Sales/Invoices/invoices_controller.dart';
import 'package:accountieons_flutter/screens/Sales/Invoices/invoices_screen.dart';
import 'package:accountieons_flutter/screens/Sales/Sale%20Return/sale_return_controller.dart';
import 'package:accountieons_flutter/screens/Sales/Sale%20Return/sale_return_screen.dart';
import 'package:accountieons_flutter/screens/Sales/customers/customer_controller.dart';
import 'package:accountieons_flutter/screens/Sales/customers/customer_screen.dart';
import 'package:accountieons_flutter/screens/Sales/stocks_n_service/stock_n_service_controller.dart';
import 'package:accountieons_flutter/screens/Sales/stocks_n_service/stock_n_service_screen.dart';
import 'package:accountieons_flutter/screens/Settings/Business/business_controller.dart';
import 'package:accountieons_flutter/screens/Settings/Business/business_screen.dart';
import 'package:accountieons_flutter/screens/Settings/Change%20Password/change_password_screen.dart';
import 'package:accountieons_flutter/screens/Settings/General%20Setting/general_setting_controller.dart';
import 'package:accountieons_flutter/screens/Settings/General%20Setting/general_setting_screen.dart';
import 'package:accountieons_flutter/screens/Settings/Manage%20Profile/manage_profile_controller.dart';
import 'package:accountieons_flutter/screens/Settings/Manage%20Profile/manage_profile_screen.dart';
import 'package:accountieons_flutter/screens/Settings/settings_controller.dart';
import 'package:accountieons_flutter/screens/Settings/settings_screen.dart';
import 'package:accountieons_flutter/screens/Auth/login/login_controller.dart';
import 'package:accountieons_flutter/screens/Auth/login/login_screen.dart';
import 'package:accountieons_flutter/screens/splash/splash_controller.dart';
import 'package:accountieons_flutter/screens/splash/splash_screen.dart';
import 'package:get/get.dart';

class AppRoutes {
  static const String splash = "/splash";
  static const String loginScreen = "/loginScreen";
  static const String dashboard = "/dashboard";
  static const String customers = "/customers";
  static const String stockNService = "/stockNService";
  static const String estimate = "/estimate";
  static const String income = "/income";
  static const String expense = "/expense";
  static const String categories = "/categories";
  static const String deliveryChallan = "/deliveryChallan";
  static const String invoices = "/invoices";
  static const String saleReturn = "/saleReturn";
  static const String billReturn = "/billReturn";
  static const String vendors = "/vendors";
  static const String stocknServicePurchase = "/stocknServicePurchase";
  static const String bills = "/bills";
  static const String settings = "/settings";
  static const String business = "/business";
  static const String generalSettings = "/generalSettings";
  static const String changePassword = "/changePassword";
  static const String manageProfile = "/manageProfile";

  static List<GetPage> pages = [
    GetPage(
        name: splash,
        page: () => const SplashScreen(),
        bindings: [InitialBindings()]),
    GetPage(
        name: loginScreen,
        page: () => const LoginScreen(),
        bindings: [LoginBindings()]),
    GetPage(
        name: dashboard,
        page: () => Dashboard(),
        bindings: [DashboardBindings()]),
    GetPage(
        name: customers,
        page: () => const CustomerScreen(),
        bindings: [CustomerBindings()]),
    GetPage(
        name: stockNService,
        page: () => const StockNServiceScreen(),
        bindings: [StockNServiceBindings()]),
    GetPage(
        name: estimate,
        page: () => const EstimateScreen(),
        bindings: [EstimateBindings()]),
    GetPage(
        name: income,
        page: () => const IncomeScreen(),
        bindings: [IncomeBindings()]),
    GetPage(
        name: deliveryChallan,
        page: () => const DeliveryChallanScreen(),
        bindings: [DeliveryChallanBindings()]),
    GetPage(
        name: invoices,
        page: () => const InvoicesScreen(),
        bindings: [InvoicesBindings()]),
    GetPage(
        name: saleReturn,
        page: () => const SaleReturnScreen(),
        bindings: [SaleReturnBindings()]),
    GetPage(
        name: vendors,
        page: () => const VendorsScreen(),
        bindings: [VendorsBindings()]),
    GetPage(
        name: stocknServicePurchase,
        page: () => const StockNServicePurchaseScreen(),
        binding: StockNServicePurchaseBindings()),
    GetPage(
        name: expense,
        page: () => const ExpenseScreen(),
        bindings: [ExpenseBindings()]),
    GetPage(
        name: bills,
        page: () => const BillsScreen(),
        bindings: [BillsBindings()]),
    GetPage(
        name: billReturn,
        page: () => const BillsReturnScreen(),
        bindings: [BillsReturnBindings()]),
    GetPage(
        name: settings,
        page: () => const SettingsScreen(),
        bindings: [SettingsBindings()]),
    GetPage(
        name: categories,
        page: () => const CategoriesScreen(),
        bindings: [CategoriesBindings()]),
    GetPage(
        name: business,
        page: () => const BusinessScreen(),
        bindings: [BusinessBindings()]),
    GetPage(
        name: generalSettings,
        page: () => const GeneralSettingsScreen(),
        bindings: [GeneralSettingsBindings()]),
    GetPage(
        name: changePassword,
        page: () => const ChangePasswordScreen(),
        bindings: [ChangePasswordBindings()]),
    GetPage(
        name: manageProfile,
        page: () => const ManageProfileScreen(),
        bindings: [ManageProfileBindings()]),
  ];
}
