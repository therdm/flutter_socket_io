import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  //TODO: Implement HomeController

  final TextEditingController userNameController = TextEditingController();

  ///this is a [Key] for the form contains username
  final GlobalKey<FormState> userNameFormKey = GlobalKey<FormState>();

  String? validateUserName(String? userName) {
    if (userName?.trim().isNotEmpty ?? false) {
      return null;
    } else {
      return 'please enter your name';
    }
  }

  bool userNameFormValidate() {
    if (userNameFormKey.currentState?.validate() ?? false) {
      log('we are good to go');
      return true;
    }
    return false;
  }

  final count = 0.obs;

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  void increment() => count.value++;
}
