import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:get/get.dart';
import 'package:xpatai/modules/guest/screens/welcome.dart';
import '../../middlewares/is_guest.dart';

class AuthRoutes {
  static List<GetPage> all() {
    return [
      GetPage(name: Welcome.id, page: () => const Welcome(), middlewares: [
        IsGuest(priorityIndex: 3),
      ]),
    ];
  }
}
