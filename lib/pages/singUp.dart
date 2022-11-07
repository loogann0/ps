import 'package:flutter/material.dart';
import 'package:logger/logger.dart';
import 'package:para_socios_1/api/autentucacion_api.dart';
import 'package:para_socios_1/pages/login.dart';
import 'package:para_socios_1/pages/perfilA/NavBar_A.dart';
import 'package:shared_preferences/shared_preferences.dart';

class signUp extends StatefulWidget {
  const signUp({super.key});

  @override
  State<signUp> createState() => _signUpState();
}

class _signUpState extends State<signUp> {
  SharedPreferences? _prefs;
  final userTextcontroller = TextEditingController();
  final emailTextController = TextEditingController();
  final passTextController = TextEditingController();
  final codeTextController = TextEditingController();
  GlobalKey<FormState> _formkey = GlobalKey();
  String _username = '', _email = '', _password = '', _validCode = '';
  final RegistroApi _registroApi = RegistroApi();
  Logger _logger = Logger();
  String loginok = 'no';

  cargarPreferencias() async {
    _prefs = await SharedPreferences.getInstance();
  }

  guardbol() async {
    SharedPreferences boolpref = await SharedPreferences.getInstance();
    setState(() {
      loginok = 'pasele';
    });
    boolpref.setString('boolini', loginok);
  }

  @override
  void initState() {
    cargarPreferencias();

    super.initState();
  }

