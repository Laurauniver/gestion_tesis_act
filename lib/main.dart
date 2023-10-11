import 'package:flutter/material.dart';
//import 'package:gestion_tesis/src/config/router/app_router.dart';
import 'package:gestion_tesis/src/presentation/pages/pantallas/Sample_page.dart';
import 'package:gestion_tesis/src/presentation/pages/pantallas/tesis_page.dart';
import 'package:gestion_tesis/src/presentation/pages/pantallas/tribunal_page.dart';


void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    //return MaterialApp.router(
      //routerConfig: appRouter,
       return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SamplePage(),
      routes: {
        '/' : (context) => SamplePage(),
        '/tesis':(context) => TesisPage(),
        '/triunal' :(context) => TribunalPage(),
      },

    );
            
  }
}