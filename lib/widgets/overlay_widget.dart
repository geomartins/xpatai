import 'package:xpatai/config/enumefy.dart';
import 'package:xpatai/config/palletefy.dart';
import 'package:flutter/material.dart';

class OverlayWidget extends ModalRoute<void> {
  final Widget childWidget;
  final Color bgColor;
  final Color? iconColor;
  final bool showCloseIcon;
  final bool dismissible;

  OverlayWidget(
      {required this.childWidget,
      this.bgColor = const Color(0xff04021D),
      this.iconColor,
      this.showCloseIcon = true,
      this.dismissible = false});

  @override
  Duration get transitionDuration => const Duration(milliseconds: 500);

  @override
  bool get opaque => false;

  @override
  bool get barrierDismissible => false;

  @override
  Color get barrierColor => bgColor.withOpacity(.7);

  @override
  String get barrierLabel => '';

  @override
  bool get maintainState => true;

  @override
  Widget buildPage(
    BuildContext context,
    Animation<double> animation,
    Animation<double> secondaryAnimation,
  ) {
    // This makes sure that text and other content follows the material style
    return Material(
      type: MaterialType.transparency,
      // make sure that the overlay content is not cut off
      child: SafeArea(
        child: _buildOverlayContent(context),
      ),
    );
  }

  Widget _buildOverlayContent(BuildContext context) {
    return Stack(
      children: [
        Container(
          height: MediaQuery.of(context).size.height - 0, //40
          width: MediaQuery.of(context).size.width,
          padding: const EdgeInsets.symmetric(horizontal: 0),
          child: childWidget,
        ),
        showCloseIcon == true
            ? Positioned(
                child: InkWell(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: Container(
                    padding: const EdgeInsets.all(8.0),
                    decoration: BoxDecoration(
                        color: bgColor.withOpacity(.8),
                        borderRadius: BorderRadius.circular(20)),
                    child: Icon(
                      Icons.close,
                      color: iconColor ??
                          Palletefy().iconColor(ThemeModeType.darkMode),
                    ),
                  ),
                ),
                bottom: 400,
                right: 20,
              )
            : Container()
      ],
    );
  }

  @override
  Widget buildTransitions(BuildContext context, Animation<double> animation,
      Animation<double> secondaryAnimation, Widget child) {
    // You can add your own animations for the overlay content
    return FadeTransition(
      opacity: animation,
      child: ScaleTransition(
        scale: animation,
        child: child,
      ),
    );
  }
}
