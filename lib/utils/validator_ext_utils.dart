import 'package:xpatai/utils/validator_utils.dart';
import 'package:get/get.dart';

class ValidatorExtUtils {
  bool canSubmit(List<String> datas, RxMap<dynamic, dynamic> _errors) {
    int pass = 0;
    for (final data in datas) {
      if (_errors.containsKey(data) && _errors[data] == '') {
        pass++;
      }
    }

    if (pass != datas.length) {
      return false;
    } else {
      return true;
    }
  }

  void validate(
      {required String label,
      required String value,
      required String rules,
      String errMsg = '',
      required RxMap<dynamic, dynamic> errors}) {
    final errorBag = ValidatorUtils({
      label: value,
    }).validate({
      label: rules,
    }).errorBag[label];
    errors[label] =
        (errorBag == '') ? errorBag : (errMsg == '' ? errorBag : errMsg);
  }
}
