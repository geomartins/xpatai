import 'package:get/get.dart';
import 'package:xpatai/abstracts/controller_base.dart';

class OnboardingController extends GetxController with ControllerBase {
  //CONSTRUCTOR
  @override
  void onInit() {
    onCreate();
    super.onInit();
  }

  //STATE
  final _currentSlide = 0.obs;

  //GETTER
  int get currentSlide => _currentSlide.value;

  //MUTATION
  void updateCurrentSlide(int value) {
    _currentSlide.value = value;
  }

  @override
  void onCreate() {
    updateCurrentSlide(0);
  }
}
