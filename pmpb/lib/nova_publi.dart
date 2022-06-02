import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
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
    final image = await ImagePicker().pickImage(source: source);
    if (image == null) return;

    final imageTemporaria = File(image.path);
    setState(() => this.image = imageTemporaria);
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
        floatingActionButton: buildFloatingActionButton(),
      ),
    );
  }

  buildBody(BuildContext context) {
    return SingleChildScrollView(
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
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                  ),
                )
              ],
            ),
          ),
          TextField(
            decoration: InputDecoration(
              contentPadding: EdgeInsets.all(5),
              helperText: "",
              border: UnderlineInputBorder(),
              hintText: "Escreva o título",
              hintStyle: TextStyle(fontSize: 22),
              enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.black)),
              focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.black)),
            ),
            controller: edtTitulo,
          ),
          TextFormField(
            maxLines: 5,
            keyboardType: TextInputType.emailAddress,
            decoration: InputDecoration(
                contentPadding: EdgeInsets.all(5),
                helperText: "",
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
            margin: EdgeInsets.all(8),
            child: image != null
                ? Image.file(image!, height: 400, width: 450)
                : TextButton.icon(
                    onPressed: () {
                      showDialog(
                          context: context,
                          builder: (context) => Container(
                                child: SimpleDialog(
                                  children: [
                                    TextButton(
                                        onPressed: () {
                                          pickImage(ImageSource.gallery);
                                          Navigator.pop(context);
                                        },
                                        child: Text("Galeria")),
                                    TextButton(
                                        onPressed: () {
                                          pickImage(ImageSource.camera);
                                          Navigator.pop(context);
                                        },
                                        child: Text("Câmera")),
                                  ],
                                ),
                              ));
                    },
                    icon: Icon(Icons.photo_camera),
                    label: Text("Coloque sua imagem")),
          ),
          TextButton.icon(
              onPressed: () {},
              icon: Icon(Icons.groups_rounded),
              label: Text("Escolher sistemas"))
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
              "Criar Publicação",
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

   buildFloatingActionButton() {
    return FloatingActionButton(
        backgroundColor: Colors.red.shade800,
        child: Icon(Icons.check, color: Colors.black, size: 30),
        onPressed: () {
          Navigator.pop(context,
              Dados(edtTitulo.text, edtDescricao.text, imagem : image ?? null));
        });
  }
}