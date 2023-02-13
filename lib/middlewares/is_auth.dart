import 'package:flutter/material.dart';
import 'package:get/get.dart';

class IsAuth extends GetMiddleware {
  int? priorityIndex;

  IsAuth({int? priorityIndex});

  @override
  int get priority => priorityIndex ?? -8;

  @override
  RouteSettings? redirect(String? route) {
    // If user does not have token, move to [Welcome] Screen

    // bool _isLoggedIn =
    //     Get.put<SessionController>(SessionController()).isLoggedIn;
    //
    // return (_isLoggedIn == false || Session().read('token') == null)
    //     ? const RouteSettings(name: '/welcome')
    //     : null;

    return null;

    // if (Session().read('bg') == true) {
    //   Session().remove('token');
    //   Session().write('bg', false);
    // }
    // return Session().read('token') == null
    //     ? const RouteSettings(name: '/welcome')
    //     : null;
  }

  @override
  void onPageDispose() {
    //print('PageDisposed');
  }
}
