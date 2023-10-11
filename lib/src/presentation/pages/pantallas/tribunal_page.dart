import 'package:flutter/material.dart';

class TribunalPage extends StatelessWidget {
  const TribunalPage({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
      appBar: AppBar(
        title: const Text("Listado de Tribunales"),
        leading: IconButton(icon: const Icon(Icons.arrow_back), 
        onPressed: (){
          Navigator.pop(context);

        },),
      ),
      body: ListView.builder(
        itemCount: 5,
        itemBuilder: (BuildContext context, int index){
          return ListTile(
            title: Text('Tribunal $index'),
            subtitle: Text('Presidente'),
            trailing: IconButton(
            icon: Icon(Icons.visibility),
            onPressed: (){
              //Navigator.push(context,
            },),
          );
        }),
      )
    );
  }
}