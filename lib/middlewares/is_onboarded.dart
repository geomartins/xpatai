import 'package:flutter/material.dart';
import 'package:get/get.dart';

class IsOnboarded extends GetMiddleware {
  int? priorityIndex;

  IsOnboarded({int? priorityIndex});

  @override
  int get priority => priorityIndex ?? -8;

  @override
  RouteSettings? redirect(String? route) {
    // If user has completed onboarding, move to [Welcome] Screen
    //print('..................... IsOnboarded Middleware');
    // print(
    //     '..................... onboarding is -- ${Session().read('onboarding')}');

    // return Session().read('onboarding') == null
    //     ? null
    //     : const RouteSettings(name: Welcome.id);

    return null;
  }

  @override
  void onPageDispose() {
    //print('PageDisposed');
  }
}
