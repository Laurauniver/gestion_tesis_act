import 'package:flutter/material.dart';
import 'package:gestion_tesis/src/data/datasources/db/database.dart';

class TribunalDetailPage extends StatelessWidget {
  const TribunalDetailPage({super.key, this.tribunalTableEntity});

  final TribunalTableEntity? tribunalTableEntity;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Numero : ${tribunalTableEntity!.numero}')),
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 20),
            Text('Miembro : ${tribunalTableEntity!.miembro}',
                style: const TextStyle(fontSize: 22)),
            const SizedBox(height: 15),
            Text('Presidente : ${tribunalTableEntity!.presidente}',
                style: const TextStyle(fontSize: 22)),
            const SizedBox(height: 15),
            Text('Secretario : ${tribunalTableEntity!.secretario}',
                style: const TextStyle(fontSize: 22)),
            const SizedBox(height: 15),
            Text('Vocal : ${tribunalTableEntity!.vocal}',
                style: const TextStyle(fontSize: 22)),
          ],
        ),
      ),
    );
  }
}
