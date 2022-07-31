/*
Burada yaşam döngüsü örneği
initstate / didupdate / dispose uygulması bulunuyor.
 */

import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  _MyHomePageState() {
    print("my home page yaratılıyor.");
  }

  int aktifButon = 0;
  String istenenYazi = "";

  @override
  void didUpdateWidget(MyHomePage oldWidget) {
    super.didUpdateWidget(oldWidget);
  }

  bool checkliMi = false;
  String text = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            YaziYazmaYeri(istenenYazi: istenenYazi),
            Text(text),
            Checkbox(
                value: checkliMi,
                onChanged: (value) {
                  print(value);
                  setState(() {
                    if (value != null) {
                      checkliMi = value;
                    }
                  });
                }),
            ElevatedButton(
              // aktif buton balısılabilir halde ise 0, delise null olsun.
              onPressed: aktifButon == 0 ? (){
                print("0");
                setState(() {
                  aktifButon = (aktifButon + 1) % 3;
                  istenenYazi = "Sıfır";
                });
              } : null,
              child: const Text("0"),
            ),
            ElevatedButton(
              onPressed: aktifButon == 1 ? (){
                print("1");
                setState(() {
                  aktifButon = (aktifButon + 1) % 3;
                  istenenYazi = "Bir";
                });
              } : null,
              child: const Text("1"),
            ),
            ElevatedButton(
              onPressed: aktifButon == 2 ? (){
                print("2");
                setState(() {
                  aktifButon = (aktifButon + 1) % 3;
                  istenenYazi = "İki";
                });
              } : null,
              child: const Text("2"),
            )
          ],
        ),
      ),
    );
  }
}

class YaziYazmaYeri extends StatefulWidget {
  final String istenenYazi;
  const YaziYazmaYeri({
    Key? key, required this.istenenYazi,
  }) : super(key: key);

  @override
  State<YaziYazmaYeri> createState() => _YaziYazmaYeriState();
}

class _YaziYazmaYeriState extends State<YaziYazmaYeri> {

  late TextEditingController controller = TextEditingController();

  // alternatif olarak initstate ile de olur
  // bu durumda controller önüne late geliyor.

  // controller yarattık
  @override
  void initState() {
    super.initState();
    controller = TextEditingController();
    controller.addListener(() {
      print("yeni değer : ${controller.text}");
    });
  }

  // dispose ile yok etmek gerekiyor. Genel kural
  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  void didUpdateWidget(covariant YaziYazmaYeri oldWidget) {
    super.didUpdateWidget(oldWidget);
    if(oldWidget.istenenYazi != widget.istenenYazi){
      controller.text = widget.istenenYazi;
    }
  }

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      onChanged: (value) {
        print(value);
      },
      decoration: InputDecoration(
          suffixIcon: IconButton(
            icon: const Icon(Icons.delete),
            onPressed: (){
              controller.text = "";
            },
          )
      ),
    );
  }
}








