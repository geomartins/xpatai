import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:get/get.dart';
import 'package:xpatai/modules/article/screens/article.dart';

class ArticleRoutes {
  static List<GetPage> all() {
    return [
      GetPage(name: Article.id, page: () => Article()),
    ];
  }
}
