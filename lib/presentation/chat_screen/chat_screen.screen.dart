import 'package:flutter/material.dart';
import 'package:flutter_socket_io/constant/appConstant/color_constant.dart';
import 'package:flutter_socket_io/constant/appConstant/sizer.dart';
import 'package:flutter_socket_io/constant/appConstant/string_constant.dart';
import 'package:flutter_socket_io/graphics/baseScreen.dart';
import 'package:flutter_socket_io/graphics/chatWidget.dart';
import 'package:flutter_socket_io/infrastructure/dal/services/remote_connection.dart';

import 'package:get/get.dart';

import 'controllers/chat_screen.controller.dart';

class ChatScreenScreen extends GetView<ChatScreenController> {
  const ChatScreenScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBaseScaffold(
      title: controller.userName.value,
      centerTitle: false,
      body: Padding(
        padding: const EdgeInsets.only(bottom: 27.0, left: 12.0, right: 8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            // Obx(() {
            //     return Text(ConnectServer.myMessageList.first.message);
            //   }
            // ),
            Expanded(
              child: Obx((){
                return ListView(
                  shrinkWrap: true,
                  children: [
                    ...List.generate(ConnectServer.myMessageList.length,
                            (index) {
                          final data = ConnectServer.myMessageList[index];
                          return ChatWidget(message: data.message, ownUser: data.senderUserName ==controller.userName.value,);
                        }
                    )
                  ],
                );
              }),
            ),
            Row(
              children: [
                Expanded(
                  child: TextFormField(
                    decoration: InputDecoration(
                        hintText: AppStringConstants.chatFieldText,
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(30),
                            borderSide: const BorderSide(color: AppColorConstants.teal)),
                        enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(30),
                            borderSide: const BorderSide(color: AppColorConstants.teal))),
                    controller: controller.messageController,
                    onChanged: (value) => controller.message.value = value,
                  ),
                ),
                AppCommonSizer.width5,
                Obx(() {
                  return GestureDetector(
                    onTap: (controller.message.value?.isNotEmpty ?? false)
                        ? () {
                            ConnectServer.sendMessage(
                                controller.message.value ?? '', controller.userName.value);
                            controller.messageController.text = '';
                          }
                        : null,
                    child: Container(
                      padding: const EdgeInsets.all(17),
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: (controller.message.value?.isNotEmpty ?? false)
                            ? AppColorConstants.teal
                            : AppColorConstants.greyColor,
                      ),
                      child: const Icon(
                        Icons.send,
                        size: 28,
                        color: AppColorConstants.whiteColor,
                      ),
                    ),
                  );
                })
              ],
            )
          ],
        ),
      ),
    );
  }
}
