import 'package:flutter/material.dart';
import '../../../config/enumefy.dart';
import '../../../config/palletefy.dart';
import '../../../widgets/annotated_region_widget.dart';
import '../../../widgets/internet_connectivity_widget.dart';

class Register extends StatelessWidget with Palletefy {
  static const String id = '/register';

  const Register({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegionWidget(
      themeModeType: ThemeModeType.darkMode,
      child: Scaffold(
        body: InternetConnectivityWidget(
          child: const SingleChildScrollView(
            child: Text("Register screen"),
          ),
        ),
      ),
    );
  }
}
