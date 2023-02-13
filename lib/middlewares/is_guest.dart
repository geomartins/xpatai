import 'package:flutter/material.dart';
import 'package:get/get.dart';

class IsGuest extends GetMiddleware {
  int? priorityIndex;

  IsGuest({int? priorityIndex});

  @override
  int get priority => priorityIndex ?? -8;

  @override
  RouteSettings? redirect(String? route) {
    // If user has token, move to [Dashboard] Screen
    //print('..................... IsOGuest Middleware');
    //print('..................... token is -- ${Session().read('token')}');

    // bool _isLoggedIn =
    //     Get.put<SessionController>(SessionController()).isLoggedIn;
    // return (_isLoggedIn == false || Session().read('token') == null)
    //     ? null
    //     : const RouteSettings(name: '/dashboard');
    return null;

    // if (Session().read('bg') == true) {
    //   Session().remove('token');
    //   Session().write('bg', false);
    // }
    // return Session().read('token') == null
    //     ? null
    //     : const RouteSettings(name: '/dashboard');
  }

  @override
  void onPageDispose() {
    //print('PageDisposed');
  }
}
