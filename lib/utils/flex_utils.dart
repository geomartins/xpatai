import 'package:xpatai/config/enumefy.dart';
import 'package:xpatai/config/palletefy.dart';
import 'package:flutter/material.dart';
import 'package:flutter_overlay_loader/flutter_overlay_loader.dart';
import 'package:intl/intl.dart';
import 'package:xpatai/abstracts/cache_base.dart';
import 'package:xpatai/config/cachefy.dart';
import 'package:xpatai/utils/session.dart';
import 'package:get/get.dart';
import 'package:recase/recase.dart';

import '../modules/guest/screens/welcome.dart';

extension StringExtension on String {
  String toCapitalized() =>
      length > 0 ? '${this[0].toUpperCase()}${substring(1).toLowerCase()}' : '';
  String toTitleCase() => replaceAll(RegExp(' +'), ' ')
      .split(' ')
      .map((str) => str.toCapitalized())
      .join(' ');
}

extension DateTimeExtension on DateTime {
  DateTime get firstDayOfWeek => subtract(Duration(days: weekday - 1));

  DateTime get lastDayOfWeek =>
      add(Duration(days: DateTime.daysPerWeek - weekday));

  DateTime get lastDayOfMonth =>
      month < 12 ? DateTime(year, month + 1, 0) : DateTime(year + 1, 1, 0);
}

class FlexUtils with Palletefy {
  static String numberFormat(dynamic number, {bool decimal = false}) {
    if (number == null || number == 'null' || number == '') {
      return '';
    }
    if (decimal == false) {
      NumberFormat myFormat = NumberFormat.decimalPattern('en_us');
      return myFormat.format(double.parse(number));
    } else {
      NumberFormat myFormat = NumberFormat("#,##0.00", "en_US");
      return myFormat.format(double.parse(number));
    }

    // print(myFormat.format(num));
    // print(myFormat.format(longnum2));

    // number = int.parse(number);
    // // if (number > 0) {
    // //   return (number / 10000).toString();
    // // }
    //
    // return NumberFormat('#,###,###,###').format(number);
  }

  static String getInitials({required String string, required int limitTo}) {
    var buffer = StringBuffer();
    var split = string.split(' ');
    for (var i = 0; i < (limitTo ?? split.length); i++) {
      buffer.write(split[i][0]);
    }

    return buffer.toString();
  }

  static String ucwords(String value) {
    return value.toTitleCase();
  }

  static bool getIsTyping() {
    return Session().read('isTyping') ?? false;
  }

  static void isTyping() {
    // Get.put<AnnotatedRegionWidgetController>(AnnotatedRegionWidgetController())
    //     .initializeTimer();
  }

  static String ucwordsWithRecase(String value) {
    return value.snakeCase.replaceAll('_', ' ').toTitleCase();
  }

  static String ucwordsWithSplit(String value) {
    if (value.isEmpty) return '';
    return value.split(' ')[0].toLowerCase().toTitleCase();
  }

  static void hideLoadingOverlay(BuildContext context) {
    Loader.hide();
  }

  static void showLoadingOverlay(BuildContext context,
      {bool biometricOverlay = false}) {
    Loader.show(context,
        isSafeAreaOverlay: true,
        isAppbarOverlay: true,
        isBottomBarOverlay: true,
        progressIndicator: CircularProgressIndicator(
            backgroundColor: Color(0xff4388DD).withOpacity(.8),
            color: Color(0xffFF4581).withOpacity(.8)),

        // progressIndicator: AnimatedRotatingWidget(
        //     duration: const Duration(milliseconds: 1500),
        //     child: Image.asset(
        //       'assets/images/vectors/rotate_icon.png',
        //       width: 50,
        //       height: 50,
        //     )),
        themeData: Theme.of(context).copyWith(
            colorScheme:
                ColorScheme.fromSwatch().copyWith(secondary: Colors.black38)),
        overlayColor: biometricOverlay == false
            ? Palletefy().modalColor(ThemeModeType.systemMode)
            : Palletefy().biometricModalColor(ThemeModeType.systemMode));

    //
  }

  static String convertUnixToDateTime(int date) {
    //final DateTime now = DateTime.parse(formattedString);
    // final DateFormat formatter = DateFormat('yyyy-MM-dd');
    // final String formatted = formatter.format(now);
    // print(formatted); //

    final mDate = DateTime.fromMillisecondsSinceEpoch(date * 1000);
    var format = DateFormat("yyyy-MM-dd hh:mm");
    var dateString = format.format(mDate);
    return dateString;
  }

  static String convertToDateTime(String formattedString,
      {String options = 'MMMM d yyyy  hh:mm aaa'}) {
    final DateTime now = DateTime.parse(formattedString);
    var format = DateFormat(options);
    var dateString = format.format(now);
    return dateString;
  }

  static String obscureTelephone(String value) {
    if (value.length < 11) {
      return '';
    }
    return value.replaceRange(3, 8, '**********');
  }

  static String obscure(String value) {
    return '*****';
  }

  static int differenceInDate(int date) {
    if (date == 0) return 0;
    final dt = DateTime.fromMillisecondsSinceEpoch(date * 1000);
    Duration diff = DateTime.now().difference(dt);
    return diff.inDays;
  }

  static String convertUnixToHumanReadable(int date) {
    // final DateTime now = DateTime.now();
    // final DateFormat formatter = DateFormat('yyyy-MM-dd');
    // final String formatted = formatter.format(now);
    // print(formatted); //

    final mDate = DateTime.fromMillisecondsSinceEpoch(date * 1000);
    var format = DateFormat();
    var dateString = format.format(mDate);
    return dateString;
  }

  static Future<void> login(String token) async {
    //Get the token and store in getStorage
    await Session().write('token', token);
    //Remove the token in 45mins time
    Future.delayed(
        const Duration(minutes: 45), () => Session().remove('token'));
  }

  static Future<void> logout() async {
    //clear all cache
    await clearCache();
    //logout
    await Session().remove('token');
    Get.offAllNamed(Welcome.id);
  }

  static Future<void> clearCache() async {
    //clear all cache
    for (CacheBase cacheBase in Cachefy.all()) {
      await cacheBase.clear();
    }
  }
}
