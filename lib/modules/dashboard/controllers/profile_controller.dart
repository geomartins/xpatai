import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:xpatai/services/auth_service.dart';
import '../../../abstracts/controller_base.dart';
import '../../../utils/validator_ext_utils.dart';

class ProfileController extends GetxController
    with ControllerBase, ValidatorExtUtils, TextEditingControls {
  //CONSTRUCTOR
  @override
  void onInit() {
    onCreate();
    super.onInit();
  }

  //STATE
  final _displayName = ''.obs;
  final _displayEmail = ''.obs;

  final _name = ''.obs;
  final _email = ''.obs;
  final _errors = {}.obs;

  //GETTER
  String get name => _name.value;
  String get email => _email.value;
  String get displayName => _displayName.value;
  String get displayEmail => _displayEmail.value;

  dynamic getErrorText(value) {
    return _errors[value] == '' ? null : _errors[value];
  }

  //MUTATION
  void updateName(String value) {
    _name.value = value;
    validate(label: 'name', value: value, rules: 'min:5', errors: _errors);
  }

  void updateDisplayNameAndEmail(String name, String email) {
    _displayName.value = name;
    _displayEmail.value = email;
  }

  void updateEmail(String value) {
    _email.value = value;
    validate(label: 'email', value: value, rules: 'email', errors: _errors);
  }

  bool canSubmitForm(List<String> datas) => canSubmit(datas, _errors);

  // ACTIONS
  Future<void> submit() async {
    try {
      await AuthService().updateDisplayNameAndEmail(name: name, email: email);
      updateDisplayNameAndEmail(name, email);
    } catch (e) {
      rethrow;
    }
  }

  @override
  void onCreate() {
    updateEmail(FirebaseAuth.instance.currentUser!.email! ?? '');
    updateName(FirebaseAuth.instance.currentUser!.displayName! ?? '');
  }
}

class TextEditingControls {
  TextEditingController nameTextEditingController = new TextEditingController(
      text: FirebaseAuth.instance.currentUser!.displayName! ?? '');
  TextEditingController emailTextEditingController = new TextEditingController(
      text: FirebaseAuth.instance.currentUser!.email! ?? '');

  clearEditingControls() {}
}
