import '../model/dummy_data_model.dart';
import 'dart:convert';
import 'package:flutter/services.dart' as rootBundle;

class LocalDatabase {
  static Future<Dummy> ReadJsonData() async {
    final jsondata =
    await rootBundle.rootBundle.loadString('assets/local_data/data.json');

    final data = json.decode(jsondata);
    return Dummy.fromJson(data);
  }
}