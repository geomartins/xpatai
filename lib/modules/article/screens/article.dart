import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../config/palletefy.dart';
import '../../../utils/keyboard_control.dart';
import '../../../widgets/annotated_region_widget.dart';
import '../../../widgets/bottom_navigation_bar_widget.dart';
import '../../../widgets/internet_connectivity_widget.dart';
import '../controllers/article_controller.dart';

class Article extends GetView<ArticleController> with Keyboard, Palletefy {
  static const String id = "/article";
  Article({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegionWidget(
      child: Scaffold(
          bottomNavigationBar: const BottomNavigationBarWidget(
            currentIndex: 3,
          ),
          body: InternetConnectivityWidget(
            child: SingleChildScrollView(
              child: Text('Article'),
            ),
          )),
    );
  }
}
