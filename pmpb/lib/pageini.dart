import 'package:flutter_application_1/nova_publi.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'comentário.dart';
import 'dados.dart';

class Home extends StatefulWidget {
  Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<Dados> teste = [];

  get image => null;

  bool salvo = false;
  bool selecionado = false;
  int currentIndex = 0;
  bool _visible = true;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        appBarTheme: AppBarTheme(
          color: Colors.red.shade800,
        ),
      ),
      home: Scaffold(
        backgroundColor: Colors.grey.shade300,
        appBar: buildAppBar(),
        body: buildBody(),
        floatingActionButton: buildFloatingActionButton(),
      ),
    );
  }

  buildAppBar() {
    return AppBar(
      systemOverlayStyle: SystemUiOverlayStyle(
          statusBarColor: Color.fromARGB(255, 255, 47, 47)),
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Image.asset("images/brasao.png", height: 40),
          Text(
            "Página Inicial",
            style: TextStyle(color: Colors.black),
          ),
          Text("PM-PB",
              style:
                  TextStyle(fontWeight: FontWeight.bold, color: Colors.black)),
        ],
      ),
    );
  }

  buildBody() {
    return ListView.builder(
        itemCount: teste.length,
        itemBuilder: (context, index) {
          return buildItem(index);
        });
  }

  buildItem(index) {
    return SingleChildScrollView(
      child: Container(
        child: Expanded(
          child: Card(
            child: Column(
              children: [
                Text("${teste[index].titulo}",
                    style: TextStyle(fontWeight: FontWeight.bold)),
                Text(
                  "${teste[index].descricao}",
                ),
                Row(
                  children: [
                    Expanded(
                        child: image != null
                            ? Image.file(image!)
                            : Image.file(teste[index].imagem)),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    IconButton(
                        onPressed: () {},
                        icon: Icon(Icons.thumb_up_alt_outlined)),
                    IconButton(
                        onPressed: () {
                          Navigator.push(context,
                              MaterialPageRoute(builder: (context) {
                            return Coments();
                          }));
                        },
                        icon: Icon(Icons.comment_outlined)),
                    IconButton(
                        onPressed: () {}, icon: Icon(Icons.bookmark_outline)),
                    IconButton(
                        onPressed: () {}, icon: Icon(Icons.share_outlined))
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  buildFloatingActionButton() {
    return FloatingActionButton(
      onPressed: () async {
        Dados dados =
            await Navigator.push(context, MaterialPageRoute(builder: (context) {
          return novaPubli();
        }));
        setState(() {
          teste.add(dados);
        });
      },
      child: Icon(
        Icons.add,
        color: Colors.black,
      ),
      backgroundColor: Colors.red.shade700,
    );
  }
}
