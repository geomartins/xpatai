import 'package:xpatai/translations/english.dart';
import 'package:xpatai/translations/german.dart';
import 'package:get/get.dart';

class MyTranslations extends Translations {
  @override
  Map<String, Map<String, String>> get keys =>
      {...German().keys, ...English().keys};
}
