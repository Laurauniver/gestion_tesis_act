import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gestion_tesis/src/presentation/pages/auth/bloc/auth_bloc.dart';
import 'package:gestion_tesis/src/presentation/pages/help_page.dart';
import 'package:gestion_tesis/src/presentation/pages/pages.dart';

class CustomBottomNavBar extends StatefulWidget {
  const CustomBottomNavBar({super.key});

  @override
  _CustomBottomNavBarState createState() => _CustomBottomNavBarState();
}

class _CustomBottomNavBarState extends State<CustomBottomNavBar> {
  int _selectedIndex = 0;
  final PageController _pageController = PageController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Gestión de Trabajos de Diploma'),
        actions: [      
          IconButton(
            onPressed: () {
              context.read<AuthBloc>().add(OnLogOutEvent());
              Navigator.restorablePushNamed(context, '/');
            },
            icon: const Icon(Icons.exit_to_app),
          ),
        ],
      ),
      body: PageView(
        controller: _pageController,
        children: const [
          HomePage(),
          ReportesPage(),
          HelpPage(),
        ],
        onPageChanged: (index) {
          setState(() {
            _selectedIndex = index;
          });
        },
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Inicio',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.bar_chart),
            label: 'Reportes',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.help),
            label: 'Acerca de',
          ),
        ],
        currentIndex: _selectedIndex,
        onTap: (index) {
          _pageController.jumpToPage(index);
        },
      ),
    );
  }
}
