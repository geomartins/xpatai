import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../config/enumefy.dart';
import '../../../config/palletefy.dart';
import '../../../utils/keyboard_control.dart';
import '../../../widgets/annotated_region_widget.dart';
import '../../../widgets/app_bar_widget.dart';
import '../../../widgets/bottom_navigation_bar_widget.dart';
import '../../../widgets/internet_connectivity_widget.dart';
import '../controllers/history_controller.dart';

class History extends GetView<HistoryController> with Keyboard, Palletefy {
  static const String id = "/history";
  History({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegionWidget(
      child: Scaffold(
          bottomNavigationBar: const BottomNavigationBarWidget(
            currentIndex: 1,
          ),
          appBar: AppBarWidget(
            centerTitle: false,
            title: "History",
            bgColor: appBarColor(ThemeModeType.systemMode),
          ),
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
                      title:
                          "Exploring the impact of Ai on Web3: How Leveraging Machine Learning Can Enhance Web3’s UX ",
                      tags: ["crypto", "alpha", "intelligence"],
                    ),
                    _buildListTile(
                      title: "Write a rap about the status of XPatAi ",
                      tags: [
                        "crypto",
                        "alpha",
                        "intelligence",
                        "Studio",
                        "Info"
                      ],
                    ),
                    _buildListTile(
                      title:
                          "Exploring the impact of Ai on Web3: How Leveraging Machine Learning Can Enhance Web3’s UX ",
                      tags: ["crypto", "alpha", "intelligence"],
                    ),
                    SizedBox(height: 50),
                  ],
                ),
              ),
            ),
          )),
    );
  }

  List<Widget> buildChips(List<String> values) {
    List<Widget> result = [];

    for (String label in values) {
      result.add(Chip(
        elevation: 4,
        backgroundColor: Color(0xff1A1742),
        labelPadding: const EdgeInsets.only(left: 8.0),
        label: Text(label,
            style: TextStyle(
                color: Palletefy().textColor(ThemeModeType.systemMode),
                fontSize: 13)),
        deleteIcon: Icon(
          Icons.close,
          size: 14,
          color: Palletefy().iconColor(ThemeModeType.systemMode),
        ),
        onDeleted: () {},
      ));
    }

    return result;
  }

  Widget _buildListTile({required String title, required List<String> tags}) {
    return Container(
      padding: const EdgeInsets.only(bottom: 10),
      margin: EdgeInsets.only(bottom: 30),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: containerColor(ThemeModeType.systemMode),
        ),
        padding: EdgeInsets.symmetric(vertical: 20, horizontal: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: TextStyle(
                  color: textColor(ThemeModeType.systemMode),
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                  height: 1.68),
            ),
            SizedBox(height: 8),
            Wrap(
              children: buildChips(tags),
            )
          ],
        ),
      ),
    );
  }
}
