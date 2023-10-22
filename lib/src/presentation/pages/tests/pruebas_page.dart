import 'package:flutter/material.dart';
import 'package:gestion_tesis/src/presentation/pages/tests/prueba_detail_page.dart';

class PruebasPage extends StatelessWidget {
  const PruebasPage({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
          appBar: AppBar(
            title: const Text("Listado de pruebas"),
            leading: IconButton(
              icon: const Icon(Icons.arrow_back),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
          ),
          body: ListView.builder(
              itemCount: 20,
              itemBuilder: (BuildContext context, int index) {
                return ListTile(
                  title: const Text('Tipo de Prueba'),
                  subtitle: const Text('Descripcion'),
                  trailing: IconButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: ((context) =>
                                    const PruebasDetailPage())));
                      },
                      icon: const Icon(Icons.visibility)),
                );
              })),
    );
  }
}
