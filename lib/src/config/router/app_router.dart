import 'package:gestion_tesis/src/presentation/pages/pantallas.dart';
import 'package:gestion_tesis/src/presentation/pages/pantallas/tesis_page.dart';
import 'package:go_router/go_router.dart';

final appRouter = GoRouter(
  initialLocation: '/',
  routes: [

    GoRoute(
      path: '/',
      //name: SamplePage.name,
      builder: (context, state) => const SamplePage(),
      routes: [
        GoRoute(
      path: 'tesis',
      //name: TesisPage.name,
      builder: (context, state) => const TesisPage(),

    ),

      ]

    ),

    
  ]);