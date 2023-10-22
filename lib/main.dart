import 'package:flutter/material.dart';
import 'package:gestion_tesis/src/presentation/pages/tesis/tesis_detail_page.dart';
import 'package:gestion_tesis/src/presentation/widgets/shared/home_bottom_nav_bar.dart';

import 'src/presentation/pages/pages.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: {
        '/': (context) => const CustomBottomNavBar(),
        'home': (context) => const HomePage(),
        'tesis': (context) => const TesisPage(),
        'tesis_detail': (context) => const TesisDetailPage(),
        'tribunal': (context) => const TribunalPage(),
        'reporte': (context) => const ReportesPage(),
        'noconformidad': (context) => const NoConformidades(),
        'prueba': (context) => const PruebasPage(),
        'register': (context) => const RegisterPage(),
      },
    );
  }
}
