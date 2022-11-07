import 'package:flutter/material.dart';
import 'package:para_socios_1/pages/perfilA/vistacupon.dart';

class EmpView extends StatefulWidget {
  final String empresa;
  final String status;
  final String descuento;
  final int? categoria;
  final String descripsion;
  final String domicilio;
  final String telefono;
  final String cuponDesc;
  final String restricciones;
  final String Imagenemp;

  const EmpView({
    super.key,
    this.empresa = "",
    this.descuento = '',
    this.descripsion = '',
    this.domicilio = '',
    this.telefono = '',
    this.Imagenemp = '',
    this.status = '',
    this.categoria,
    this.cuponDesc = '',
    this.restricciones = '',
  });

  @override
  State<EmpView> createState() => _EmpViewState();
}

class _EmpViewState extends State<EmpView> {
  @override
  Widget build(BuildContext context) {
    final _size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        titleSpacing: _size.height * 0.1,
        title: Text(
          widget.empresa,
        ),
        backgroundColor: const Color.fromARGB(255, 43, 43, 43),
        automaticallyImplyLeading: false,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: _size.height * .08, width: _size.width * .5),
            Text(
              widget.empresa,
              style: TextStyle(fontSize: _size.height * .05),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: _size.height * .05),
            Container(
              height: _size.height * .2,
              width: _size.width * 1,
              child: Row(
                children: [
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                      image: DecorationImage(
                        fit: BoxFit.fitWidth,
                        image: AssetImage(widget.Imagenemp),
                      ),
                    ),
                    height: _size.height * 1,
                    width: _size.width * .4,
                  ),
                  Container(
                    height: _size.height * 1,
                    width: _size.width * .6,
                    child: Center(
                      child: Text(
                        widget.descripsion.toString(),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  )
                ],
              ),
            ),
            SizedBox(
              height: _size.height * .05,
              width: _size.width * .2,
            ),
            Container(
              alignment: AlignmentDirectional.topStart,
              height: _size.height * .2,
              width: _size.width * 1,
              child: Column(
                children: [
                  Row(
                    children: [
                      SizedBox(
                        height: _size.height * .05,
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
                        height: _size.height * .05,
                        width: _size.width * .1,
                      ),
                      const Icon(Icons.phone),
                      Text(widget.telefono),
                    ],
                  )
                ],
              ),
            ),
            Text(
              'En ${widget.empresa} temos  ${widget.descuento} exclusivo para ti.',
              textAlign: TextAlign.center,
            ),
            // const Text('Obten tu cupon en el boton de abajo.'),
            SizedBox(
              height: _size.height * .05,
              width: _size.width * .1,
            ),
            MaterialButton(
              textColor: Colors.white,
              onPressed: () {
                Navigator.pop(context);
              },
              color: Colors.black,
              splashColor: const Color.fromARGB(255, 92, 4, 4),
              child: const Text('Regresar a la pagina anterior'),
            )
          ],
        ),
      ),
    );
  }
}
