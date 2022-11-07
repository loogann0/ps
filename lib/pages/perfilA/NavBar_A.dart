import 'dart:io';

import 'package:flutter/material.dart';
import 'package:para_socios_1/pages/perfilA/home_A.dart';
import 'cupones_A.dart';
import 'perfil_A.dart';

class barranav_A extends StatefulWidget {
  @override
  State<barranav_A> createState() => _barranav_A();
}

class _barranav_A extends State<barranav_A> {
  int _pagina_actual = 1;
  List<Widget> _paginas = [perfil_A(), home_A(), cupones_A()];

  @override
  Widget build(BuildContext context) {
    final _size = MediaQuery.of(context).size;

    return WillPopScope(
      onWillPop: () async => exit(0),
      child: Scaffold(
          appBar: AppBar(
            titleSpacing: _size.height * 0.1,
            title: const Text(
              "Bienvenido Socio",
            ),
            centerTitle: true,
            backgroundColor: const Color.fromARGB(255, 43, 43, 43),
            automaticallyImplyLeading: false,
          ),
          body: _paginas[_pagina_actual],
          backgroundColor: Colors.white,
          bottomNavigationBar: BottomNavigationBar(
            onTap: ((index) {
              setState(() {
                _pagina_actual = index;
              });
            }),
            currentIndex: _pagina_actual,
            items: const [
              BottomNavigationBarItem(
                  icon: Icon(Icons.account_circle_outlined), label: "Perfil"),
              BottomNavigationBarItem(
                  icon: Icon(Icons.home), label: "Buscar cupones"),
              BottomNavigationBarItem(
                  icon: Icon(Icons.credit_card_sharp), label: "Mis Cupones"),
            ],
            selectedItemColor: Colors.black,
          )),
    );
  }
}
