import 'package:xpatai/config/enumefy.dart';
import 'package:xpatai/config/palletefy.dart';
import 'package:flutter/material.dart';

class AppBarWidget extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final List<Widget> actions;
  final bool automaticallyImplyLeading;
  final Widget? leading;
  final PreferredSizeWidget? bottom;
  final double? size;
  final bool centerTitle;
  final Color? bgColor;
  final Color? textColor;
  final Widget? titleWidget;
  final String? appBarLogo;

  const AppBarWidget(
      {Key? key,
      required this.title,
      this.actions = const [],
      this.automaticallyImplyLeading = true,
      this.leading,
      this.bottom,
      this.centerTitle = true,
      this.bgColor,
      this.textColor,
      this.titleWidget,
      this.appBarLogo = '',
      this.size})
      : super(key: key);

  @override
  Size get preferredSize =>
      Size.fromHeight(size ?? (bottom != null ? 120.0 : 60.0));

  @override
  Widget build(BuildContext context) {
    return AppBar(
      // backgroundColor:
      //     bgColor ?? Palletefy().errorColor(ThemeModeType.systemMode),
      // backgroundColor: bgColor ??
      //     Theme.of(context)
      //         .appBarTheme
      //         .,
      elevation: 0.0,
      bottom: bottom,
      titleSpacing: 0,
      title: titleWidget ??
          Text(title.toString(),
              style: TextStyle(
                  color: textColor ??
                      Palletefy().textColor(ThemeModeType.systemMode),
                  fontSize: 18,
                  fontWeight: FontWeight.w600)),
      centerTitle: centerTitle,
      // leading: Builder(
      //   builder: (BuildContext context) {
      //     return IconButton(
      //       icon: Icon(
      //         Icons.menu_open,
      //         color: Palletefy().textColor(ThemeModeType.systemMode),
      //       ),
      //       onPressed: () {
      //         Scaffold.of(context).openDrawer();
      //       },
      //       tooltip: MaterialLocalizations.of(context).openAppDrawerTooltip,
      //     );
      //   },
      // ),
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.horizontal(
          left: Radius.circular(0),
        ),
      ),
      iconTheme:
          IconThemeData(color: Palletefy().iconColor(ThemeModeType.systemMode)),
      actions: actions,
      automaticallyImplyLeading: automaticallyImplyLeading,
    );
  }
}
