import 'package:flutter/material.dart';
import 'package:gestion_tesis/src/presentation/pages/tribunal/tribunal_detail_page.dart';

class TribunalPage extends StatelessWidget {
  const TribunalPage({super.key});

  //final List<Tribunal> tribunales=[];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
      appBar: AppBar(
        title: const Text("Listado de Tribunales"),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: ListView.builder(
          itemCount: 5,
          itemBuilder: (BuildContext context, int index) {
            return ListTile(
              title: const Text('Tribunal'),
              subtitle: const Text('Presidente'),
              trailing: IconButton(
                icon: const Icon(Icons.visibility),
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (((context) => const TribunalDetailPge()))));
                },
              ),
            );
          }),
    ));
  }
}
