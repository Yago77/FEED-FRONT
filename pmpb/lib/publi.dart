import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_application_1/pageini.dart';


class Publi extends StatefulWidget {
  const Publi({Key? key}) : super(key: key);

  @override
  State<Publi> createState() => _Publi();
}

class _Publi extends State<Publi> {
  int currentIndex = 0;

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
        
      ),
    );
  }


  

  buildBody() {
    return SingleChildScrollView(
        child: Column(children: [
      Row(
        children: [
          IconButton(
              icon: Icon(Icons.account_circle), iconSize: 55, onPressed: () {}),
          Container(
              margin: EdgeInsets.all(10),
              child: Text("Usuário"),
          ),
        ],
      ),
      Container(
        margin: EdgeInsets.only(left: 25),
        child: Row(
          children: [
            Text(
              "Título",
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 30),
            )
          ],
        ),
      ),
      Card(
        child: Column(children: [
          Container(
            padding: EdgeInsets.all(10.0),
            child: Text(
              "lorem",
              style: TextStyle(fontSize: 18),
              textAlign: TextAlign.justify,
            ),
          ),
          Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
            Container(
              child: Row(
                children: [
                  IconButton(
                    icon: Icon(Icons.thumb_up_alt_outlined),
                    onPressed: () {},
                  ),
                  Text(
                    "16",
                    style: TextStyle(fontSize: 15),
                  )
                ],
              ),
            ),
            IconButton(icon: Icon(Icons.comment_outlined), onPressed: () {}),
            IconButton(icon: Icon(Icons.bookmark_border), onPressed: () {}),
            IconButton(icon: Icon(Icons.share), onPressed: () {})
          ]),
        ]),
      ),
      Card(
        child: Row(
          children: [
            IconButton(icon: Icon(Icons.account_circle), onPressed: () {}),
            Column(
              children: [
                Text.rich(TextSpan(children: <TextSpan>[
                  TextSpan(
                      text: "Usuário\n",
                      style: TextStyle(fontWeight: FontWeight.bold)),
                  TextSpan(
                    text: "Comentário",
                  )
                ]))
              ],
            )
          ],
        ),
      ),
      Card(
        child: Row(
          children: [
            IconButton(icon: Icon(Icons.account_circle), onPressed: () {}),
            Column(
              children: [
                Text.rich(TextSpan(children: <TextSpan>[
                  TextSpan(
                      text: "Usuário\n",
                      style: TextStyle(fontWeight: FontWeight.bold)),
                  TextSpan(
                    text: "Comentário",
                  )
                ]))
              ],
            )
          ],
        ),
      ),
    ]));
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
              "Publicação",
              style: TextStyle(color: Colors.black),
            ),
            IconButton(
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return Home();
                  }));
                },
                icon: Icon(
                  Icons.close,
                  size: 30,
                  color: Colors.black,
                )),
          ],
        ));
  }
}
