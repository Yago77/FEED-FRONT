import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_application_1/coment%C3%A1rio.dart';
import 'package:fluttertoast/fluttertoast.dart';

class Salvos extends StatefulWidget {
  const Salvos({Key? key}) : super(key: key);

  @override
  State<Salvos> createState() => _SalvosState();
}

class _SalvosState extends State<Salvos> {
  bool salvo = false;
  bool selecionado = false;
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        appBarTheme: AppBarTheme(
          color: Colors.red.shade800,
        ),
      ),
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.grey.shade300,
        appBar: buildAppBar(),
        body: buildBody(),
      ),
    );
  }

  buildBody() {
    return SingleChildScrollView(
      child: Column(
        children: [
          Container(
            child: Column(
              children: [
                Card(
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Container(
                              margin: EdgeInsets.fromLTRB(10, 10, 0, 0),
                              child:
                                  Image.asset("images/police.png", height: 40)),
                          Container(
                              margin: EdgeInsets.all(10),
                              child: Text.rich(TextSpan(children: <TextSpan>[
                                TextSpan(
                                    text: "Policial Santos\n",
                                    style: TextStyle(
                                        fontSize: 17,
                                        fontWeight: FontWeight.bold)),
                              ]))),
                        ],
                      ),
                      Column(
                        children: [
                          Row(
                            children: [
                              Container(
                                  margin: EdgeInsets.fromLTRB(25, 12, 0, 0),
                                  child: Text(
                                    "Adolescentes são abordados com maconha",
                                    style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold),
                                  )),
                            ],
                          ),
                          Row(
                            children: [
                              Expanded(
                                  child: Image.asset("images/policial.png"))
                            ],
                          ),
                          Row(
                            children: [
                              Expanded(
                                  child: Container(
                                margin: EdgeInsets.all(7),
                                child: Text(
                                  "Suspeitos foram encontrados com maconha nas redondezas do Mangabeira.",
                                  style: TextStyle(fontSize: 15),
                                  textAlign: TextAlign.justify,
                                ),
                              )),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Container(
                                child: Row(
                                  children: [
                                    IconButton(
                                      icon: Icon(selecionado
                                          ? Icons.thumb_up_alt_rounded
                                          : Icons.thumb_up_alt_outlined),
                                      onPressed: () {
                                        setState(() {
                                          selecionado = !selecionado;
                                        });
                                      },
                                    ),
                                    Text(
                                      "25",
                                      style: TextStyle(fontSize: 15),
                                    )
                                  ],
                                ),
                              ),
                              IconButton(
                                  icon: Icon(Icons.comment_outlined),
                                  onPressed: () {
                                    Navigator.push(context,
                                        MaterialPageRoute(builder: (context) {
                                      return Coments();
                                    }));
                                  }),
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
                                  icon: Icon(salvo
                                      ? Icons.bookmark
                                      : Icons.bookmark_outline)),
                            ],
                          )
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Container(
            child: Column(
              children: [
                Card(
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Container(
                              margin: EdgeInsets.only(left: 13),
                              child:
                                  Image.asset("images/police.png", height: 40)),
                          Container(
                              margin: EdgeInsets.all(10),
                              child: Text.rich(TextSpan(children: <TextSpan>[
                                TextSpan(
                                    text: "Policial Barbosa\n",
                                    style: TextStyle(
                                        fontSize: 17,
                                        fontWeight: FontWeight.bold)),
                              ]))),
                        ],
                      ),
                      Column(
                        children: [
                          Row(
                            children: [
                              Container(
                                  margin: EdgeInsets.fromLTRB(15, 20, 0, 10),
                                  child: Text(
                                      "Abordagem policial na Praça da Paz",
                                      style: TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold)))
                            ],
                          ),
                          Row(
                            children: [
                              Expanded(
                                  child: Image.asset("images/policial.png"))
                            ],
                          ),
                          Row(
                            children: [
                              Expanded(
                                  child: Container(
                                margin: EdgeInsets.all(7),
                                child: Text(
                                  "Jovens foram abodados e revistados em ação policial realizada na Praça da Paz, no bairro dos Bancários na noite de sexta-feira.",
                                  style: TextStyle(fontSize: 15),
                                  textAlign: TextAlign.justify,
                                ),
                              )),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Container(
                                child: Row(
                                  children: [
                                    IconButton(
                                      icon: Icon(Icons.thumb_up_alt_outlined),
                                      onPressed: () {},
                                    ),
                                    Text(
                                      "12",
                                      style: TextStyle(fontSize: 15),
                                    )
                                  ],
                                ),
                              ),
                              IconButton(
                                  icon: Icon(Icons.comment_outlined),
                                  onPressed: () {
                                    Navigator.push(context,
                                        MaterialPageRoute(builder: (context) {
                                      return Coments();
                                    }));
                                  }),
                              IconButton(
                                  icon: Icon(Icons.bookmark_border),
                                  onPressed: () {}),
                              IconButton(
                                  icon: Icon(Icons.share), onPressed: () {}),
                            ],
                          )
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
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
              "Salvos",
              style: TextStyle(color: Colors.black),
            ),
            Text(
              "PM-PB",
              style: TextStyle(color: Colors.black),
            )
          ],
        ));
  }
}
