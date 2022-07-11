import 'package:flutter_application_1/pages/nova_publi.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'comentario.dart';
import 'package:flutter_application_1/models/dados.dart';

class Home extends StatefulWidget {
  Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<Dados> posts = [];

  get image => null;

  bool salvo = false;
  bool selecionado = false;
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        appBarTheme: AppBarTheme(color: Colors.red.shade800),
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
      flexibleSpace: Container(
        decoration: BoxDecoration(
            gradient: LinearGradient(colors: [
          Color.fromARGB(255, 58, 2, 2),
          Color.fromARGB(255, 112, 0, 0)
        ])),
      ),
      systemOverlayStyle: SystemUiOverlayStyle(statusBarColor: Colors.black),
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Image.asset("images/brasao.png", height: 40),
          Text("PM-PB",
              style:
                  TextStyle(fontWeight: FontWeight.bold, color: Colors.black)),
        ],
      ),
    );
  }

  buildBody() {
    return ListView.builder(
        itemCount: posts.length,
        itemBuilder: (context, index) {
          return buildItem(index);
        });
  }

  buildItem(index) {
    return SingleChildScrollView(
      child: Expanded(
        child: Card(
          child: Column(
            children: [
              Row(
                children: [
                  Container(
                      margin: EdgeInsets.fromLTRB(5, 10, 10, 10),
                      child: Image.asset("images/police.png", height: 40)),
                  Container(
                    margin: EdgeInsets.all(3),
                    child: Text("Usuário\n",
                        style: TextStyle(fontWeight: FontWeight.bold)),
                  ),
                ],
              ),
              Row(
                children: [
                  Container(
                    margin: EdgeInsets.all(7),
                    child: Text("${posts[index].titulo}",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 18)),
                  ),
                ],
              ),
              Row(
                children: [
                  Expanded(child: carregarimagem(index)),
                ],
              ),
              Row(
                children: [
                  Expanded(
                    child: Container(
                      margin:
                          const EdgeInsets.only(left: 4, right: 5, bottom: 5),
                      child: Text("${posts[index].descricao}",
                          textAlign: TextAlign.justify),
                    ),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  IconButton(
                      onPressed: () {
                        setState(() {
                          selecionado = !selecionado;
                        });
                      },
                      icon: Icon(selecionado
                          ? Icons.thumb_up_alt_rounded
                          : Icons.thumb_up_alt_outlined)),
                  IconButton(
                      onPressed: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (ctx) {
                          return Coments();
                        }));
                      },
                      icon: Icon(Icons.comment_outlined)),
                  IconButton(
                      onPressed: () {
                        setState(() {
                          salvo = !salvo;
                        });
                        if (salvo) {
                          Fluttertoast.showToast(
                              msg: "Post Salvo!",
                              toastLength: Toast.LENGTH_SHORT,
                              gravity: ToastGravity.TOP,
                              timeInSecForIosWeb: 2,
                              backgroundColor: Colors.black);
                        }
                      },
                      icon: Icon(
                          salvo ? Icons.bookmark : Icons.bookmark_outline)),
                ],
              ),
            ],
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
          posts.add(dados);
        });
      },
      child: Icon(
        Icons.add,
        color: Colors.black,
      ),
      backgroundColor: Color.fromARGB(255, 116, 1, 1),
    );
  }

  carregarimagem(index) {
    try {
      return Image.file(posts[index].imagem!);
    } catch (e) {
      print(e);
      return SizedBox.shrink();
    }
  }
}
