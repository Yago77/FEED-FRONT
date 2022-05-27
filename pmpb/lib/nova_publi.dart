import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_application_1/pageini.dart';
import 'package:image_picker/image_picker.dart';

import 'dados.dart';

class novaPubli extends StatefulWidget {
  const novaPubli({Key? key}) : super(key: key);

  @override
  State<novaPubli> createState() => _novaPubliState();
}

class _novaPubliState extends State<novaPubli> {
  File? image;

  get source => null;

  Future pickImage(ImageSource source) async {
    try {
      final image = await ImagePicker().pickImage(source: source);
      if (image == null) return;

      final imageTemporaria = File(image.path);
      setState(() => this.image = imageTemporaria);
    } on PlatformException catch (e) {
      print('Failed: $e');
    }
  }

  TextEditingController edtTitulo = TextEditingController();
  TextEditingController edtDescricao = TextEditingController();

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
        appBar: buildAppBar(),
        body: buildBody(context),
      ),
    );
  }

  buildBody(BuildContext context) {
    return SingleChildScrollView(
      child: Card(
        child: Column(
          children: [
            Container(
              margin: EdgeInsets.all(10),
              child: Row(
                children: [
                  Icon(
                    Icons.person,
                    size: 40,
                  ),
                  Container(
                    margin: EdgeInsets.only(left: 20),
                    child: Text(
                      "Policial",
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                    ),
                  )
                ],
              ),
            ),
            TextField(
              maxLength: 30,
              decoration: InputDecoration(
                border: UnderlineInputBorder(),
                hintText: "Escreva o título",
                hintStyle: TextStyle(fontSize: 22),
                labelText: "Título",
                labelStyle: TextStyle(color: Colors.black, fontSize: 20),
                enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.black)),
                focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.black)),
              ),
              controller: edtTitulo,
            ),
            TextFormField(
              maxLines: 7,
              decoration: InputDecoration(
                  border: UnderlineInputBorder(),
                  hintText: "Escreva sua descrição",
                  hintStyle: TextStyle(fontSize: 22),
                  enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.black),
                  ),
                  focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.black))),
              controller: edtDescricao,
            ),
            Container(
              child: image != null
                  ? Image.file(image!)
                  : TextButton.icon(
                      onPressed: () => pickImage(ImageSource.gallery),
                      icon: Icon(Icons.photo_camera),
                      label: Text("Coloque sua imagem")),
            ),
            ElevatedButton(
                style: ElevatedButton.styleFrom(
                    primary: Colors.red.shade800, onPrimary: Colors.black),
                onPressed: () {
                  Navigator.pop(context,
                      Dados(edtTitulo.text, edtDescricao.text, image!));
                },
                child: Text("Enviar"))
          ],
        ),
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
              "Post",
              style: TextStyle(color: Colors.black),
            ),
            IconButton(
                onPressed: () {
                  Navigator.pop(context);
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
