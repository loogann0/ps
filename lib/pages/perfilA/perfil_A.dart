import 'package:flutter/material.dart';
import 'package:para_socios_1/widget/notibone.dart';
import 'package:shared_preferences/shared_preferences.dart';

String __username = __username;
String __email = __email;
String? notiok = 'otro';
String? notiok1 = 'otro';
String? notiok2 = 'otro';

class perfil_A extends StatefulWidget {
  perfil_A({Key? key}) : super(key: key);

  @override
  State<perfil_A> createState() => _perfil_AState();
}

class _perfil_AState extends State<perfil_A> {
  // String mostrar = 'true';
  @override
  void initState() {
    super.initState();
    userData();
    loadNoti();
    saveNoti();
    saveNoti1();
    saveNoti2();
  }

  userData() async {
    SharedPreferences _prefs = await SharedPreferences.getInstance();
    setState(() {
      __email = (_prefs.getString('email') ?? '');
      __username = (_prefs.getString('username') ?? '');
    });
  }

  loadNoti() async {
    SharedPreferences notiprefs = await SharedPreferences.getInstance();
    notiok = (notiprefs.getString('notiini') ?? '');
    notiok1 = (notiprefs.getString('notiini1') ?? '');
    notiok2 = (notiprefs.getString('notiini2') ?? '');
  }

  saveNoti() async {
    SharedPreferences boolnoti = await SharedPreferences.getInstance();

    boolnoti.setString('notiini', notiok!);
  }

  saveNoti1() async {
    SharedPreferences boolnoti1 = await SharedPreferences.getInstance();

    boolnoti1.setString('notiini1', notiok1!);
  }

  saveNoti2() async {
    SharedPreferences boolnoti2 = await SharedPreferences.getInstance();

    boolnoti2.setString('notiini2', notiok2!);
  }

  @override
  Widget build(BuildContext context) {
    final _size = MediaQuery.of(context).size;

    return SingleChildScrollView(
      child: Center(
        child: Column(
          children: [
            SizedBox(
              height: _size.height * .05,
              width: _size.width * .4,
            ),
            RichText(
              text: TextSpan(
                  text: 'Hola, ',
                  style: DefaultTextStyle.of(context).style,
                  children: <TextSpan>[
                    TextSpan(
                      text: __username,
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const TextSpan(
                      text:
                          ', esperamos que estes disfutando \nnuestros descuentos, exclusivos para ti.\n\nIniciaste tu secion con el correo:\n\n',
                    ),
                    TextSpan(
                      text: __email,
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const TextSpan(
                      text:
                          '\n\nPara cambiar esta informacion, puedes \ncomunicarte con nosotros al \ncorreo: socios.froc@gmail.com. \nEn la seccion de abajo, podras encontrar \nlas novedades que tenemos para ti. ',
                    ),
                  ]),
            ),
            SizedBox(
              height: _size.height * .05,
              width: _size.width * .4,
            ),
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(25),
                color: Colors.black12,
              ),
              height: _size.height * .4,
              width: _size.width * .9,
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Noti1(),
                    Noti2(),
                    Noti3(),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Noti1() {
    if (notiok == 'no') {
      return Container();
    } else {
      return NotiBone(
        texto1: 'Aqui veras las novedades que tenemos para ti1',
        texto2: 'No olvides pasar de vez en cuando',
        textotap1: 'eliminar notificacion',
        textoTap2: 'Continuar',
        OnTap1: () {
          setState(() {
            notiok = 'no';
          });
          saveNoti();
          Navigator.pop(context);
        },
        OnTap2: () {
          Navigator.pop(context);
        },
      );
      ;
    }
    ;
  }

  Noti2() {
    if (notiok1 == 'of') {
      return Container();
    } else {
      return NotiBone(
        texto1: 'Aqui veras las novedades que tenemos para ti2',
        texto2: 'No olvides pasar de vez en cuando',
        textotap1: 'eliminar notificacion',
        textoTap2: 'Continuar',
        OnTap1: () {
          saveNoti1();
          Navigator.pop(context);
          setState(() {
            notiok1 = 'of';
          });
        },
        OnTap2: () {
          Navigator.pop(context);
        },
      );
      ;
    }
    ;
  }

  Noti3() {
    if (notiok2 == 'of') {
      return Container();
    } else {
      return NotiBone(
        texto1: 'Aqui veras las novedades que tenemos para ti3',
        texto2: 'No olvides pasar de vez en cuando',
        textotap1: 'eliminar notificacion',
        textoTap2: 'Continuar',
        OnTap1: () {
          setState(() {
            notiok2 = 'of';
          });
          saveNoti2();
          Navigator.pop(context);
        },
        OnTap2: () {
          Navigator.pop(context);
        },
      );
    }
  }
}
