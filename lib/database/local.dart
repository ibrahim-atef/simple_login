import '../model/dummy_data_model.dart';
import 'dart:convert';
import 'package:flutter/services.dart' as rootBundle;
class LocalDatabase {
 static   Future<List<Dummy>> ReadJsonData() async {
   final jsondata =
   await rootBundle.rootBundle.loadString('assets/local_data/data.json');

   final list = json.decode(jsondata) as List<dynamic>;
   return list.map((e) => Dummy.fromJson(e)).toList();
 }
}