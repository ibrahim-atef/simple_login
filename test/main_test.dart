// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_test/flutter_test.dart';
// import 'package:mockito/mockito.dart';
// import 'package:simple_login/controller/controllers/main_controller.dart';
// import 'package:simple_login/database/local.dart';
// import 'package:simple_login/model/dummy_data_model.dart';
//
// class MockPlaceProvider extends Mock implements MainController {}
//
// void main() {
//   WidgetsFlutterBinding.ensureInitialized();
//
//   test("gettin data", () {
//     List<Dummy> dummyDataList1 = [];
//     LocalDatabase.ReadJsonData()
//         .then((value) => {dummyDataList1 = value, print(dummyDataList1)});
//     expect(dummyDataList1[0].name, "LEVI ACK");
//   });
// }
