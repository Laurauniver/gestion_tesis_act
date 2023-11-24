import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gestion_tesis/src/dependencies.dart';
import 'package:gestion_tesis/src/presentation/pages/auth/auth_page.dart';
import 'package:gestion_tesis/src/presentation/pages/auth/bloc/auth_bloc.dart';
import 'package:gestion_tesis/src/presentation/pages/help_page.dart';
import 'package:gestion_tesis/src/presentation/pages/tesis_detail/tesis_detail_page.dart';
import 'package:gestion_tesis/src/presentation/widgets/home_bottom_nav_bar.dart';
import 'package:provider/provider.dart';

import 'src/presentation/pages/pages.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initializeDependencies();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        BlocProvider(
          create: (context) => AuthBloc(injector())..add(OnCheckLoginEvent()),
        ),
      ],
      child: App(),
    );
  }
}

// ignore: must_be_immutable
class App extends StatelessWidget {
  App({
    super.key,
  });

  late String initialRoute = '/';

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthBloc, AuthState>(
      builder: (context, state) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          initialRoute: state is AuthStateLogged ? 'navBar' : '/',
          routes: {
            '/': (context) => const AuthPage(),
            'navBar': (context) => const CustomBottomNavBar(),
            'home': (context) => const HomePage(),
            'tesis': (context) => const TesisPage(),
            'tesis_detail': (context) => const TesisDetailPage(tesisId: 0),
            'tribunal': (context) => const TribunalPage(),
            'tribunal_detail': (context) =>
                const TribunalDetailPage(tribunalId: 0),
            'reporte': (context) => const ReportesPage(),
            'noConformidad': (context) => const NoConformidadPage(),
            'prueba': (context) => const PruebasPage(),
            'help': (context) => const HelpPage(),
          },
        );
      },
    );
  }
}
