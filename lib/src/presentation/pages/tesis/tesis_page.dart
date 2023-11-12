import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gestion_tesis/src/data/datasources/db/database.dart';
import 'package:gestion_tesis/src/data/datasources/local_data_sources/tesis_datasources.dart';
import 'package:gestion_tesis/src/presentation/pages/tesis/cubit/tesis_cubit.dart';
import 'package:gestion_tesis/src/presentation/pages/tesis/tesis_detail_page.dart';

class TesisPage extends StatelessWidget {
  const TesisPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => TesisCubit(
              TesisDataSource(
          AppDatabase(),),)..getAllTesis(),
          child:  Scaffold(
            appBar: AppBar(title: const Text('Listado de tesis')),
            body: const _TesisPage(),));


  }
}

class  _TesisPage extends StatelessWidget {
  const  _TesisPage();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TesisCubit, TesisState>(
      builder: (BuildContext context, TesisState state) {
        if (state is TesisLoading) {
          return const Center(child: CircularProgressIndicator());
        } else if (state is TesisFailure) {
          return Center(child: Text(state.message));
        } else if (state is TesisSuccessful) {
          if (state.tesis.isEmpty) {
            return const Center(child: Text('No hay tesis'));
          } else {
            return ListView.builder(
              itemCount: state.tesis.length,
              itemBuilder: (BuildContext context, int index) {
                return ListTile(
                  title: Text(
                      state.tesis[index].titulo.toString()),
                  subtitle: Text(
                      state.tesis[index].autor.toString()),
                        trailing: IconButton(
                          icon: const Icon(Icons.visibility),
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: ((context) =>
                                         TesisDetailPage(
                                        titulo: state.tesis[index].titulo,
                                        text: state.tesis[index].texto,
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
