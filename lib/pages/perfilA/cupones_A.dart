import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:para_socios_1/controllers/data_controllers.dart';
import 'package:para_socios_1/api/Getcup_api.dart';
import 'package:para_socios_1/pages/perfilA/getcupvista.dart';
import 'package:para_socios_1/pages/perfilA/putcuponvista.dart';
import 'package:para_socios_1/usercup/models/modelcup.dart';
import 'package:para_socios_1/widget/cuponbone.dart';
import 'package:para_socios_1/widget/notibone.dart';
import 'package:shared_preferences/shared_preferences.dart';

String __username = __username;
String __email = __email;

class cupones_A extends StatefulWidget {
  cupones_A({
    Key? key,
  }) : super(key: key);

  @override
  State<cupones_A> createState() => _cupones_AState();
}

class _cupones_AState extends State<cupones_A> {
  List<cupoUserClass> listadecupones = [];
  void getCuponesfromApi() async {
    UsCupApi().obtenerCupon().then(
      (response) {
        setState(
          () {
            Iterable list = json.decode(response.body);
            listadecupones =
                list.map((model) => cupoUserClass.fromJson(model)).toList();
          },
        );
      },
    );
  }

  @override
  void initState() {
    super.initState();
    userData();
    getCuponesfromApi();
  }

  userData() async {
    SharedPreferences _prefs = await SharedPreferences.getInstance();
    setState(() {
      __email = (_prefs.getString('email') ?? '');
      __username = (_prefs.getString('username') ?? '');
    });
  }

  @override
  Widget build(BuildContext context) {
    final dataController _controller = Get.put(dataController());
    final _size = MediaQuery.of(context).size;
    print(listadecupones);
    return Stack(children: [
      Center(
        child: Text('Estos son los cupones que has adquirido.'),
      ),
      Positioned(
        child: Container(
          decoration: const BoxDecoration(
            color: Color.fromARGB(255, 236, 236, 236),
          ),
          child: ListView.builder(
            shrinkWrap: false,
            itemCount: listadecupones.length,
            itemBuilder: (context, index) {
              if (listadecupones[index].email.toString() == __email &&
                  listadecupones[index].status != 'usado') {
                return InputCupon(
                  ontaptext1: "Ver cupon",
                  OnTapEmp: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => getnewcup(
                          username: listadecupones[index].username.toString(),
                          codeValid: listadecupones[index].codeValid.toString(),
                          createdAt: listadecupones[index].createdAt.toString(),
                          descuento: listadecupones[index].descuento.toString(),
                          email: listadecupones[index].email.toString(),
                          empresa: listadecupones[index].empresa.toString(),
                          id: listadecupones[index].id,
                          status: listadecupones[index].status.toString(),
                          updatedAt: listadecupones[index].updatedAt.toString(),
                          imagenemp: listadecupones[index].imagenemp.toString(),
                        ),
                      ),
                    );
                  },
                  ontaptext2: "Usar cupon.",
                  OnTapCup: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => putcupon(
                          username: listadecupones[index].username.toString(),
                          codeValid: listadecupones[index].codeValid.toString(),
                          createdAt: listadecupones[index].createdAt.toString(),
                          descuento: listadecupones[index].descuento.toString(),
                          email: listadecupones[index].email.toString(),
                          empresa: listadecupones[index].empresa.toString(),
                          id: listadecupones[index].id?.toInt(),
                          status: listadecupones[index].status.toString(),
                          updatedAt: listadecupones[index].updatedAt.toString(),
                          imagenemp: listadecupones[index].imagenemp.toString(),
                        ),
                      ),
                    );
                  },
                  empresa: listadecupones[index].empresa.toString(),
                  descuento: __email,
                );
              } else {
                return Container();
              }
            },
          ),
        ),
      ),
    ]);
  }
}
