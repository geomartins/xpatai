import 'package:get/get.dart';

import '../controllers/qa_controller.dart';

class QABinding extends Bindings {
  @override
  void dependencies() {
    Get.put<QAController>(QAController());
  }
}
