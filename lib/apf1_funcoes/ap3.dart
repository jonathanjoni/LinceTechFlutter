import 'dart:math';
import 'package:flutter/material.dart';

void main() {
  runApp(AppSorteadorDeCor());
}

class AppSorteadorDeCor extends StatefulWidget {
  const AppSorteadorDeCor({Key? key}) : super(key: key);

  @override
  State<AppSorteadorDeCor> createState() => _AppSorteadorDeCorState();
}

class _AppSorteadorDeCorState extends State<AppSorteadorDeCor> {
  String texto = "Sortear Cor";
  Color cor = Colors.yellow;

  List<Color> cores = [
    Colors.yellow,
    Colors.amber,
    Colors.purple,
    Colors.redAccent,
    Colors.white,
    Colors.green,
    Colors.pinkAccent
  ];

  Color sorteaCor() {
    int indiceCorAleatoria = Random().nextInt(cores.length);
    return cores[indiceCorAleatoria];
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              texto,
              textDirection: TextDirection.ltr,
              style: TextStyle(color: cor, fontSize: 50),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                setState(() {
                  cor = sorteaCor();
                });
              },
              child: Text("Sortear Cor"),
            ),
          ],
        ),
      ),
    );
  }
}
