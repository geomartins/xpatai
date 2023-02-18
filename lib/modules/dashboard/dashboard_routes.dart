import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:get/get.dart';
import 'package:xpatai/modules/dashboard/screens/dashboard.dart';
import 'package:xpatai/modules/dashboard/screens/profile.dart';
import 'package:xpatai/modules/dashboard/screens/profile_modify.dart';

class DashboardRoutes {
  static List<GetPage> all() {
    return [
      GetPage(name: Dashboard.id, page: () => Dashboard()),
      GetPage(name: Profile.id, page: () => Profile()),
      GetPage(name: ProfileModify.id, page: () => ProfileModify()),
    ];
  }
}
