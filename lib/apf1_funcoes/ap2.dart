import 'dart:math';

import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    home: OpcaoAleatoriaApp(),
  ));
}

class OpcaoAleatoriaApp extends StatefulWidget {
  const OpcaoAleatoriaApp({Key? key}) : super(key: key);

  @override
  State<OpcaoAleatoriaApp> createState() => _OpcaoAleatoriaAppState();
}

class _OpcaoAleatoriaAppState extends State<OpcaoAleatoriaApp> {
  late int numeroCorreto;
  int numeroCliques = 0;
  Color corDoFundo = Colors.black;

  @override
  void initState() {
    super.initState();

    numeroCorreto = sorteaBotao();
  }

  int sorteaBotao() {
    final numeroAleatorio = Random().nextInt(3);
    return numeroAleatorio;
  }

  void verificaSeEhBotaoCorreto(int botao) {
    if (botao == numeroCorreto) {
      setState(() {
        corDoFundo = Colors.green;
      });
      print('você acertou');
    } else if (numeroCliques < 1) {
      numeroCliques++;
      print('você tem mais uma tentativa');
    } else {
      setState(() {
        corDoFundo = Colors.red;
      });
      print('Você perdeu!');
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: corDoFundo,
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  verificaSeEhBotaoCorreto(0);
                },
                child: Text("Botao1"),
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  verificaSeEhBotaoCorreto(1);
                },
                child: Text('Botao2'),
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  verificaSeEhBotaoCorreto(2);
                },
                child: Text('Botao3'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
