import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:get/get.dart';
import 'package:xpatai/modules/qa/screens/qa.dart';

class QARoutes {
  static List<GetPage> all() {
    return [
      GetPage(name: QA.id, page: () => QA()),
    ];
  }
}
