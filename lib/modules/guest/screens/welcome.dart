import 'package:flutter/material.dart';
import 'package:xpatai/widgets/elevated_button_widget.dart';
import '../../../config/enumefy.dart';
import '../../../config/palletefy.dart';
import '../../../widgets/annotated_region_widget.dart';
import '../../../widgets/internet_connectivity_widget.dart';
import 'package:get/get.dart';

import '../../../widgets/outlined_button_widget.dart';
import '../../auth/screens/login.dart';
import '../../auth/screens/register.dart';

class Welcome extends StatelessWidget with Palletefy {
  static const String id = '/';

  const Welcome({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegionWidget(
      themeModeType: ThemeModeType.darkMode,
      child: Scaffold(
        body: InternetConnectivityWidget(
            child: Container(
          width: double.infinity,
          height: Get.height,
          padding: EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              _buildLogoField(context),
              _buildButtonField(context),
            ],
          ),
        )),
      ),
    );
  }

  Widget _buildLogoField(BuildContext context) {
    return Expanded(
      child: Image.asset(
        "assets/images/vectors/xpatai_logo_189_47.png",
        width: 170,
        height: 47,
      ),
      flex: 5,
    );
  }

  Widget _buildButtonField(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 55,
          width: double.infinity,
          child: OutlinedButtonWidget(
            name: "Log in",
            texColor: Colors.white,
            onPressed: () {
              Get.toNamed(Login.id);
            },
          ),
        ),
        SizedBox(height: 20),
        SizedBox(
          height: 55,
          width: double.infinity,
          child: ElevatedButtonWidget(
            name: "Sign up",
            texColor: Colors.white,
            onPressed: () {
              Get.toNamed(Register.id);
            },
          ),
        )
      ],
    );
  }
}
