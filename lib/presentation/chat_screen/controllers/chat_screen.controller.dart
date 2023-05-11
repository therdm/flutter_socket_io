import 'package:flutter/cupertino.dart';
import 'package:flutter_socket_io/infrastructure/dal/services/remote_connection.dart';
import 'package:get/get.dart';

class ChatScreenController extends GetxController {
  //TODO: Implement ChatScreenController

  final TextEditingController messageController = TextEditingController();
  RxString userName = RxString('');
  RxnString message = RxnString();

  @override
  void onInit() {
    userName.value = Get.arguments;
    ConnectServer.connectMySocket(userName.value);
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
}
