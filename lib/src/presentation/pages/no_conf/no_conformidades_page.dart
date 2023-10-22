import 'package:flutter/material.dart';

import 'noconf_detail_page.dart';

class NoConformidades extends StatelessWidget {
  const NoConformidades({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
      appBar: AppBar(
        title: const Text("Listado de No Conformidades"),
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
              title: const Text('No Conformidad'),
              subtitle: const Text('Descripcion'),
              trailing: IconButton(
                icon: const Icon(Icons.visibility),
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (((context) =>
                              const NoConformidadDetailPage()))));
                },
              ),
            );
          }),
    ));
  }
}
