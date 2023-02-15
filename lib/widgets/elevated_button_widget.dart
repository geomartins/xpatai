import 'package:xpatai/config/enumefy.dart';
import 'package:xpatai/config/palletefy.dart';
import 'package:flutter/material.dart';

class ElevatedButtonWidget extends StatelessWidget with Palletefy {
  final String name;
  final Color texColor;
  final Function()? onPressed;
  final FontWeight fw;
  final double fontSize;
  final bool enableImage;
  final String imageUrl;

  const ElevatedButtonWidget({
    Key? key,
    required this.name,
    required this.texColor,
    this.onPressed,
    this.fw = FontWeight.w400,
    this.fontSize = 16,
    this.enableImage = false,
    this.imageUrl = "",
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          gradient: LinearGradient(
              tileMode: TileMode.mirror,
              colors: [Color(0xff4388DD), Color(0xffFF4581)])),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.transparent,
          disabledForegroundColor:
              primaryColor(ThemeModeType.systemMode).withOpacity(0.38),
          disabledBackgroundColor:
              primaryColor(ThemeModeType.systemMode).withOpacity(0.12),
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(10)),
          ),
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
