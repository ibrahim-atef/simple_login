import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:simple_login/model/dummy_data_model.dart';

import '../../database/local.dart';

class MainController extends GetxController {
  Dummy? dummyDataList;

  List<AssociatedDrug> associatedDrug = [];

  onInit() {
    super.onInit();
    getDummyData();
  }

  getDummyData() {
    LocalDatabase.ReadJsonData().then((value) {
      dummyDataList = value;
      update();
      associatedDrug.clear();
      for (var i = 0; i > 0; i++) {
        if (dummyDataList!.problems![0].diabetes![0].medications![0]
                .medicationsClasses![0].className !=
            null) {
          associatedDrug = associatedDrug.add(AssociatedDrug.fromJson(
              dummyDataList!
                  .problems![0]
                  .diabetes![0]
                  .medications![0]
                  .medicationsClasses![0]
                  .className!
                  .associatedDrug![0])) as List<AssociatedDrug>;
          update();
        } else {
          print("no data");
        }
        update();
      }
    }).catchError((e) {
      print(e);
      Get.snackbar("Error", e.toString(),
          snackPosition: SnackPosition.TOP,
          colorText: Colors.white,
          backgroundColor: Colors.red);
    });
  }
}
