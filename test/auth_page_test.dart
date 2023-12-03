// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:flutter_test/flutter_test.dart';
// import 'package:gestion_tesis/src/domain/repositories/auth_repository.dart';
// import 'package:gestion_tesis/src/presentation/pages/auth/bloc/auth_bloc.dart';
// import 'package:gestion_tesis/src/presentation/pages/auth/auth_page.dart';

// class FakeAuthRepository implements AuthRepository {
//   @override
//   Future<bool> checkLogin() async {
//     return true; // Simulación de inicio de sesión exitoso
//   }

//   @override
//   Future<void> logout() async {
//     // Simulación de cierre de sesión
//   }
  
//   @override
//   bool authentication(String user, String password) {
//     const String defaultUser = "admin";
//     const String defaultPassword = "admin";

//     if (user == defaultUser && password == defaultPassword) {
//       return true; // Simulación de autenticación exitosa
//     } else {
//       return false; // Simulación de autenticación fallida
//     }
//   }
// }

// void main() {
//   testWidgets('AuthPage widget test', (WidgetTester tester) async {
//     // Crea una instancia de FakeAuthRepository para simular el repositorio de autenticación
//     final fakeAuthRepository = FakeAuthRepository();

//     await tester.pumpWidget(
//       MaterialApp(
//         home: BlocProvider<AuthBloc>(
//           create: (_) => AuthBloc(fakeAuthRepository),
//           child: const AuthPage(),
//         ),
//       ),
//     );

//     // Ingresa los datos de usuario y contraseña en los campos de texto
//     await tester.enterText(find.byType(TextFormField).first, 'usuario');
//     await tester.enterText(find.byType(TextFormField).last, 'contraseña');

//     // Toca el botón "Iniciar sesión"
//     await tester.tap(find.text('Iniciar sesión'));
//     await tester.pump();

//     // Verifica que los textos "Usuario" y "***********" se encuentren en el widget.
//     expect(find.text('Usuario'), findsOneWidget);
//     expect(find.text('***********'), findsOneWidget);
//   });
// }

// //import 'package:flutter/material.dart';
// // import 'package:flutter_bloc/flutter_bloc.dart';
// // import 'package:flutter_test/flutter_test.dart';
// // import 'package:gestion_tesis/src/domain/repositories/auth_repository.dart';
// // import 'package:gestion_tesis/src/presentation/pages/auth/bloc/auth_bloc.dart';
// // import 'package:gestion_tesis/src/presentation/pages/auth/auth_page.dart';

// // void main() {
// //   testWidgets('AuthPage widget test', (WidgetTester tester) async {
// //     // Aquí puedes escribir tus pruebas
// //     AuthRepository authRepository= ; 
// //     await tester.pumpWidget(
// //   MaterialApp(
// //     home: BlocProvider<AuthBloc>(
// //       create: (_) => AuthBloc(authRepository),
// //       child: const AuthPage(),
// //     ),
// //   ),
// // );

// // //Aquí se crea un entorno de prueba con `MaterialApp` y se envuelve `AuthPage` 
// // //con `BlocProvider` para proporcionar una instancia de `AuthBloc` necesaria para el funcionamiento del widget.
// // await tester.enterText(find.byType(TextFormField).first, 'usuario');
// // await tester.enterText(find.byType(TextFormField).last, 'contraseña');
// // await tester.tap(find.text('Iniciar sesión'));
// // await tester.pump();

// //  expect(find.text('Usuario'), findsOneWidget);
// // expect(find.text('***********'), findsOneWidget);

// // //Aquí se ingresan textos en los campos de texto encontrados por `find.byType(TextFormField)`, 
// // //y luego se realiza un toque en el botón "Iniciar sesión" encontrado por `find.text('Iniciar sesión')`.


// // //Aquí se verifica que los textos "Usuario" y "***********" se encuentren en el widget.
// //   });
 
// // }
