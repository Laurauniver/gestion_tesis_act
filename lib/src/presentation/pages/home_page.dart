import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ListView(
        scrollDirection: Axis.vertical,
        children: <Widget>[
          Card(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: ListTile(
                leading: const Icon(Icons.edit_document),
                title: const Text('Ver tesis', style: TextStyle(fontSize: 20)),
                onTap: () {
                  Navigator.pushNamed(context, 'tesis');
                },
                trailing: const Icon(Icons.arrow_right),
              ),
            ),
          ),
          const Divider(),
          Card(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: ListTile(
                leading: const Icon(Icons.group_add_sharp),
                title: const Text('Ver tribunales',
                    style: TextStyle(fontSize: 20)),
                onTap: () => Navigator.pushNamed(context, 'tribunal'),
                trailing: const Icon(Icons.arrow_right),
              ),
            ),
          ),
          const Divider(),
          Card(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: ListTile(
                leading: const Icon(Icons.warning),
                title: const Text('Ver no conformidades',
                    style: TextStyle(fontSize: 20)),
                onTap: () => Navigator.pushNamed(context, 'noConformidad'),
                trailing: const Icon(Icons.arrow_right),
              ),
            ),
          ),
          const Divider(),
          Card(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: ListTile(
                leading: const Icon(Icons.category),
                title:
                    const Text('Ver pruebas', style: TextStyle(fontSize: 20)),
                onTap: () => Navigator.pushNamed(context, 'prueba'),
                trailing: const Icon(Icons.arrow_right),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
