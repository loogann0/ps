import 'package:get/get.dart';
import 'package:para_socios_1/services/dataServices.dart';

class dataController extends GetxController {
  var list = [].obs;
  final services = Dataservices();

  @override
  void onInit() {
    _loadData();
    super.onInit();
  }

  _loadData() async {
    var info = services.getUsers();
    list.addAll(await info);
  }
}
