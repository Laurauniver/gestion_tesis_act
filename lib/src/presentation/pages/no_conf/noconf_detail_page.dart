import 'package:flutter/material.dart';

class NoConformidadDetailPage extends StatelessWidget {
  const NoConformidadDetailPage({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Detalles'),
          leading: IconButton(
            onPressed: (){
              Navigator.pop(context);
            }, 
            icon: const Icon(Icons.arrow_back)),
        )),
    );
  }
}