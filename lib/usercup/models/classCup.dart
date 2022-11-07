import 'modelcup.dart';

class elCupon {
  elCupon();
  static List<cupoUserClass> fromJsonList(List<dynamic> jsonList) {
    List<cupoUserClass> listacupones = [];
    if (jsonList != null) {
      for (var cupon in jsonList) {
        final cupuser = cupoUserClass.fromJson(cupon);
        listacupones.add(cupuser);
      }
    }
    return listacupones;
  }
}
