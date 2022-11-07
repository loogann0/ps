import 'package:flutter/material.dart';

class NotiBone extends StatelessWidget {
  final String texto1;
  final String texto2;
  final Function()? OnTap1;
  final Function()? OnTap2;
  final String textotap1;
  final String textoTap2;

  const NotiBone({
    super.key,
    this.texto1 = "",
    this.texto2 = '',
    this.OnTap2,
    this.OnTap1,
    this.textotap1 = "",
    this.textoTap2 = '',
  });

  @override
  Widget build(BuildContext context) {
    final _size = MediaQuery.of(context).size;

    return Container(
      margin: EdgeInsets.symmetric(
          horizontal: _size.width * .05, vertical: _size.height * .01),
      decoration: const BoxDecoration(
          color: Color.fromARGB(255, 236, 236, 236),
          borderRadius: BorderRadius.all(
            Radius.circular(25),
          ),
          boxShadow: [
            BoxShadow(
                color: Color.fromARGB(255, 209, 209, 209),
                offset: Offset(3, 10),
                blurRadius: 10,
                spreadRadius: 2),
          ]),
      height: _size.height * .13,
      width: _size.width * .9,
      child: Container(
        child: Row(
          children: [
            Container(
              height: _size.height * .1,
              width: _size.width * .15,
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(10)),
                image: DecorationImage(
                  fit: BoxFit.fill,
                  image: AssetImage(
                    "assets/anto.png",
                  ),
                ),
              ),
            ),
            SizedBox(
              width: _size.width * .01,
            ),
            Container(
              height: _size.height * .15,
              width: _size.width * .45,
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      texto1,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontSize: _size.height * .023,
                          color: const Color.fromARGB(255, 99, 99, 99)),
                    ),
                    SizedBox(
                      height: _size.height * .001,
                    ),
                    Text(texto2,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontSize: _size.height * .018,
                            color: const Color.fromARGB(255, 99, 99, 99)))
                  ]),
            ),
            SizedBox(width: _size.width * .005),
            Container(
              child: IconButton(
                onPressed: () {
                  showModalBottomSheet(
                      shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(20))),
                      constraints: BoxConstraints(
                          maxHeight: _size.height * .6,
                          maxWidth: _size.width * .9),
                      isScrollControlled: true,
                      barrierColor: Colors.black.withOpacity(.4),
                      backgroundColor: Colors.transparent,
                      context: context,
                      builder: (BuildContext bc) {
                        return Container(
                          height: _size.height * .6,
                          child: Column(children: [
                            GestureDetector(
                              onTap: OnTap1,
                              child: Container(
                                decoration: const BoxDecoration(
                                    color: Color.fromARGB(255, 236, 236, 236),
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(25)),
                                    boxShadow: [
                                      BoxShadow(
                                          color:
                                              Color.fromARGB(255, 87, 86, 86),
                                          offset: Offset(3, 10),
                                          blurRadius: 10,
                                          spreadRadius: 2),
                                    ]),
                                width: _size.width * .7,
                                height: _size.height * .1,
                                child: Row(
                                  children: [
                                    FittedBox(
                                      fit: BoxFit.contain,
                                      child: Container(
                                        padding: EdgeInsets.symmetric(
                                            horizontal: _size.width * .07),
                                        child: FittedBox(
                                          fit: BoxFit.contain,
                                          child: Text(
                                            textotap1,
                                            style: const TextStyle(
                                                fontWeight: FontWeight.bold,
                                                fontSize: 18),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            SizedBox(
                              height: _size.height * .1,
                            ),
                            GestureDetector(
                                onTap: OnTap2,
                                child: Container(
                                  decoration: const BoxDecoration(
                                    color: Color.fromARGB(255, 236, 236, 236),
                                    borderRadius: BorderRadius.all(
                                      Radius.circular(25),
                                    ),
                                    boxShadow: [
                                      BoxShadow(
                                          color:
                                              Color.fromARGB(255, 87, 86, 86),
                                          offset: Offset(3, 10),
                                          blurRadius: 10,
                                          spreadRadius: 2),
                                    ],
                                  ),
                                  width: _size.width * .7,
                                  height: _size.height * .1,
                                  child: Row(
                                    children: [
                                      FittedBox(
                                        fit: BoxFit.contain,
                                        child: Container(
                                          padding: EdgeInsets.symmetric(
                                              horizontal: _size.width * .07),
                                          child: FittedBox(
                                            fit: BoxFit.contain,
                                            child: Text(
                                              textoTap2,
                                              textAlign: TextAlign.center,
                                              style: const TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 18),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ))
                          ]),
                        );
                      });
                },
                icon: const Icon(Icons.drag_handle_rounded),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
