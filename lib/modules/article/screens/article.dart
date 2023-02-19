import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:super_tag_editor/tag_editor.dart';
import 'package:textfield_tags/textfield_tags.dart';
import 'package:xpatai/widgets/app_bar_widget.dart';
import 'package:xpatai/widgets/outlined_button_widget.dart';
import '../../../config/enumefy.dart';
import '../../../config/palletefy.dart';
import '../../../utils/keyboard_control.dart';
import '../../../widgets/annotated_region_widget.dart';
import '../../../widgets/bottom_navigation_bar_widget.dart';
import '../../../widgets/elevated_button_widget.dart';
import '../../../widgets/internet_connectivity_widget.dart';
import '../../../widgets/overlay_widget.dart';
import '../controllers/article_controller.dart';

class Article extends GetView<ArticleController> with Keyboard, Palletefy {
  static const String id = "/article";
  Article({Key? key}) : super(key: key);

  Widget build(BuildContext context) {
    return AnnotatedRegionWidget(
      child: Scaffold(
          bottomNavigationBar: const BottomNavigationBarWidget(
            currentIndex: 3,
          ),
          appBar: AppBarWidget(
            centerTitle: false,
            title: "Write an article",
            bgColor: appBarColor(ThemeModeType.systemMode),
          ),
          body: InternetConnectivityWidget(
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 10),
              width: double.infinity,
              height: MediaQuery.of(context).size.height,
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _buildFormField(context),
                    _buildGenerateArticleButtonField(context),
                  ],
                ),
              ),
            ),
          )),
    );
  }

  Widget _buildFormField(BuildContext context) {
    final values = [
      'dat@gmail.com',
      'dab246@gmail.com',
      'kaka@gmail.com',
      'datvu@gmail.com'
    ];
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: 20),
        //TITLE
        Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Title',
              style: TextStyle(
                  fontSize: 17,
                  fontWeight: FontWeight.w500,
                  color: textColor(ThemeModeType.systemMode)),
            ),
            TextField(
                style: TextStyle(
                    fontWeight: FontWeight.w600, height: 1.8, fontSize: 18),
                controller: TextEditingController(
                    text:
                        'Exploring the impact of Ai on Web3: How Leveraging Machine Learning Can Enhance Web3’s UX '),
                minLines: 2,
                maxLines: 5,
                onChanged: (value) {},
                decoration: InputDecoration(
                  labelText: '',
                  contentPadding:
                      EdgeInsets.symmetric(horizontal: 0, vertical: 0),
                  border: InputBorder.none,
                  focusedBorder: InputBorder.none,
                  enabledBorder: InputBorder.none,
                  errorBorder: InputBorder.none,
                  disabledBorder: InputBorder.none,
                )),
          ],
        ),

        SizedBox(height: 30),
        //KEYWORDS
        Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Keywords',
              style: TextStyle(
                  fontSize: 17,
                  fontWeight: FontWeight.w500,
                  color: textColor(ThemeModeType.systemMode)),
            ),
            SizedBox(height: 10),
            TagEditor(
              length: values.length,
              delimiters: [',', ' '],
              hasAddButton: true,
              inputDecoration: const InputDecoration(
                  border: InputBorder.none,
                  hintText: 'Add keywords',
                  hintStyle: TextStyle(color: Colors.white, fontSize: 14),
                  helperText: 'separate keywords with comma',
                  helperStyle: TextStyle(color: Colors.white)),
              onTagChanged: (newValue) {
                // setState(() {
                values.add(newValue);
                //});
              },
              tagBuilder: (context, index) => _Chip(
                index: index,
                label: values[index],
                onDeleted: (int val) {},
              ),
              // suggestionBuilder: (context, state, data) => ListTile(
              //       key: ObjectKey(data),
              //       title: Text(data),
              //       onTap: () {
              //         state.selectSuggestion(data);
              //       },
              //     ),
              suggestionsBoxElevation: 10,
              findSuggestions: (String query) {
                return [];
              },
              suggestionBuilder: (BuildContext context,
                  TagsEditorState<dynamic> state, data, bool highlight) {
                return Container();
              },
            ),
          ],
        ),
        SizedBox(height: 30),

        //NUMBER OF WORDS
        Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Number of words',
              style: TextStyle(
                  fontSize: 17,
                  fontWeight: FontWeight.w500,
                  color: textColor(ThemeModeType.systemMode)),
            ),
            SizedBox(height: 10),
            TextField(
                onChanged: (value) {},
                decoration: InputDecoration(
                  labelText: '',
                )),
          ],
        ),

        SizedBox(height: 30),
        //SCHEDULE
        ListTile(
          contentPadding: EdgeInsets.only(left: 0.0, right: 0.0),
          title: Padding(
            padding: const EdgeInsets.only(bottom: 6),
            child: Text("Schedule",
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500)),
          ),
          subtitle: Text("Choose when to publish your article",
              style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w400,
                  color: textColor(ThemeModeType.systemMode).withOpacity(.7))),
          trailing: SizedBox(
            height: 40,
            width: 110,
            child: OutlinedButtonWidget(
              name: 'Configure',
              texColor: Colors.white,
              fontSize: 14,
              onPressed: () {
                Navigator.of(context).push(OverlayWidget(
                    showCloseIcon: true,
                    dismissible: true,
                    childWidget: _buildComingSoonField(context)));
              },
            ),
          ),
        )
      ],
    );
  }

  Widget _buildComingSoonField(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          width: double.infinity,
          height: 380,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Column(
                children: [
                  Text(
                    'Schedule',
                    style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w700,
                        color: textColor(ThemeModeType.systemMode)),
                  ),
                  SizedBox(height: 10),
                  Text(
                    "Choose when to publish your article",
                    style: TextStyle(
                      color: textColor(ThemeModeType.systemMode).withOpacity(1),
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                    ),
                  )
                ],
              ),
              Image.asset(
                "assets/images/coming_soon.png",
                width: 156,
                height: 156,
              )
            ],
          ),
          decoration: BoxDecoration(color: Color(0xff050231)),
        ),
      ],
    );
  }

  Widget _buildGenerateArticleButtonField(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        SizedBox(height: 50),
        SizedBox(
          height: 55,
          width: double.infinity,
          child: ElevatedButtonWidget(
            name: "Generate article",
            texColor: Colors.white,
            onPressed: () {},
          ),
        ),
        SizedBox(height: 30),
      ],
    );
  }
}

class _Chip extends StatelessWidget {
  const _Chip({
    required this.label,
    required this.onDeleted,
    required this.index,
  });

  final String label;
  final ValueChanged<int> onDeleted;
  final int index;

  @override
  Widget build(BuildContext context) {
    return Chip(
      elevation: 4,
      backgroundColor: Color(0xff1A1742),
      labelPadding: const EdgeInsets.only(left: 8.0),
      label: Text(label,
          style: TextStyle(
              color: Palletefy().textColor(ThemeModeType.systemMode),
              fontSize: 13)),
      deleteIcon: Icon(
        Icons.close,
        size: 18,
        color: Palletefy().iconColor(ThemeModeType.systemMode),
      ),
      onDeleted: () {
        onDeleted(index);
      },
    );
  }
}
