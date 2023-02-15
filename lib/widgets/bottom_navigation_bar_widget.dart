import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:xpatai/modules/dashboard/screens/dashboard.dart';
import 'package:xpatai/widgets/gradient_icon_widget.dart';

import '../config/enumefy.dart';
import '../config/palletefy.dart';
import 'package:bottom_navy_bar/bottom_navy_bar.dart';
import '../modules/article/screens/article.dart';
import '../modules/history/screens/history.dart';
import '../modules/qa/screens/qa.dart';

class BottomNavigationBarWidget extends StatelessWidget with Palletefy {
  final int currentIndex;
  const BottomNavigationBarWidget({Key? key, this.currentIndex = 0})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final c = Get.put(BottomNavigationBarWidgetController());
    c.updateSelectedIndex(currentIndex);
    return BottomNavyBar(
      selectedIndex: c.selectedIndex,
      backgroundColor: scaffoldColor(ThemeModeType.systemMode),
      showElevation: false, // use this to remove appBar's elevation
      onItemSelected: (index) {
        print(index.toString());

        if (index == 0) {
          Get.toNamed(Dashboard.id);
        }

        if (index == 1) {
          Get.toNamed(History.id);
        }

        if (index == 2) {
          Get.toNamed(QA.id);
        }

        if (index == 3) {
          Get.toNamed(Article.id);
        }

        // _pageController.animateToPage(index,
        //     duration: Duration(milliseconds: 300), curve: Curves.ease);
      },
      items: [
        BottomNavyBarItem(
          icon: currentIndex == 0
              ? GradientIconWidget(
                  Icons.home,
                  30.0,
                  LinearGradient(
                    colors: <Color>[Color(0xff4388DD), Color(0xffFF4581)],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                )
              : Icon(
                  Icons.home,
                  color: iconColor(ThemeModeType.systemMode),
                  size: 25,
                ),
          title: Text(
            'Home',
            style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w400,
                height: 1.5,
                color: Colors.white.withOpacity(0.8)),
          ),
          //activeColor: textColor(ThemeModeType.systemMode),
        ),

        // History
        BottomNavyBarItem(
            icon: currentIndex == 1
                ? GradientIconWidget(
                    Icons.tag,
                    30.0,
                    LinearGradient(
                      colors: <Color>[Color(0xff4388DD), Color(0xffFF4581)],
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                    ),
                  )
                : Icon(
                    Icons.tag,
                    color: iconColor(ThemeModeType.systemMode),
                    size: 25,
                  ),
            title: Text(
              'History',
              style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                  height: 1.5,
                  color: Colors.white.withOpacity(0.8)),
            )),

        //Question
        BottomNavyBarItem(
            icon: currentIndex == 2
                ? GradientIconWidget(
                    Icons.question_mark_sharp,
                    30.0,
                    LinearGradient(
                      colors: <Color>[Color(0xff4388DD), Color(0xffFF4581)],
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                    ),
                  )
                : Icon(
                    Icons.question_mark_sharp,
                    color: iconColor(ThemeModeType.systemMode),
                    size: 25,
                  ),
            title: Text(
              'Question',
              style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                  height: 1.5,
                  color: Colors.white.withOpacity(0.8)),
            )),

        //Article
        BottomNavyBarItem(
            icon: currentIndex == 3
                ? GradientIconWidget(
                    Icons.upload_file,
                    30.0,
                    LinearGradient(
                      colors: <Color>[Color(0xff4388DD), Color(0xffFF4581)],
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                    ),
                  )
                : Icon(
                    Icons.upload_file,
                    color: iconColor(ThemeModeType.systemMode),
                    size: 25,
                  ),
            title: Text(
              'Article',
              style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                  height: 1.5,
                  color: Colors.white.withOpacity(0.8)),
            )),
      ],
    );
  }
}

class BottomNavigationBarWidgetController extends GetxController {
  //@state
  final _selectedIndex = 0.obs;

  //@getters
  int get selectedIndex => _selectedIndex.value;

  //@mutation
  void updateSelectedIndex(int value) => _selectedIndex.value = value;
}
