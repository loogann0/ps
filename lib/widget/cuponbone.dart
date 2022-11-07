import 'package:flutter/material.dart';

class InputCupon extends StatelessWidget {
  final String empresa;
  final String descuento;
  final Function()? OnTapEmp;
  final Function()? OnTapCup;
  final String ontaptext1;
  final String ontaptext2;

  const InputCupon(
      {super.key,
      this.empresa = "",
      this.descuento = '',
      this.OnTapCup,
      this.OnTapEmp,
      this.ontaptext1 = '',
      this.ontaptext2 = ''});

  @override
  Widget build(BuildContext context) {
    final _size = MediaQuery.of(context).size;

    return Container(
      margin: EdgeInsets.symmetric(
          horizontal: _size.width * .05, vertical: _size.height * .03),
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
      height: _size.height * .15,
      width: _size.width * .9,
      child: Container(
        margin: const EdgeInsets.only(top: 2, left: 10),
        child: Row(
          children: [
            Container(
              height: _size.height * .12,
              width: _size.width * .24,
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
              width: _size.width * .02,
            ),
            Container(
              height: _size.height * .15,
              width: _size.width * .4,
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      empresa,
                      style: TextStyle(
                          fontSize: _size.height * .025,
                          color: const Color.fromARGB(255, 99, 99, 99)),
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(
                      height: _size.height * .015,
                    ),
                    Text(descuento,
                        style: TextStyle(
                            fontSize: _size.height * .020,
                            color: const Color.fromARGB(255, 99, 99, 99)))
                  ]),
            ),
            SizedBox(width: _size.width * .015),
            Container(
              child: IconButton(
                onPressed: () {
                  showModalBottomSheet(
                      shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(20))),
                      constraints: BoxConstraints(
                          maxHeight: _size.height, maxWidth: _size.width),
                      isScrollControlled: true,
                      barrierColor: Colors.black.withOpacity(.4),
                      backgroundColor: Colors.transparent,
                      context: context,
                      builder: (BuildContext bc) {
                        return Container(
                          height: _size.height * .5,
                          child: Column(children: [
                            GestureDetector(
                              onTap: OnTapEmp,
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
                                width: _size.width * .8,
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
                                            ontaptext1,
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
                                onTap: OnTapCup,
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
                                  width: _size.width * .8,
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
                                              ontaptext2,
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
