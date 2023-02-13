import 'package:flutter/material.dart';
import '../../../config/enumefy.dart';
import '../../../config/palletefy.dart';
import '../../../widgets/annotated_region_widget.dart';
import '../../../widgets/internet_connectivity_widget.dart';

class Login extends StatelessWidget with Palletefy {
  static const String id = '/login';

  const Login({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegionWidget(
      themeModeType: ThemeModeType.darkMode,
      child: Scaffold(
        body: InternetConnectivityWidget(
          child: const SingleChildScrollView(
            child: Text("Login screen"),
          ),
        ),
      ),
    );
  }
}
