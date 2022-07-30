// Interaktif deneyim örneği
// checkbox - state'i biz tutuyoruz.

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

  @override
  void didUpdateWidget(MyHomePage oldWidget) {
    super.didUpdateWidget(oldWidget);
  }

  bool checkliMi = false;

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
              // aktif buton balısılabilir halde ise 0, değilse null olsun.
              onPressed: aktifButon == 0 ? (){
                print("0");
                setState(() {
                  aktifButon = (aktifButon + 1) % 3;
                });
              } : null,
              child: const Text("0"),
            ),
            ElevatedButton(
              onPressed: aktifButon == 1 ? (){
                print("1");
                setState(() {
                  aktifButon = (aktifButon + 1) % 3;
                });
              } : null,
              child: const Text("1"),
            ),
            ElevatedButton(
              onPressed: aktifButon == 2 ? (){
                print("2");
                setState(() {
                  aktifButon = (aktifButon + 1) % 3;
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
