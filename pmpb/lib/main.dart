import 'package:flutter/material.dart';
import 'package:flutter_application_1/paginas.dart';

main() => runApp(MainApp());

class MainApp extends StatelessWidget {
  const MainApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Telas(),
    );
  }
}
