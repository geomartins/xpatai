import 'package:gradient_borders/box_borders/gradient_box_border.dart';
import 'package:xpatai/config/enumefy.dart';
import 'package:xpatai/config/palletefy.dart';
import 'package:flutter/material.dart';

class OutlinedButtonWidget extends StatelessWidget with Palletefy {
  final String name;
  final Color texColor;
  final Function()? onPressed;
  final FontWeight fw;
  final double fontSize;
  final bool enableImage;
  final String imageUrl;

  const OutlinedButtonWidget(
      {Key? key,
      required this.name,
      required this.texColor,
      this.onPressed,
      this.fw = FontWeight.w400,
      this.enableImage = false,
      this.imageUrl = "",
      this.fontSize = 16})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        gradient: LinearGradient(colors: [Colors.yellowAccent, Colors.pink]),
        border: const GradientBoxBorder(
          gradient: LinearGradient(colors: [Colors.blue, Colors.red]),
          width: 1,
        ),
      ),
      child: OutlinedButton(
        style: OutlinedButton.styleFrom(
          foregroundColor: scaffoldColor(ThemeModeType.systemMode),
          backgroundColor: scaffoldColor(ThemeModeType.systemMode),
          side: BorderSide(color: Colors.transparent),
          shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(8))),
        ),
        onPressed: onPressed,
        child: enableImage
            ? Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    imageUrl,
                    width: 30,
                    height: 30,
                  ),
                  SizedBox(width: 20),
                  Text(
                    name,
                    style: TextStyle(
                      color: texColor,
                      fontWeight: fw,
                      fontSize: fontSize,
                    ),
                  )
                ],
              )
            : Text(
                name,
                style: TextStyle(
                  color: texColor,
                  fontWeight: fw,
                  fontSize: fontSize,
                ),
              ),
      ),
    );
  }
}
