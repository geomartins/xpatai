import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gradient_borders/box_borders/gradient_box_border.dart';
import 'package:xpatai/config/enumefy.dart';
import 'package:xpatai/modules/dashboard/screens/profile_modify.dart';
import 'package:xpatai/widgets/app_bar_widget.dart';
import 'package:xpatai/widgets/gradient_icon_widget.dart';
import '../../../config/palletefy.dart';
import '../../../utils/flex_utils.dart';
import '../../../utils/keyboard_control.dart';
import '../../../widgets/annotated_region_widget.dart';
import '../../../widgets/bottom_navigation_bar_widget.dart';
import '../../../widgets/elevated_button_widget.dart';
import '../../../widgets/internet_connectivity_widget.dart';
import '../controllers/profile_controller.dart';

class Profile extends GetView<ProfileController> with Keyboard, Palletefy {
  static const String id = "/profile";
  Profile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegionWidget(
      child: Scaffold(
          bottomNavigationBar: const BottomNavigationBarWidget(
            currentIndex: 0,
          ),
          appBar: AppBarWidget(
            centerTitle: false,
            title: "Profile",
            bgColor: appBarColor(ThemeModeType.systemMode),
          ),
          body: InternetConnectivityWidget(
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 10),
              width: double.infinity,
              height: Get.height,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _buildEditProfileField(context),
                  _buildEditProfileButtonField(context)
                ],
              ),
            ),
          )),
    );
  }

  Widget _buildEditProfileButtonField(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 55,
          width: double.infinity,
          child: ElevatedButtonWidget(
            name: "Edit Profile",
            texColor: Colors.white,
            onPressed: () {
              Get.toNamed(ProfileModify.id);
            },
          ),
        ),
        SizedBox(height: 50),
      ],
    );
  }

  Widget _buildEditProfileField(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: 20),
        ListTile(
          leading: Container(
              decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  gradient: LinearGradient(
                    colors: [Color(0xff4388DD), Color(0xffFF4581)],
                  )),
              child: CircleAvatar(
                  radius: 25,
                  child: Text(
                      FlexUtils.getInitials(
                          string: controller.displayName ?? "X", limitTo: 1),
                      style: TextStyle(color: Colors.white)),
                  backgroundColor: Colors.transparent)),
          // leading: Container(
          //   decoration: BoxDecoration(
          //       gradient: LinearGradient(
          //           colors: [Color(0xff4388DD), Color(0xffFF4581)],
          //           begin: Alignment.bottomLeft,
          //           end: Alignment.topRight)),
          //   child: CircleAvatar(
          //     backgroundColor: Colors.transparent,
          //     radius: 32,
          //     child: Text("J"),
          //   ),
          // ),
          title: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Obx(() => Text(
                    "${controller.displayName ?? ""}",
                    style: TextStyle(
                      fontSize: 17,
                      fontWeight: FontWeight.w600,
                    ),
                  )),
              Container(
                margin: EdgeInsets.only(top: 5),
                padding: EdgeInsets.symmetric(horizontal: 7, vertical: 5),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(7),
                  border: const GradientBoxBorder(
                    gradient: LinearGradient(
                        colors: [Color(0xff4388DD), Color(0xffFF4581)]),
                    width: 1,
                  ),
                ),
                child: InkWell(
                  onTap: () {
                    Get.toNamed(ProfileModify.id);
                  },
                  child: Text(
                    "edit photo",
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
        SizedBox(height: 50),
        Container(
          padding: EdgeInsets.symmetric(horizontal: 0, vertical: 20),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            border: const GradientBoxBorder(
              gradient: LinearGradient(
                  colors: [Color(0xff4388DD), Color(0xffFF4581)]),
              width: 1,
            ),
          ),
          child: Column(
            children: [
              ListTile(
                dense: true,
                title: Text(
                  '${controller.displayName ?? ""}',
                  style: TextStyle(
                      color: textColor(ThemeModeType.systemMode),
                      fontSize: 17,
                      fontWeight: FontWeight.w600),
                ),
                subtitle: Text('Name',
                    style: TextStyle(
                        color: textColor(ThemeModeType.systemMode),
                        fontSize: 14)),
              ),
              SizedBox(height: 10),
              ListTile(
                dense: true,
                title: Obx(() => Text(
                      '${controller.displayEmail ?? ""}',
                      style: TextStyle(
                          color: textColor(ThemeModeType.systemMode),
                          fontSize: 16,
                          fontWeight: FontWeight.w600),
                    )),
                subtitle: Text('Email',
                    style: TextStyle(
                        color: textColor(ThemeModeType.systemMode),
                        fontSize: 14)),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
