import 'package:flutter/material.dart';

class TribunalDetailPge extends StatelessWidget {
  const TribunalDetailPge({super.key});

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