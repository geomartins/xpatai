import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gradient_borders/box_borders/gradient_box_border.dart';
import 'package:xpatai/config/enumefy.dart';
import 'package:xpatai/modules/dashboard/screens/profile.dart';
import 'package:xpatai/widgets/app_bar_widget.dart';
import 'package:xpatai/widgets/gradient_icon_widget.dart';
import '../../../config/palletefy.dart';
import '../../../utils/keyboard_control.dart';
import '../../../widgets/annotated_region_widget.dart';
import '../../../widgets/bottom_navigation_bar_widget.dart';
import '../../../widgets/elevated_button_widget.dart';
import '../../../widgets/internet_connectivity_widget.dart';
import '../controllers/profile_controller.dart';

class ProfileModify extends GetView<ProfileController>
    with Keyboard, Palletefy {
  static const String id = "/profile_modify";
  ProfileModify({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegionWidget(
      child: Scaffold(
          bottomNavigationBar: const BottomNavigationBarWidget(
            currentIndex: 0,
          ),
          appBar: AppBarWidget(
            centerTitle: false,
            title: "Edit Profile",
            bgColor: appBarColor(ThemeModeType.systemMode),
          ),
          body: InternetConnectivityWidget(
            child: SingleChildScrollView(
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 10),
                width: double.infinity,
                height: MediaQuery.of(context).size.height -
                    (AppBar().preferredSize.height * 4),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _buildEditProfileField(context),
                    _buildEditProfileButtonField(context)
                  ],
                ),
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
            name: "Save Changes",
            texColor: Colors.white,
            onPressed: () {
              Get.toNamed(Profile.id);
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
                  child: Text('J', style: TextStyle(color: Colors.white)),
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
              Text(
                "Jasper Kenneth",
                style: TextStyle(
                  fontSize: 17,
                  fontWeight: FontWeight.w600,
                ),
              ),
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
                child: Text(
                  "edit photo",
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              )
            ],
          ),
        ),
        SizedBox(height: 20),
        Container(
          padding: EdgeInsets.symmetric(horizontal: 0, vertical: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Column(
                children: [
                  Text(
                    'Name',
                    style: TextStyle(
                        fontSize: 17,
                        fontWeight: FontWeight.w500,
                        color: textColor(ThemeModeType.systemMode)),
                  ),
                  SizedBox(height: 10),
                  TextField(
                      onChanged: (value) {},
                      decoration: InputDecoration(
                        labelText: 'Name',
                      )),
                ],
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
              ),
              const SizedBox(height: 40.0),
              Column(
                children: [
                  Text(
                    'Email',
                    style: TextStyle(
                        fontSize: 17,
                        fontWeight: FontWeight.w500,
                        color: textColor(ThemeModeType.systemMode)),
                  ),
                  SizedBox(height: 10),
                  TextField(
                      onChanged: (value) {},
                      decoration: InputDecoration(
                        labelText: 'Email',
                      )),
                ],
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
              ),
              SizedBox(height: 10),
            ],
          ),
        ),
      ],
    );
  }
}
