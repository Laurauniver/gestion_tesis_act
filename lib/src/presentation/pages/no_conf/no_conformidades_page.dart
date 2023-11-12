import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gestion_tesis/src/data/datasources/db/database.dart';
import 'package:gestion_tesis/src/data/datasources/local_data_sources/no_conf_datasource.dart';
import 'package:gestion_tesis/src/presentation/pages/no_conf/cubit/no_conf_cubit.dart';


class NoConformidadPage extends StatelessWidget {
  const NoConformidadPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => NoConformidadCubit(
              NoConformidadDataSource(
          AppDatabase(),),)..getAllNoConformidad(),
          child:  Scaffold(
            appBar: AppBar(title: const Text('Listado de No Conformidades')),
            body: const _NoConformidadPage(),));


  }
}

class  _NoConformidadPage extends StatelessWidget {
  const  _NoConformidadPage();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NoConformidadCubit, NoConformidadState>(
      builder: (BuildContext context, NoConformidadState state) {
        if (state is NoConformidadLoading) {
          return const Center(child: CircularProgressIndicator());
        } else if (state is NoConformidadFailure) {
          return Center(child: Text(state.message));
        } else if (state is NoConformidadSuccessful) {
          if (state.noConformidad.isEmpty) {
            return const Center(child: Text('No hay No Conformidades'));
          } else {
            return ListView.builder(
              itemCount: state.noConformidad.length,
              itemBuilder: (BuildContext context, int index) {
                return ListTile(
                  title: Text(
                      state.noConformidad[index].descripcion.toString()),
                );
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
