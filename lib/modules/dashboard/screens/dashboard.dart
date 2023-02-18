import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:xpatai/config/enumefy.dart';
import 'package:xpatai/modules/dashboard/screens/profile.dart';
import 'package:xpatai/widgets/app_bar_widget.dart';
import 'package:xpatai/widgets/gradient_icon_widget.dart';
import '../../../config/palletefy.dart';
import '../../../utils/keyboard_control.dart';
import '../../../widgets/annotated_region_widget.dart';
import '../../../widgets/bottom_navigation_bar_widget.dart';
import '../../../widgets/internet_connectivity_widget.dart';
import '../controllers/dashboard_controller.dart';

class Dashboard extends GetView<DashboardController> with Keyboard, Palletefy {
  static const String id = "/dashboard";
  Dashboard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegionWidget(
      child: Scaffold(
          bottomNavigationBar: const BottomNavigationBarWidget(
            currentIndex: 0,
          ),
          drawer: SizedBox(
            child: Drawer(
              backgroundColor: drawerColor(ThemeModeType.systemMode),
              child: ListView(
                children: [
                  ListTile(
                    leading: Container(
                        decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            gradient: LinearGradient(
                              colors: [Color(0xff4388DD), Color(0xffFF4581)],
                            )),
                        child: CircleAvatar(
                            radius: 25,
                            child: Text('J',
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
                    title: Text(
                      "Jasper Kenneth",
                      style: TextStyle(
                        fontSize: 17,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                  SizedBox(height: 120),
                  ListTile(
                    leading: Icon(
                      Icons.supervised_user_circle,
                      color: iconColor(ThemeModeType.systemMode),
                      size: 25,
                    ),
                    onTap: () {
                      Get.toNamed(Profile.id);
                    },
                    title: Text(
                      'Profile',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w500,
                        color: textColor(ThemeModeType.systemMode),
                      ),
                    ),
                  ),
                  SizedBox(height: 10),
                  ListTile(
                    leading: Icon(
                      Icons.settings,
                      color: iconColor(ThemeModeType.systemMode),
                      size: 25,
                    ),
                    title: Text(
                      'Settings',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w500,
                        color: textColor(ThemeModeType.systemMode),
                      ),
                    ),
                  ),
                  SizedBox(height: 10),
                  ListTile(
                    leading: Icon(
                      Icons.exit_to_app_outlined,
                      color: iconColor(ThemeModeType.systemMode),
                      size: 25,
                    ),
                    title: Text(
                      'Log out',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w500,
                        color: textColor(ThemeModeType.systemMode),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
          appBar: AppBarWidget(
              titleWidget: Image.asset(
                "assets/images/vectors/logo_sm.png",
                width: 130,
                height: 38,
              ),
              centerTitle: false,
              title: "Dashboard",
              actions: [
                Row(
                  children: [
                    Icon(Icons.file_copy_outlined,
                        size: 16, color: textColor(ThemeModeType.systemMode)),
                    SizedBox(
                      width: 10,
                    ),
                    Text(
                      'History',
                      style: TextStyle(
                          fontSize: 16,
                          color: textColor(ThemeModeType.systemMode)),
                    ),
                    SizedBox(
                      width: 10,
                    )
                  ],
                )
              ]),
          body: InternetConnectivityWidget(
            child: SingleChildScrollView(
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 16),
                width: double.infinity,
                height: Get.height,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _buildListTile(
                        title: "Get answers to your questions",
                        subtitle:
                            "Find the information you're looking for, ask questions and get answers",
                        icon: Icons.edit_location_outlined),
                    _buildListTile(
                        title: "Write an article or blogpost",
                        subtitle:
                            "Easily write, edit and schedule articles, blog posts, and other content with ease",
                        icon: Icons.edit_location_outlined),
                    _buildListTile(
                        title: "Create recipe for dishes",
                        subtitle:
                            "Create, save and share your favorite dishes with step-by-step instructions and ingredient lists",
                        icon: Icons.edit_location_outlined),
                    SizedBox(height: 50),
                    _buildSliderField(context),
                  ],
                ),
              ),
            ),
          )),
    );
  }

  Widget _buildListTile(
      {required String title,
      required String subtitle,
      required IconData icon}) {
    return Stack(
      children: [
        Padding(
          padding: const EdgeInsets.only(bottom: 10),
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: containerColor(ThemeModeType.systemMode),
            ),
            padding: EdgeInsets.symmetric(vertical: 20, horizontal: 30),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: TextStyle(
                    color: textColor(ThemeModeType.systemMode),
                    fontSize: 17,
                    fontWeight: FontWeight.w800,
                    height: 1.68,
                  ),
                ),
                SizedBox(height: 8),
                Padding(
                  padding: EdgeInsets.only(right: 35),
                  child: Text(
                    subtitle,
                    style: TextStyle(
                      color: textColor(ThemeModeType.systemMode),
                      fontSize: 13,
                      fontWeight: FontWeight.w400,
                      height: 1.31,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        Positioned(
          child: GradientIconWidget(
            icon,
            24,
            LinearGradient(
              colors: <Color>[Color(0xff4388DD), Color(0xffFF4581)],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
          top: 50,
          right: 30,
        )
      ],
    );
  }

  Widget _buildSliderField(BuildContext context) {
    return Column(
      children: [
        Image.asset(
          "assets/images/slider.png",
          width: double.infinity,
          height: 168,
        ),
        SizedBox(height: 20),
        // Row(
        //   mainAxisAlignment: MainAxisAlignment.center,
        //   children: [
        //     Icon(
        //       Icons.circle,
        //       size: 6,
        //       color: iconColor(ThemeModeType.systemMode),
        //     ),
        //     SizedBox(width: 2),
        //     Icon(
        //       Icons.circle,
        //       size: 6,
        //       color: iconColor(ThemeModeType.systemMode),
        //     ),
        //     SizedBox(width: 2),
        //     Icon(
        //       Icons.circle,
        //       size: 6,
        //       color: iconColor(ThemeModeType.systemMode),
        //     )
        //   ],
        // )
      ],
    );
  }
}
