import 'package:flutter/material.dart';
import 'package:flutter_socket_io/constant/constant.dart';
import 'package:flutter_socket_io/graphics/baseScreen.dart';
import 'package:flutter_socket_io/infrastructure/navigation/routes.dart';
import 'package:flutter_socket_io/infrastructure/theme/styling.dart';
import 'package:get/get.dart';
import 'controllers/home.controller.dart';

class HomeScreen extends GetView<HomeController> {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBaseScaffold(
      title: AppStringConstants.userNameInput,
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Padding(
              padding: EdgeInsets.only(right: 20.0),
              child: Text(
                AppStringConstants.infoToUser,
                textAlign: TextAlign.left,
                textScaleFactor: 2,
              ),
            ),
            AppCommonSizer.height30,
            Form(
              key: controller.userNameFormKey,
              child: TextFormField(
                decoration: const InputDecoration(
                  labelText: AppStringConstants.enterYourNameLabel,
                  border: OutlineInputBorder(),
                ),
                controller: controller.userNameController,
                validator: controller.validateUserName,
                onChanged: (f) => controller.userNameFormValidate(),
              ),
            ),
            AppCommonSizer.height30,
            TextButton(
              onPressed: () {
                if (controller.userNameFormValidate()) {
                  Get.toNamed(Routes.CHAT_SCREEN, arguments: controller.userNameController.text);
                }
              },
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(AppColorConstants.lightGreenColor),
                padding: MaterialStateProperty.all(
                  const EdgeInsets.symmetric(horizontal: 20, vertical: 13),
                ),
              ),
              child: const Text(
                AppStringConstants.enterYourName,
                style: AppStyleClass.textStyle1,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
