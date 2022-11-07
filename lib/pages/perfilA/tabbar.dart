import 'package:flutter/material.dart';
import 'package:get/get.dart';

class barraEnTab extends GetxController with GetSingleTickerProviderStateMixin {
  late final TabController controller;
  final List<Tab> misTabs = <Tab>[
    Tab(
      text: "Salud",
    ),
    Tab(
      text: "Moda",
    ),
    Tab(
      text: "Hogar",
    )
  ];
  @override
  void onInit() {
    controller = TabController(initialIndex: 1, length: 3, vsync: this);
    super.onInit();
  }

  @override
  void onClose() {
    controller:
    dispose();

    super.onClose();
  }
}
