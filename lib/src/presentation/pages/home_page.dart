import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});
  @override
  Widget build(BuildContext context) {
    return ListView(
      scrollDirection: Axis.vertical,
      children: <Widget>[
        ListTile(
          title: const Text('Tesis'),
          onTap: () {
            Navigator.pushNamed(context, 'tesis');
          },
        ),
        ListTile(
          title: const Text('Tribunal'),
          onTap: () => Navigator.pushNamed(context, 'tribunal'),
        ),
        ListTile(
          title: const Text('No conformidades'),
          onTap: () => Navigator.pushNamed(context, 'noconformidad'),
        ),
        ListTile(
          title: const Text('Pruebas'),
          onTap: () => Navigator.pushNamed(context, 'prueba'),
        ),
      ],
    );
  }
}
