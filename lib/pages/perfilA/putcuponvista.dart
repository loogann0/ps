import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:para_socios_1/api/putcup.dart';
import 'package:para_socios_1/pages/perfilA/NavBar_A.dart';
import 'package:para_socios_1/usercup/models/modelcup.dart';

class putcupon extends StatefulWidget {
  final int? id;
  final String? empresa;
  final String? codeValid;
  final String? descuento;
  final String? username;
  final String? email;
  final String? status;
  final String? createdAt;
  final String? updatedAt;
  final String? imagenemp;
  const putcupon(
      {super.key,
      this.id,
      this.empresa,
      this.codeValid,
      this.descuento,
      this.username,
      this.email,
      this.status,
      this.createdAt,
      this.updatedAt,
      this.imagenemp});

  @override
  State<putcupon> createState() => _putcuponState();
}

class _putcuponState extends State<putcupon> {
  @override
  Widget build(BuildContext context) {
    int? _id = widget.id;
    String FID = _id.toString();
    final _size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        titleSpacing: _size.height * 0.1,
        title: Text(
          widget.empresa.toString() + ' ' + widget.descuento.toString(),
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
                      image: AssetImage(widget.imagenemp.toString()),
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
                        style: const TextStyle(color: Colors.black),
                        children: <TextSpan>[
                          TextSpan(
                            text: widget.username.toString(),
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
                            text: widget.empresa,
                          ),
                          const TextSpan(
                            text: '.\n\n Restricciones del cupon \n',
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          TextSpan(
                            text: widget.descuento,
                          ),
                          TextSpan(
                            text: FID,
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
                            widget.empresa.toString(),
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
                          Text(widget.empresa.toString()),
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
                          onPressed: () async {
                            var id = FID;
                            var stat = cupoUserClass(status: "usado");
                            var response =
                                await BaseCkient().put(stat, "/edit/$id");
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: ((context) => barranav_A()),
                              ),
                            );
                          },
                          child: Text('Canjear este cupon')),
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
