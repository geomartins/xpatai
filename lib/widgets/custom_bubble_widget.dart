import 'package:flutter/material.dart';
import 'package:gradient_borders/box_borders/gradient_box_border.dart';
import 'package:xpatai/config/enumefy.dart';
import 'package:xpatai/config/palletefy.dart';

class ChatBubbleWidget extends StatelessWidget with Palletefy {
  final String message;
  final bool? isBot;
  const ChatBubbleWidget({Key? key, required this.message, this.isBot = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          margin: EdgeInsets.only(bottom: 0),
          child: Stack(
            children: [
              Container(
                padding: EdgeInsets.all(20),
                margin: EdgeInsets.only(left: 30),
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(20.0),
                    bottomRight: Radius.circular(20.0),
                    topLeft: Radius.circular(20.0),
                  ),
                  border: const GradientBoxBorder(
                    gradient: LinearGradient(
                        colors: [Color(0xff4388DD), Color(0xffFF4581)]),
                    width: 1,
                  ),
                ),
                child: Text(
                  message.toString(),
                  style: TextStyle(
                      fontSize: 16, fontWeight: FontWeight.w400, height: 1.6),
                ),
              ),
              Positioned(
                child: Image.asset(
                  "assets/images/vectors/${isBot == true ? 'bot_icon.png' : 'person_icon.png'}",
                  width: 25,
                  height: 25,
                ),
                left: 0,
                bottom: 0,
              ),
            ],
          ),
        ),
        isBot == true
            ? Container(
                margin: EdgeInsets.only(bottom: 20, top: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Icon(
                      Icons.bookmark_outline,
                      size: 20,
                      color: iconColor(ThemeModeType.systemMode),
                    ),
                    SizedBox(width: 20),
                    Icon(
                      Icons.share,
                      size: 20,
                      color: iconColor(ThemeModeType.systemMode),
                    ),
                    SizedBox(width: 20),
                    Icon(
                      Icons.more_horiz_outlined,
                      size: 20,
                      color: iconColor(ThemeModeType.systemMode),
                    ),
                  ],
                ),
              )
            : Container(
                margin: EdgeInsets.only(bottom: 20, top: 10),
              )
        // Text(
        //   "fffffffff",
        //   style: TextStyle(color: textColor(ThemeModeType.systemMode)),
        // )
      ],
    );
  }
}
