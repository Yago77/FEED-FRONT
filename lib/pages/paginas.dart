import 'package:flutter/material.dart';
import 'package:flutter_application_1/pages/grupos.dart';
import 'pageini.dart';
import 'salvos.dart';

class Telas extends StatefulWidget {
  const Telas({Key? key}) : super(key: key);

  @override
  State<Telas> createState() => _TelasState();
}

class _TelasState extends State<Telas> {
  int paginaAtual = 0;
  late PageController pc;

  @override
  void initState() {
    pc = PageController(initialPage: paginaAtual);
    super.initState();
  }

  setPaginaAtual(pagina) {
    setState(() {
      paginaAtual = pagina;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        onPageChanged: setPaginaAtual,
        controller: pc,
        children: [Home(), Grupos(), Salvos()],
      ),
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.black,
        backgroundColor: Color.fromARGB(255, 116, 1, 1),
        currentIndex: paginaAtual,
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
          BottomNavigationBarItem(
              icon: Icon(Icons.groups_rounded), label: "Grupos"),
          BottomNavigationBarItem(icon: Icon(Icons.bookmark), label: "Salvos")
        ],
        onTap: (pagina) {
          pc.animateToPage(pagina,
              duration: Duration(milliseconds: 400), curve: Curves.ease);
        },
      ),
    );
  }
}
