import 'package:flutter/material.dart';

class PruebasDetailPage extends StatelessWidget {
  const PruebasDetailPage({super.key, this.text, this.titulo});

  final String? text;
  final String? titulo;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(titulo!),
        centerTitle: false,
      ),
      body: SingleChildScrollView(
          child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Text(
          text!,
          textAlign: TextAlign.justify,
          style: const TextStyle(fontSize: 17),
        ),
      )),
    );
  }
}
