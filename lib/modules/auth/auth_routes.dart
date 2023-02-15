import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:get/get.dart';
import 'package:xpatai/modules/auth/screens/login.dart';
import 'package:xpatai/modules/auth/screens/register.dart';

class AuthRoutes {
  static List<GetPage> all() {
    return [
      GetPage(name: Register.id, page: () => const Register()),
      GetPage(name: Login.id, page: () => const Login()),
    ];
  }
}
