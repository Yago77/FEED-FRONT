import 'package:flutter/material.dart';

class Grupos extends StatefulWidget {
  const Grupos({Key? key}) : super(key: key);

  @override
  State<Grupos> createState() => _GruposState();
}

class _GruposState extends State<Grupos> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Grupos"),
      ),
    );
  }
}
