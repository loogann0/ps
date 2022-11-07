import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:para_socios_1/api/crearcupon_api.dart';
import 'package:para_socios_1/pages/perfilA/NavBar_A.dart';
import 'package:para_socios_1/pages/perfilA/cupones_A.dart';
import 'package:shared_preferences/shared_preferences.dart';

class vistaCupon extends StatefulWidget {
  final String empresa;
  final String status;
  final String telefono;
  final String cuponDesc;
  final String restricciones;
  final String domicilio;
  final String categoria;
  final String descripsion;
  final String descuento;
  final String imagenemp;
  const vistaCupon({
    super.key,
    this.empresa = "",
    this.status = "",
    this.categoria = "",
    this.descripsion = "",
    this.descuento = '',
    this.domicilio = '',
    this.telefono = '',
    this.cuponDesc = '',
    this.restricciones = '',
    this.imagenemp = '',
  });

  @override
  State<vistaCupon> createState() => _vistaCuponState();
}

class _vistaCuponState extends State<vistaCupon> {
  final CrearCupon_api _crearCupon_api = CrearCupon_api();
  String username = '';
  String validcode = '';
  String email = '';
  @override
  void initState() {
    super.initState();
    userdata();
  }

  Future<void> _cupdata() async {
    final response = await _crearCupon_api.cuponCont(
        empresa: widget.empresa,
        status: 'libre',
        descuento: widget.descuento,
        categoria: widget.categoria,
        descripsion: widget.descripsion,
        domicilio: widget.domicilio,
        telefono: widget.telefono,
        cuponDesc: widget.cuponDesc,
        restricciones: widget.restricciones,
        codevalid: validcode,
        username: username,
        email: email,
        imagenemp: widget.imagenemp);
  }

  userdata() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      username = (prefs.getString('username') ?? '');
      email = (prefs.getString('email') ?? '');
      validcode = (prefs.getString('codeValid') ?? '');
    });
  }

  @override
  Widget build(BuildContext context) {
    final _size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        titleSpacing: _size.height * 0.1,
        title: Text(
          widget.empresa + ' ' + widget.descuento,
        ),
        backgroundColor: const Color.fromARGB(255, 43, 43, 43),
        automaticallyImplyLeading: false,
      ),
      body: SingleChildScrollView(
        child: Container(
          height: _size.height * 1,
          width: _size.width * 1,
          child: Center(
            child: Column(
              children: [
                SizedBox(
                  height: _size.height * .015,
                  width: _size.width * .1,
                ),
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                    image: DecorationImage(
                      fit: BoxFit.fitHeight,
                      image: AssetImage(widget.imagenemp),
                    ),
                  ),
                  height: _size.height * .2,
                  width: _size.width * .8,
                ),
                SizedBox(
                  height: _size.height * .015,
                  width: _size.width * .1,
                ),
                Container(
                  height: _size.height * .33,
                  width: _size.width * .7,
                  child: RichText(
                    text: TextSpan(
                        text: 'Hola, ',
                        style: TextStyle(color: Colors.black),
                        children: <TextSpan>[
                          TextSpan(
                            text: username,
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const TextSpan(
                            text:
                                ', adquiere este cupon de descuento exclusivo con ',
                          ),
                          TextSpan(
                            text: widget.empresa,
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const TextSpan(
                            text: ' valido por ',
                          ),
                          TextSpan(
                            text: widget.descuento,
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const TextSpan(
                            text: '.\n\n Informacion general del cupon \n',
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          TextSpan(
                            text: widget.cuponDesc,
                          ),
                          const TextSpan(
                            text: '.\n\n Restricciones del cupon \n',
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          TextSpan(
                            text: widget.restricciones,
                          ),
                          const TextSpan(
                            text: '.',
                          ),
                        ]),
                  ),
                ),
                Container(
                  alignment: AlignmentDirectional.topStart,
                  height: _size.height * .09,
                  width: _size.width * 1,
                  child: Column(
                    children: [
                      Row(
                        children: [
                          SizedBox(
                            height: _size.height * .02,
                            width: _size.width * .1,
                          ),
                          const Icon(
                            Icons.location_on_outlined,
                          ),
                          Text(
                            widget.domicilio,
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          SizedBox(
                            height: _size.height * .01,
                            width: _size.width * .1,
                          ),
                          const Icon(Icons.phone),
                          Text(widget.telefono),
                        ],
                      )
                    ],
                  ),
                ),
                SizedBox(
                  height: _size.height * .015,
                  width: _size.width * .1,
                ),
                Container(
                  height: _size.height * .3,
                  width: _size.width * .8,
                  child: Column(
                    children: [
                      RichText(
                        text: const TextSpan(
                            text:
                                'Has click en el boton de abjo para solicitar este cupon, podras usarlo desde la seccion ',
                            style: TextStyle(color: Colors.black),
                            children: <TextSpan>[
                              TextSpan(
                                text: '"Mis Cupones"',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ]),
                      ),
                      SizedBox(
                        height: _size.height * .04,
                        width: _size.width * .1,
                      ),
                      MaterialButton(
                          color: Colors.black,
                          splashColor: const Color.fromARGB(255, 92, 4, 4),
                          textColor: Colors.white,
                          onPressed: () {
                            _cupdata();
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: ((context) => barranav_A()),
                              ),
                            );
                          },
                          child: Text('Adquirir cupon')),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
