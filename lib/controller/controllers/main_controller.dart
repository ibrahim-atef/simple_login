import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:simple_login/model/dummy_data_model.dart';
import 'dart:convert';
import 'package:flutter/services.dart' as rootBundle;

class MainController extends GetxController {
  List<Dummy> dummyDataList = [];

  onInit() {
    super.onInit();
    getDummyData();
  }

  Future<List<Dummy>> ReadJsonData() async {
    final jsondata =
        await rootBundle.rootBundle.loadString('assets/local_data/data.json');

    final list = json.decode(jsondata) as List<dynamic>;
    return list.map((e) => Dummy.fromJson(e)).toList();
  }

  getDummyData() {
    ReadJsonData().then((value) {
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
