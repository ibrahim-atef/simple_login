import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:simple_login/model/dummy_data_model.dart';

import '../../database/local.dart';


class MainController extends GetxController {
  List<Dummy> dummyDataList = [];

  onInit() {
    super.onInit();
    getDummyData();
  }


  getDummyData() {
    LocalDatabase.ReadJsonData().then((value) {
      dummyDataList = value;
      update();
    }).catchError((e) {
      Get.snackbar("Error", e.toString(),
          snackPosition: SnackPosition.TOP,
          colorText: Colors.white,
          backgroundColor: Colors.red);
    });
  }
}
