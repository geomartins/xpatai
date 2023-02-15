import 'package:get/get.dart';
import 'package:xpatai/modules/article/article_routes.dart';
import 'package:xpatai/modules/auth/auth_routes.dart';
import 'package:xpatai/modules/dashboard/dashboard_routes.dart';
import 'package:xpatai/modules/guest/guest_routes.dart';
import 'package:xpatai/modules/guest/screens/welcome.dart';
import 'package:xpatai/modules/history/history_routes.dart';
import 'package:xpatai/modules/qa/qa_routes.dart';
import '../modules/guest/screens/page_not_found.dart';

class Routefy {
  static String initial = Welcome.id;
  static Transition defaultTransition = Transition.fadeIn;
  static GetPage unknownRoute = GetPage(
    name: PageNotFound.id,
    page: () => const PageNotFound(),
  );

  static List<GetPage> all() {
    return [
      ...GuestRoutes.all(),
      ...AuthRoutes.all(),
      ...DashboardRoutes.all(),
      ...QARoutes.all(),
      ...ArticleRoutes.all(),
      ...HistoryRoutes.all(),
    ];
  }
}
