import 'package:flutter/material.dart';

class DadosCadastraisPage extends StatelessWidget {
  final String texto;
  final List<String> dados;
  const DadosCadastraisPage(
      {super.key, required this.texto, required this.dados});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(texto),
      ),
      body: Center(
        child: Text(dados.length.toString()),
      ),
    );
  }
}
