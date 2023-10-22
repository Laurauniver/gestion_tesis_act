import 'package:flutter/material.dart';

class NoConformidadDetailPage extends StatelessWidget {
  const NoConformidadDetailPage({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Detalles'),
          leading: IconButton(
            onPressed: (){
              Navigator.pop(context);
            }, 
            icon: Icon(Icons.arrow_back)),
        )),
    );
  }
}