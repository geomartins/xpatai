import 'package:bubble/bubble.dart';
import 'package:chat_bubbles/bubbles/bubble_normal.dart';
import 'package:chat_bubbles/message_bars/message_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gradient_borders/gradient_borders.dart';
import 'package:xpatai/modules/dashboard/screens/profile.dart';
import 'package:xpatai/widgets/custom_bubble_widget.dart';
import '../../../config/enumefy.dart';
import '../../../config/palletefy.dart';
import '../../../utils/keyboard_control.dart';
import '../../../widgets/annotated_region_widget.dart';
import '../../../widgets/app_bar_widget.dart';
import '../../../widgets/bottom_navigation_bar_widget.dart';
import '../../../widgets/gradient_icon_widget.dart';
import '../../../widgets/internet_connectivity_widget.dart';
import '../controllers/qa_controller.dart';

class QA extends GetView<QAController> with Keyboard, Palletefy {
  static const String id = "/questions_answers";
  QA({Key? key}) : super(key: key);

  @override
  @override
  Widget build(BuildContext context) {
    return AnnotatedRegionWidget(
      child: Scaffold(
          bottomNavigationBar: const BottomNavigationBarWidget(
            currentIndex: 2,
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
              actions: []),
          body: InternetConnectivityWidget(
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 15, vertical: 20),
              child: Stack(
                children: [
                  Container(
                    height: MediaQuery.of(context).size.height,
                    width: double.infinity,
                    margin: EdgeInsets.only(bottom: 50),
                    child: ListView(
                      shrinkWrap: true,
                      children: [
                        ChatBubbleWidget(
                          message:
                              "How to write an undergraduate project article",
                        ),
                        ChatBubbleWidget(
                          isBot: true,
                          message:
                              "1. Choose a Topic\n2. Research Your Topic\n3. Outline Your Article\n4. Write Your Article\n5. Edit and Revise",
                        ),
                        ChatBubbleWidget(
                          message:
                              "How intelligent are you and can you solve world energy problems",
                        ),
                      ],
                    ),
                  ),
                  // Positioned(
                  //   bottom: 50,
                  //   left: 0,
                  //   child: SizedBox(
                  //     height: 100,
                  //     child: Text(
                  //       "ffffffff",
                  //       style:
                  //           TextStyle(color: textColor(ThemeModeType.systemMode)),
                  //     ),
                  //   ),
                  // ),
                  Align(
                    alignment: Alignment.bottomCenter,
                    child: Container(
                      padding: EdgeInsets.only(top: 20, bottom: 20),
                      child: ConstrainedBox(
                        constraints: BoxConstraints(
                          maxHeight: 300.0,
                        ),
                        child: TextField(
                            maxLines: null,
                            decoration: InputDecoration(
                                fillColor: Palletefy()
                                    .containerColor(ThemeModeType.lightMode),
                                filled: true,
                                focusedBorder: InputBorder.none,
                                enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(50),
                                    borderSide: BorderSide.none),
                                suffixIcon: Icon(Icons.send,
                                    color: iconColor(ThemeModeType.systemMode)),
                                labelText: 'Ask me something...',
                                labelStyle: TextStyle(
                                    color:
                                        textColor(ThemeModeType.systemMode)))),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          )),
    );
  }
}
