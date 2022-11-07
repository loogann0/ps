import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'tabbar.dart';
import 'tabwiews.dart';

class home_A extends StatefulWidget {
  home_A({Key? key}) : super(key: key);

  @override
  State<home_A> createState() => _home_AState();
}

class _home_AState extends State<home_A> {
  @override
  Widget build(BuildContext context) {
    final _size = MediaQuery.of(context).size;
    final barraEnTab _misTabs = Get.put(barraEnTab());

    return Scaffold(
        body: Stack(children: [
      Positioned(
        top: _size.height * .025,
        width: _size.width * .25,
        child: Container(
          height: _size.height * .1,
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage("assets/anto.png"),
            ),
          ),
        ),
      ),
      Positioned(
        top: _size.height * .02,
        width: _size.width * 1,
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: _size.width * .1),
          child: Text(
            "Conose todas las tiendas,\ncon descuentos\nexclusivos para ti.",
            textAlign: TextAlign.center,
            style: TextStyle(
                fontSize: _size.height * .025,
                fontWeight: FontWeight.bold,
                color: const Color.fromARGB(255, 121, 120, 120)),
          ),
        ),
      ),
      Positioned(
        top: _size.height * .025,
        width: _size.width * 1.75,
        child: Container(
          height: _size.height * .1,
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage("assets/anto.png"),
            ),
          ),
        ),
      ),
      SizedBox(
        height: _size.height,
      ),
      Column(children: [
        SizedBox(
          height: _size.height * .2,
        ),
        Container(
          height: _size.height * .07,
          child: TabBar(
            indicatorColor: Colors.black,
            unselectedLabelColor: Color.fromARGB(255, 119, 119, 119),
            labelColor: Colors.black,
            tabs: _misTabs.misTabs,
            controller: _misTabs.controller,
          ),
        ),
        Expanded(
          child: TabBarView(
            controller: _misTabs.controller,
            children: const [
              tab_salud(),
              tab_moda(),
              tab_hogar(),
            ],
          ),
        )
      ])
    ]));
  }
}
