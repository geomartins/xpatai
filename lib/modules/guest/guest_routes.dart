import 'package:xpatai/modules/guest/screens/page_not_found.dart';
import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:get/get.dart';
import 'package:xpatai/modules/guest/screens/welcome.dart';
import '../../middlewares/is_guest.dart';

class GuestRoutes {
  static List<GetPage> all() {
    return [
      GetPage(name: Welcome.id, page: () => const Welcome()),
      GetPage(name: PageNotFound.id, page: () => const PageNotFound()),
    ];
  }
}
