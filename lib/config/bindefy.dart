import 'package:get/get.dart';
import 'package:xpatai/modules/auth/controllers/login_controller.dart';
import 'package:xpatai/modules/dashboard/controllers/dashboard_controller.dart';

class Bindefy implements Bindings {
  @override
  void dependencies() {
    Get.put<LoginController>(LoginController());
    Get.put<DashboardController>(DashboardController());
  }
}
