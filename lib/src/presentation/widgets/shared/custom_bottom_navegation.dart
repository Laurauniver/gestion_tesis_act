import 'package:flutter/material.dart';

class CustomBottomNavegation extends StatelessWidget {
  const CustomBottomNavegation({super.key});

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      items: const [
       BottomNavigationBarItem(
        icon: Icon(Icons.home_max),
        label: 'Inicio'
       ),
       BottomNavigationBarItem(
        icon: Icon(Icons.description),
        label: 'Reporte'
       ),

      ]);
  }
}