import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:para_socios_1/controllers/data_controllers.dart';
import 'package:para_socios_1/pages/perfilA/empView.dart';
import 'package:para_socios_1/pages/perfilA/vistacupon.dart';
import 'package:para_socios_1/widget/cuponBone.dart';

class tab_salud extends StatefulWidget {
  const tab_salud({super.key});

  @override
  State<tab_salud> createState() => _tab_saludState();
}

class _tab_saludState extends State<tab_salud> {
  @override
  Widget build(BuildContext context) {
    final dataController _controller = Get.put(dataController());
    final _size = MediaQuery.of(context).size;
    return Stack(
      children: [
        Positioned(
          child: Container(
            decoration: const BoxDecoration(
              color: Color.fromARGB(255, 236, 236, 236),
            ),
            child: ListView.builder(
                shrinkWrap: false,
                itemCount: _controller.list.length,
                itemBuilder: (context, index) {
                  if (_controller.list[index]['categoria'] == 3) {
                    return InputCupon(
                      ontaptext1: "Conose esta empresa.",
                      ontaptext2: "obten este cupon.",
                      descuento: _controller.list[index]['offer'],
                      empresa: _controller.list[index]['brand'],
                      OnTapCup: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) => vistaCupon(
                              categoria: _controller.list[index]['categoria']
                                  .toString(),
                              descripsion: _controller.list[index]
                                  ['descripsion'],
                              imagenemp: _controller.list[index]['imagenemp'],
                              cuponDesc: _controller.list[index]['cuponDesc'],
                              descuento: _controller.list[index]['offer'],
                              domicilio: _controller.list[index]['domicilio'],
                              empresa: _controller.list[index]['brand'],
                              restricciones: _controller.list[index]
                                  ['restricciones'],
                              telefono: _controller.list[index]['telefono'],
                            ),
                          ),
                        );
                      },
                      OnTapEmp: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => EmpView(
                                  cuponDesc: _controller.list[index]
                                      ['cuponDesc'],
                                  restricciones: _controller.list[index]
                                      ['restricciones'],
                                  categoria: _controller.list[index]
                                      ['categoria'],
                                  descripsion: _controller.list[index]
                                      ['descripsion'],
                                  Imagenemp: _controller.list[index]
                                      ['imagenemp'],
                                  descuento: _controller.list[index]['offer'],
                                  empresa: _controller.list[index]['brand'],
                                  domicilio: _controller.list[index]
                                      ['domicilio'],
                                  telefono: _controller.list[index]['telefono'],
                                )));
                      },
                    );
                  } else {
                    return Container();
                  }
                }),
          ),
        ),
      ],
    );
  }
}

class tab_moda extends StatefulWidget {
  const tab_moda({super.key});

  @override
  State<tab_moda> createState() => _tab_modaState();
}

class _tab_modaState extends State<tab_moda> {
  @override
  Widget build(BuildContext context) {
    final dataController _controller = Get.put(dataController());
    final _size = MediaQuery.of(context).size;
    return Stack(
      children: [
        Positioned(
          child: Container(
            decoration: const BoxDecoration(
              color: Color.fromARGB(255, 236, 236, 236),
            ),
            child: ListView.builder(
                shrinkWrap: false,
                itemCount: _controller.list.length,
                itemBuilder: (context, index) {
                  if (_controller.list[index]['categoria'] == 2) {
                    return InputCupon(
                      ontaptext1: "Conose esta empresa.",
                      ontaptext2: "Obten este cupon.",
                      descuento: _controller.list[index]['offer'],
                      empresa: _controller.list[index]['brand'],
                      OnTapCup: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) => vistaCupon(
                              categoria: _controller.list[index]['categoria']
                                  .toString(),
                              descripsion: _controller.list[index]
                                  ['descripsion'],
                              imagenemp: _controller.list[index]['imagenemp'],
                              cuponDesc: _controller.list[index]['cuponDesc'],
                              descuento: _controller.list[index]['offer'],
                              domicilio: _controller.list[index]['domicilio'],
                              empresa: _controller.list[index]['brand'],
                              restricciones: _controller.list[index]
                                  ['restricciones'],
                              telefono: _controller.list[index]['telefono'],
                            ),
                          ),
                        );
                      },
                      OnTapEmp: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => EmpView(
                                  cuponDesc: _controller.list[index]
                                      ['cuponDesc'],
                                  restricciones: _controller.list[index]
                                      ['restricciones'],
                                  categoria: _controller.list[index]
                                      ['categoria'],
                                  descripsion: _controller.list[index]
                                      ['descripsion'],
                                  Imagenemp: _controller.list[index]
                                      ['imagenemp'],
                                  descuento: _controller.list[index]['offer'],
                                  empresa: _controller.list[index]['brand'],
                                  domicilio: _controller.list[index]
                                      ['domicilio'],
                                  telefono: _controller.list[index]['telefono'],
                                )));
                      },
                    );
                  } else {
                    return Container();
                  }
                  ;
                }),
          ),
        ),
      ],
    );
  }
}

class tab_hogar extends StatefulWidget {
  const tab_hogar({super.key});

  @override
  State<tab_hogar> createState() => _tab_hogarState();
}

class _tab_hogarState extends State<tab_hogar> {
  @override
  Widget build(BuildContext context) {
    final dataController _controller = Get.put(dataController());
    final _size = MediaQuery.of(context).size;
    return Stack(
      children: [
        Positioned(
          child: Container(
            decoration: const BoxDecoration(
              color: Color.fromARGB(255, 236, 236, 236),
            ),
            child: ListView.builder(
                shrinkWrap: false,
                itemCount: _controller.list.length,
                itemBuilder: (context, index) {
                  if (_controller.list[index]['categoria'] == 1) {
                    return InputCupon(
                      ontaptext1: "Conose esta empresa.",
                      ontaptext2: "obten este cupon.",
                      descuento: _controller.list[index]['offer'],
                      empresa: _controller.list[index]['brand'],
                      OnTapCup: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) => vistaCupon(
                              categoria: _controller.list[index]['categoria']
                                  .toString(),
                              descripsion: _controller.list[index]
                                  ['descripsion'],
                              imagenemp: _controller.list[index]['imagenemp'],
                              cuponDesc: _controller.list[index]['cuponDesc'],
                              descuento: _controller.list[index]['offer'],
                              domicilio: _controller.list[index]['domicilio'],
                              empresa: _controller.list[index]['brand'],
                              restricciones: _controller.list[index]
                                  ['restricciones'],
                              telefono: _controller.list[index]['telefono'],
                            ),
                          ),
                        );
                      },
                      OnTapEmp: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => EmpView(
                                  cuponDesc: _controller.list[index]
                                      ['cuponDesc'],
                                  restricciones: _controller.list[index]
                                      ['restricciones'],
                                  categoria: _controller.list[index]
                                      ['categoria'],
                                  descripsion: _controller.list[index]
                                      ['descripsion'],
                                  Imagenemp: _controller.list[index]
                                      ['imagenemp'],
                                  descuento: _controller.list[index]['offer'],
                                  empresa: _controller.list[index]['brand'],
                                  domicilio: _controller.list[index]
                                      ['domicilio'],
                                  telefono: _controller.list[index]['telefono'],
                                )));
                      },
                    );
                  } else {
                    return Container();
                  }
                }),
          ),
        ),
      ],
    );
  }
}
