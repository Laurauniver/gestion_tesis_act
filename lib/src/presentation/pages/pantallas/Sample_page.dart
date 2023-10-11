import 'package:flutter/material.dart';
import 'package:gestion_tesis/src/presentation/pages/pantallas/tesis_page.dart';
import 'package:gestion_tesis/src/presentation/widgets/shared/custom_bottom_navegation.dart';
//import 'package:go_router/go_router.dart';

class SamplePage extends StatefulWidget {
  //static const name = 'sample-page';

  const SamplePage({super.key});
	@override
	createState() => _SamplePage();
}
class _SamplePage extends State<SamplePage> {
	@override
	Widget build(BuildContext context) {
		return Scaffold(
			appBar: AppBar(title: const Text("GraduApp"),centerTitle: true,
      actions: [IconButton( icon: Icon(Icons.person), onPressed: () {  },)],),
      bottomNavigationBar: CustomBottomNavegation(),
      body: 
      ListView(
        scrollDirection: Axis.vertical,
        children: const <Widget>[
          ListTile(
            title:  Text('Tesis'),
            onTap: (){
              Navigator.pushn(context,
              MaterialPageRoute(builder: ((context) => TesisPage()))
              );
            }
          ),
          ListTile(
            title: Text('Tribunal'),
          ),
          ListTile(
            title: Text('No conformidades'),
          ),
          ListTile(
            title: Text('Pruebas'),
          ),
        ],
      )
		);
	}
}
