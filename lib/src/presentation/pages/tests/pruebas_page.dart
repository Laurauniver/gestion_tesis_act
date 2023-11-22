import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gestion_tesis/src/data/datasources/db/database.dart';
import 'package:gestion_tesis/src/data/datasources/local_data_sources/tests_datasource.dart';
import 'package:gestion_tesis/src/presentation/pages/pages.dart';
import 'package:gestion_tesis/src/presentation/pages/tests/cubit/tests_cubit.dart';



class PruebasPage extends StatelessWidget {
  const PruebasPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => TestsCubit(
              TestsDataSource(
          AppDatabase(),),)..getAllPrueba(),
          child:  Scaffold(
            appBar: AppBar(title: const Text('Listado de pruebas')),
            body: const _PruebasPage(),));


  }
}

class  _PruebasPage extends StatelessWidget {
  const  _PruebasPage();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TestsCubit, TestsState>(
      builder: (BuildContext context, TestsState state) {
        if (state is TestsLoading) {
          return const Center(child: CircularProgressIndicator());
        } else if (state is TestsFailure) {
          return Center(child: Text(state.message));
        } else if (state is TestsSuccessful) {
          if (state.tests.isEmpty) {
            return const Center(child: Text('No hay pruebas'));
          } else {
            return ListView.builder(
              itemCount: state.tests.length,
              itemBuilder: (BuildContext context, int index) {
                return ListTile(
                  title: Text(
                      state.tests[index].tipo.toString()),
                      //subtitle: Text(state.tests[index].estado.toString()),
                        trailing: IconButton(
                          icon: const Icon(Icons.visibility),
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: ((context) =>
                                         PruebasDetailPage(
                                        text: state.tests[index].texto,
                                        titulo: state.tests[index].tipo,
                                      ))));
                          }
                ));
              },
            );
          }
        } else {
          return Container();
        }

        },

    );
  }
}



// import 'package:flutter/material.dart';
// import 'package:gestion_tesis/src/data/models/tesis.dart';
// import 'package:gestion_tesis/src/presentation/pages/tesis/tesis_detail_page.dart';

// class TesisPage extends StatefulWidget {
//   const TesisPage({super.key});

//   @override
//   createState() => _TesisPage();

// }

// class _TesisPage extends State<TesisPage> {
//   final List<TesisModel> tesisList = [];
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//         home: Scaffold(
//             appBar: AppBar(
//               title: const Text("Listado de Tesis"), //centerTitle: true,
//               leading: IconButton(
//                 icon: const Icon(Icons.arrow_back),
//                 onPressed: () {
//                   Navigator.pop(context);
//                 },
//               ),
//             ),
//             body: Scrollbar(
//                 child: ListView.builder(
//                     itemCount: tesisList.length,
//                     itemBuilder: (BuildContext context, int index) {
//                       return ListTile(
//                         title: Text(tesisList[index].titulo),
//                         subtitle: Text(tesisList[index].autor),
//                         trailing: IconButton(
//                           icon: const Icon(Icons.visibility),
//                           onPressed: () {
//                             Navigator.push(
//                                 context,
//                                 MaterialPageRoute(
//                                     builder: ((context) =>
//                                         const TesisDetailPage())));
//                           },
//                         ),
//                       );
//                     }))));
//   }
// }

// import 'package:flutter/material.dart';

// import 'noconf_detail_page.dart';

// class NoConformidades extends StatelessWidget {
//   const NoConformidades({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//         home: Scaffold(
//       appBar: AppBar(
//         title: const Text("Listado de No Conformidades"),
//         leading: IconButton(
//           icon: const Icon(Icons.arrow_back),
//           onPressed: () {
//             Navigator.pop(context);
//           },
//         ),
//       ),
//       body: ListView.builder(
//           itemCount: 20,
//           itemBuilder: (BuildContext context, int index) {
//             return ListTile(
//               title: const Text('No Conformidad'),
//               subtitle: const Text('Descripcion'),
//               trailing: IconButton(
//                 icon: const Icon(Icons.visibility),
//                 onPressed: () {
//                   Navigator.push(
//                       context,
//                       MaterialPageRoute(
//                           builder: (((context) =>
//                               const NoConformidadDetailPage()))));
//                 },
//               ),
//             );
//           }),
//     ));
//   }
// }

// import 'package:flutter/material.dart';
// import 'package:gestion_tesis/src/presentation/pages/tests/prueba_detail_page.dart';

// class PruebasPage extends StatelessWidget {
//   const PruebasPage({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: Scaffold(
//           appBar: AppBar(
//             title: const Text("Listado de pruebas"),
//             leading: IconButton(
//               icon: const Icon(Icons.arrow_back),
//               onPressed: () {
//                 Navigator.pop(context);
//               },
//             ),
//           ),
//           body: ListView.builder(
//               itemCount: 20,
//               itemBuilder: (BuildContext context, int index) {
//                 return ListTile(
//                   title: const Text('Tipo de Prueba'),
//                   subtitle: const Text('Descripcion'),
//                   trailing: IconButton(
//                       onPressed: () {
//                         Navigator.push(
//                             context,
//                             MaterialPageRoute(
//                                 builder: ((context) =>
//                                     const PruebasDetailPage())));
//                       },
//                       icon: const Icon(Icons.visibility)),
//                 );
//               })),
//     );
//   }
// }
