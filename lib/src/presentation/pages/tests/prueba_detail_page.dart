import 'package:flutter/material.dart';

class PruebasDetailPage extends StatelessWidget {
  const PruebasDetailPage({super.key, this.titulo});

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
        
      )),
    );
  }
}
