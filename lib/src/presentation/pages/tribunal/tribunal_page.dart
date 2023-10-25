import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gestion_tesis/src/data/datasources/db/database.dart';
import 'package:gestion_tesis/src/data/datasources/local_data_sources/tribunal_datasources.dart';
import 'package:gestion_tesis/src/presentation/pages/pages.dart';
import 'package:gestion_tesis/src/presentation/pages/tribunal/cubit/tribunal_cubit.dart';




class TribunalPage extends StatelessWidget {
  const TribunalPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => TribunalCubit(
        TribunalRepositoryImpl(
          AppDatabase(),),)..getAllTribunal(),
          child:  Scaffold(
            appBar: AppBar(title: const Text('Listado de tribunales')),
            body: const _TribunalPage(),));

          
  }
}

class  _TribunalPage extends StatelessWidget {
  const  _TribunalPage();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TribunalCubit, TribunalState>(
      builder: (BuildContext context, TribunalState state) {
        if (state is TribunalLoading) {
          return const Center(child: CircularProgressIndicator());
        } else if (state is TribunalFailure) {
          return Center(child: Text(state.message));
        } else if (state is TribunalSuccessful) {
          if (state.tribunal.isEmpty) {
            return const Center(child: Text('No hay tribunales'));
          } else {
            return ListView.builder(
              itemCount: state.tribunal.length,
              itemBuilder: (BuildContext context, int index) {
                return ListTile(
                  title: Text(
                      state.tribunal[index].numero.toString()),
                  subtitle: Text(state.tribunal[index].presidente.toString()), 
                        trailing: IconButton(
                          icon: const Icon(Icons.visibility),
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: ((context) =>
                                        const TribunalDetailPage())));
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

// import 'package:flutter/material.dart';
// import 'package:gestion_tesis/src/presentation/pages/tribunal/tribunal_detail_page.dart';

// class TribunalPage extends StatelessWidget {
//   const TribunalPage({super.key});

//   //final List<Tribunal> tribunales=[];

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//         home: Scaffold(
//       appBar: AppBar(
//         title: const Text("Listado de Tribunales"),
//         leading: IconButton(
//           icon: const Icon(Icons.arrow_back),
//           onPressed: () {
//             Navigator.pop(context);
//           },
//         ),
//       ),
//       body: ListView.builder(
//           itemCount: 5,
//           itemBuilder: (BuildContext context, int index) {
//             return ListTile(
//               title: const Text('Tribunal'),
//               subtitle: const Text('Presidente'),
//               trailing: IconButton(
//                 icon: const Icon(Icons.visibility),
//                 onPressed: () {
//                   Navigator.push(
//                       context,
//                       MaterialPageRoute(
//                           builder: (((context) => const TribunalDetailPge()))));
//                 },
//               ),
//             );
//           }),
//     ));
//   }
// }
