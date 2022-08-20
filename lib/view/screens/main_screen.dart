import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:simple_login/constants.dart';
import 'package:simple_login/controller/controllers/auth_controller.dart';
import 'package:simple_login/view/widget/text_utils.dart';

import '../../controller/controllers/main_controller.dart';

class MainScreen extends StatelessWidget {
  var mainController = Get.put(MainController());
  var authController = Get.put(AuthController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Main Screen'),
        actions: [GetBuilder<AuthController>(builder: (_) {
          return IconButton(
            icon: Icon(Icons.exit_to_app),
            onPressed: () {
              authController.signOutFromApp();
            },
          );
        })],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(13.0),
              child: KTextUtils(
                  text:
                      "welcome ${authController.auth.currentUser!.displayName} it's ${DateFormat(DateFormat.WEEKDAY).format(DateTime.now())}",
                  size: 18,
                  color: black,
                  fontWeight: FontWeight.bold,
                  textDecoration: TextDecoration.none),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: KTextUtils(
                  text:
                      "your email is >> ${authController.auth.currentUser!.email}",
                  size: 18,
                  color: black,
                  fontWeight: FontWeight.bold,
                  textDecoration: TextDecoration.none),
            ),
            SizedBox(
              height: Get.height * .05,
            ),
            buildRowItem(
              "name",
              "dose",
              "strength",
            ),
            buildDivider(),
            GetBuilder<MainController>(
              builder: (_) {
                return SizedBox(
                  height: Get.height * .5,
                  child: mainController.dummyDataList.length != 0
                      ? ListView.separated(
                          itemCount: mainController.dummyDataList.length,
                          separatorBuilder: (context, index) {
                            return buildDivider();
                          },
                          itemBuilder: (context, index) {
                            return buildRowItem(
                                mainController.dummyDataList[index].name,
                                mainController.dummyDataList[index].dose,
                                mainController.dummyDataList[index].strength);
                          })
                      : SizedBox(
                        height: Get.height * .5,
                        child: Center(
                          child: Text("No data"),
                        ),

                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }

  Divider buildDivider() {
    return Divider(
      color: Colors.black54,
      endIndent: 20,
      indent: 20,
    );
  }

  Row buildRowItem(name, dose, strength) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        KTextUtils(
            text: name,
            size: 18,
            color: mainColor,
            fontWeight: FontWeight.bold,
            textDecoration: TextDecoration.none),
        KTextUtils(
            text: dose,
            size: 18,
            color: mainColor2,
            fontWeight: FontWeight.bold,
            textDecoration: TextDecoration.none),
        KTextUtils(
            text: strength,
            size: 18,
            color: mainColor4,
            fontWeight: FontWeight.bold,
            textDecoration: TextDecoration.none),
      ],
    );
  }
}
