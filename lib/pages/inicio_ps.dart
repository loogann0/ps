import 'package:flutter/material.dart';

import 'package:para_socios_1/pages/perfilA/NavBar_A.dart';
import 'package:para_socios_1/pages/singUp.dart';
import 'package:shared_preferences/shared_preferences.dart';

//
//
//
//
//
//
//
//   Raiz
String loginok = '';

class inicio_ps extends StatefulWidget {
  @override
  State<inicio_ps> createState() => _inicio_psState();
}

class _inicio_psState extends State<inicio_ps> {
  @override
  void initState() {
    super.initState();
    loadbool();
  }

  loadbool() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      loginok = (prefs.getString('boolini') ?? '');
    });
  }

  @override
  Widget build(BuildContext context) {
    final _size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: Colors.white,
      body: SizedBox(
        height: _size.height,
        width: _size.width,
        child: Column(
          children: [
            Flexible(
              flex: 1,
              child: _imagenInicio(),
            ),
            _botonInicio(),
            SizedBox(
              height: _size.height * .07,
            )
          ],
        ),
      ),
    );
  }

  _imagenInicio() {
    return Container(
      decoration: const BoxDecoration(
          image: DecorationImage(image: AssetImage("assets/anto.png"))),
    );
  }

  _botonInicio() {
    return TextButton(
      onPressed: () {
        if (loginok == 'pasele') {
          Navigator.push(
              context, MaterialPageRoute(builder: ((context) => barranav_A())));
        } else {
          Navigator.push(context,
              MaterialPageRoute(builder: ((context) => const signUp())));
        }
      },
      child: const Text(
        "Inicio de secion",
        style: TextStyle(
            color: Color.fromARGB(255, 73, 73, 73),
            fontSize: 30,
            fontWeight: FontWeight.bold),
      ),
    );
  }
}