  Future<void> _submit() async {
    final isOk = _formkey.currentState;
    if (isOk != null && !isOk.validate()) {
    } else {
      final response = await _registroApi.register(
        username: _username,
        email: _email,
        password: _password,
        codeValid: _validCode,
      );
      guardbol();

      _prefs!.setString('username', _username);
      _prefs!.setString('email', _email);
      _prefs!.setString('password', _password);
      _prefs!.setString('codeValid', _validCode);
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => barranav_A(),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final _size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        height: _size.height,
        child: GestureDetector(
          onTap: () {
            FocusScope.of(context).unfocus();
          },
          child: SingleChildScrollView(
            child: Container(
              child: Stack(
                children: [
                  Center(
                    child: Column(
                      children: [
                        SizedBox(height: _size.height * .05),
                        const Text("Bienvenido socio",
                            style: TextStyle(
                                color: Color.fromARGB(255, 73, 73, 73),
                                fontSize: 30,
                                fontWeight: FontWeight.bold)),
                        SizedBox(
                          height: _size.height * .003,
                        ),
                        const Text(
                          "Registrate y accede ahora a los mejores descuentos,",
                          style: TextStyle(
                              fontSize: 15.0, fontWeight: FontWeight.bold),
                        ),
                        const Text("solo para ti.",
                            style: TextStyle(
                                fontSize: 15.0, fontWeight: FontWeight.bold)),
                        SizedBox(height: _size.height * .05),
                        Form(
                          key: _formkey,
                          child: Column(
                            children: [
                              Container(
                                  decoration: BoxDecoration(
                                      color: Color.fromARGB(255, 245, 247, 249),
                                      border:
                                          Border.all(color: Colors.transparent),
                                      boxShadow: const [
                                        BoxShadow(
                                            offset: Offset(1, 4),
                                            spreadRadius: .7,
                                            blurRadius: 10,
                                            color: Color.fromARGB(
                                                255, 209, 209, 209))
                                      ],
                                      borderRadius: BorderRadius.circular(10)),
                                  height: _size.height * .065,
                                  width: _size.width * .85,
                                  child: TextFormField(
                                    controller: userTextcontroller,
                                    validator: (text) {
                                      if (text!.length < 6) {
                                        return 'Tu nombre de usuario debe contener almenos 5 letras.';
                                      } else {}
                                    },
                                    onChanged: (text) {
                                      _username = text;
                                    },
                                    cursorHeight: _size.height * .035,
                                    decoration: const InputDecoration(
                                        labelText: "Nombre de usuario.",
                                        contentPadding:
                                            EdgeInsets.symmetric(vertical: 2),
                                        labelStyle:
                                            TextStyle(color: Colors.grey),
                                        hintText:
                                            "Introduce un nombre de usuario.",
                                        hintStyle:
                                            TextStyle(color: Colors.grey),
                                        enabledBorder: InputBorder.none,
                                        border: InputBorder.none),
                                  )),
                              SizedBox(height: _size.height * .05),
                              Container(
                                  decoration: BoxDecoration(
                                      color: Color.fromARGB(255, 245, 247, 249),
                                      border:
                                          Border.all(color: Colors.transparent),
                                      boxShadow: const [
                                        BoxShadow(
                                            offset: Offset(1, 4),
                                            // fromDirection(1),
                                            spreadRadius: .7,
                                            blurRadius: 10,
                                            color: Color.fromARGB(
                                                255, 209, 209, 209))
                                      ],
                                      borderRadius: BorderRadius.circular(10)),
                                  height: _size.height * .065,
                                  width: _size.width * .85,
                                  child: TextFormField(
                                    controller: emailTextController,
                                    validator: (text) {
                                      if (text!.contains("@")) {
                                      } else {
                                        return 'correo invalido.';
                                      }
                                    },
                                    onChanged: (text) {
                                      _email = text;
                                    },
                                    cursorHeight: _size.height * .035,
                                    decoration: const InputDecoration(
                                        labelText: "Correo.",
                                        contentPadding:
                                            EdgeInsets.symmetric(vertical: 2),
                                        labelStyle:
                                            TextStyle(color: Colors.grey),
                                        hintText: "Introduce tu correo.",
                                        hintStyle:
                                            TextStyle(color: Colors.grey),
                                        enabledBorder: InputBorder.none,
                                        border: InputBorder.none),
                                  )),
                              SizedBox(height: _size.height * .05),
                              Container(
                                  decoration: BoxDecoration(
                                    color: Color.fromARGB(255, 245, 247, 249),
                                    border:
                                        Border.all(color: Colors.transparent),
                                    boxShadow: const [
                                      BoxShadow(
                                        offset: Offset(1, 4),
                                        // fromDirection(1),
                                        spreadRadius: .7,
                                        blurRadius: 10,
                                        color:
                                            Color.fromARGB(255, 209, 209, 209),
                                      )
                                    ],
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  height: _size.height * .065,
                                  width: _size.width * .85,
                                  child: TextFormField(
                                    controller: passTextController,
                                    validator: (text) {
                                      if (text!.length < 6) {
                                        return 'Tu contraseña debe tener almenos 6 caracteres.';
                                      }
                                    },
                                    onChanged: (text) {
                                      _password = text;
                                    },
                                    obscureText: true,
                                    cursorHeight: _size.height * .035,
                                    decoration: const InputDecoration(
                                      labelText: "Contraseña.",
                                      contentPadding:
                                          EdgeInsets.symmetric(vertical: 2),
                                      labelStyle: TextStyle(color: Colors.grey),
                                      hintText: " Introduce tu contraseña.",
                                      hintStyle: TextStyle(color: Colors.grey),
                                      enabledBorder: InputBorder.none,
                                      border: InputBorder.none,
                                    ),
                                  )),
                              SizedBox(height: _size.height * .05),
                              Container(
                                decoration: BoxDecoration(
                                  color:
                                      const Color.fromARGB(255, 245, 247, 249),
                                  boxShadow: const [
                                    BoxShadow(
                                      offset: Offset(1, 4),
                                      spreadRadius: .7,
                                      blurRadius: 10,
                                      color: Color.fromARGB(255, 209, 209, 209),
                                    )
                                  ],
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                height: _size.height * .065,
                                width: _size.width * .7,
                                child: TextFormField(
                                  controller: codeTextController,
                                  validator: (value) {
                                    if (value != 'FROC0012LEAL') {
                                      return 'codigo invalido.';
                                    }
                                  },
                                  onChanged: (text) {
                                    _validCode = text;
                                  },
                                  cursorHeight: _size.height * .035,
                                  decoration: const InputDecoration(
                                      labelText: "codigo socios.",
                                      contentPadding:
                                          EdgeInsets.symmetric(vertical: 2),
                                      labelStyle: TextStyle(color: Colors.grey),
                                      hintText: "Introduce tu codigo socios.",
                                      hintStyle: TextStyle(color: Colors.grey),
                                      enabledBorder: InputBorder.none,
                                      border: InputBorder.none),
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(height: _size.height * .05),
                        MaterialButton(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(5.0),
                            ),
                            color: Colors.black,
                            child: const Text(
                              "inicia tu secion.",
                              style: TextStyle(color: Colors.white),
                            ),
                            onPressed: () {
                              _submit();
                            }),
                        SizedBox(height: _size.height * .0),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Text('¿Ya tienes una cuenta? -'),
                            TextButton(
                              onPressed: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: ((context) => const logIn())));
                              },
                              child: const Text(
                                'Entra aqui',
                                style: TextStyle(
                                    color: Color.fromARGB(255, 150, 14, 5)),
                              ),
                            )
                          ],
                        ),
                        Container(
                            width: _size.width * .8,
                            child: const Image(
                              image: AssetImage('assets/conla.png'),
                            ))
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
