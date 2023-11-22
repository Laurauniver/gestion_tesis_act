import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gestion_tesis/src/dependencies.dart';
import 'package:gestion_tesis/src/presentation/global_search/cubit/global_search_cubit.dart';
import 'package:gestion_tesis/src/presentation/global_search/global_search_page.dart';
import 'package:gestion_tesis/src/presentation/pages/auth/auth_page.dart';
import 'package:gestion_tesis/src/presentation/pages/auth/bloc/auth_bloc.dart';
import 'package:gestion_tesis/src/presentation/pages/help_page.dart';
import 'package:gestion_tesis/src/presentation/pages/tesis/tesis_detail_page.dart';
import 'package:gestion_tesis/src/presentation/widgets/shared/home_bottom_nav_bar.dart';

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
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) =>
              injector.call<AuthBloc>()..add(OnCheckLoginEvent()),
        ),
        BlocProvider(
          create: (context) => injector.call<GlobalSearchCubit>(),
        ),
      ],
      child: App(),
    );
  }
}

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
          initialRoute: state.isAuth == true ? '/' : 'navBar',
          routes: {
            '/': (context) => const AuthPage(),
            'navBar': (context) => const CustomBottomNavBar(),
            'home': (context) => const HomePage(),
            'tesis': (context) => const TesisPage(),
            'tesis_detail': (context) => const TesisDetailPage(),
            'tribunal': (context) => const TribunalPage(),
            'reporte': (context) => const ReportesPage(),
            'noConformidad': (context) => const NoConformidadPage(),
            'prueba': (context) => const PruebasPage(),
            'search': (context) => const GlobalSearchPage(),
            'help':(context) => const HelpPage(),
          },
        );
      },
    );
  }
}
