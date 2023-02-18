import 'package:get/get.dart';
import '../../../abstracts/controller_base.dart';
import '../../../utils/validator_ext_utils.dart';

class ProfileController extends GetxController
    with ControllerBase, ValidatorExtUtils {
  //CONSTRUCTOR
  @override
  void onInit() {
    onCreate();
    super.onInit();
  }

  //STATE
  final _username = ''.obs;
  final _password = ''.obs;
  final _errors = {}.obs;
  final _togglePasswordVisibility = true.obs;

  //GETTER
  String get username => _username.value;
  String get password => _password.value;
  bool get togglePasswordVisibility => _togglePasswordVisibility.value;

  dynamic getErrorText(value) {
    return _errors[value] == '' ? null : _errors[value];
  }

  //MUTATION
  void updateUsername(String value) {
    _username.value = value;
    validate(label: 'username', value: value, rules: 'min:5', errors: _errors);
  }

  void updatePassword(String value) {
    _password.value = value;
    validate(
        label: 'password', value: value, rules: 'password', errors: _errors);
  }

  void updateTogglePasswordVisibility() {
    _togglePasswordVisibility.value = !togglePasswordVisibility;
  }

  void updatePasswordVisibility(bool value) {
    _togglePasswordVisibility.value = value;
  }

  bool canSubmitForm(List<String> datas) => canSubmit(datas, _errors);

  // ACTIONS
  Future<void> submit({activateBiometric = false}) async {
    try {} catch (e) {
      rethrow;
    }
  }

  @override
  void onCreate() {
    //rememberMe();
  }
}
