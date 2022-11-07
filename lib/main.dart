import 'package:flutter/material.dart';
import 'package:para_socios_1/pages/inicio_ps.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: "para_socios",
        debugShowCheckedModeBanner: false,
        home: inicio_ps());
  }
}
