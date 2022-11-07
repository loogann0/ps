import "package:flutter/services.dart" show rootBundle;
import 'dart:convert';
import 'dart:async';
import 'package:get/get.dart';

class Dataservices {
  Future<List<dynamic>> getUsers() async {
    var info = rootBundle.loadString("json/data.json");
    List<dynamic> list = json.decode(await info);
    print(list);
    return list.map((e) => e).toList();
  }
}
