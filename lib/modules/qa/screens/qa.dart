import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../config/palletefy.dart';
import '../../../utils/keyboard_control.dart';
import '../../../widgets/annotated_region_widget.dart';
import '../../../widgets/bottom_navigation_bar_widget.dart';
import '../../../widgets/internet_connectivity_widget.dart';
import '../controllers/qa_controller.dart';

class QA extends GetView<QAController> with Keyboard, Palletefy {
  static const String id = "/questions_answers";
  QA({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegionWidget(
      child: Scaffold(
          bottomNavigationBar: const BottomNavigationBarWidget(
            currentIndex: 2,
          ),
          body: InternetConnectivityWidget(
            child: SingleChildScrollView(
              child: Text('QA'),
            ),
          )),
    );
  }
}
