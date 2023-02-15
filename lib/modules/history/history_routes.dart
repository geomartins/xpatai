import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:get/get.dart';
import 'package:xpatai/modules/history/screens/history.dart';

class HistoryRoutes {
  static List<GetPage> all() {
    return [
      GetPage(name: History.id, page: () => History()),
    ];
  }
}
