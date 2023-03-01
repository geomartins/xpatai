import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:get/get.dart';
import 'package:xpatai/modules/dashboard/bindings/dashboard_binding.dart';
import 'package:xpatai/modules/dashboard/bindings/profile_binding.dart';
import 'package:xpatai/modules/dashboard/screens/dashboard.dart';
import 'package:xpatai/modules/dashboard/screens/profile.dart';
import 'package:xpatai/modules/dashboard/screens/profile_modify.dart';

class DashboardRoutes {
  static List<GetPage> all() {
    return [
      GetPage(
        name: Dashboard.id,
        page: () => Dashboard(),
        binding: DashboardBinding(),
      ),
      GetPage(
        name: Profile.id,
        page: () => Profile(),
        binding: ProfileBinding(),
      ),
      GetPage(
        name: ProfileModify.id,
        page: () => ProfileModify(),
        binding: ProfileBinding(),
      ),
    ];
  }
}
