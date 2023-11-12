import 'package:flutter/material.dart';

class TesisDetailPage extends StatelessWidget {
  const TesisDetailPage({super.key, this.text, this.titulo});

  final String? text;
  final String? titulo;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(titulo!),
      ),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: SingleChildScrollView(
          child: Text(text!,
              textAlign: TextAlign.justify,
              style: const TextStyle(fontSize: 20)),
        ),
      ),
    );
  }
}
