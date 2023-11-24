import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gestion_tesis/src/dependencies.dart';
import 'package:gestion_tesis/src/presentation/pages/pages.dart';
import 'package:gestion_tesis/src/presentation/pages/tribunal/cubit/tribunal_cubit.dart';

class TribunalPage extends StatelessWidget {
  const TribunalPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (context) => TribunalCubit(
        tribunalRepository: injector(),
      )..getAllTribunal(),
        child: const _TribunalPage(),
        );
  }
}

class _TribunalPage extends StatelessWidget {
  const _TribunalPage();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
          appBar: AppBar(title: const Text('Listado de tribunales')),
           body: BlocBuilder<TribunalCubit, TribunalState>(
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
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Card(
                      child: Padding(
                        padding: const EdgeInsets.all(4.0),
                        child: ListTile(
                            title: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                     'Tribunal: ' + (state.tribunal[index].numero?.toString() ?? ''),
                                      style: const TextStyle(fontSize: 16),
                                ),
                                
                                Text(state.tribunal[index].presidente),
                              ],
                            ),
                            // subtitle:
                            //     Text(state.tribunal[index].cantidadMiembros.toString()),
                            trailing: IconButton(
                                icon: const Icon(Icons.visibility),
                                onPressed: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: ((context) =>
                                              TribunalDetailPage(
                                                tribunalId : state.tribunal[index].id,
                                              ))));
                                })),
                      ),
                    ),
                  );
                },
              );
            }
          } else {
            return Container();
          }
        },
      ),
    );
  }
}

//           body: BlocBuilder<TribunalCubit, TribunalState>(
//       builder: (BuildContext context, TribunalState state) {
//         if (state is TribunalLoading) {
//           return const Center(child: CircularProgressIndicator());
//         } else if (state is TribunalFailure) {
//           return Center(child: Text(state.message));
//         } else if (state is TribunalSuccessful) {
//           if (state.tribunal.isEmpty) {
//             return const Center(child: Text('No hay tribunales'));
//           } else {
//             return  Padding(
//                 padding: const EdgeInsets.all(8.0),
//                 child: ListView.builder(
//                   itemCount: state.tribunal.length,
//                   itemBuilder: (BuildContext context, int index) {
//                     return Card(
//                       child: Padding(
//                         padding: const EdgeInsets.all(4.0),
//                         child: ListTile(
//                             title: Column(
//                               crossAxisAlignment: CrossAxisAlignment.start,
//                               children: [
//                                 Text(
//                                   state.tribunal[index].numero.toString(),
//                                   style: const TextStyle(fontSize: 14),
//                                 ),
//                                 Text(state.tribunal[index].presidente.toString()),
//                               ],
//                             ),
//                             subtitle:
//                                 Text(state.tribunal[index].cantidadMiembros.toString()),
//                             trailing: IconButton(
//                                 icon: const Icon(Icons.visibility),
//                                 onPressed: () {
//                                   Navigator.push(
//                                       context,
//                                       MaterialPageRoute(
//                                           builder: ((context) =>
//                                               TribunalDetailPage(
//                                                 tribunalId: state.tribunal[index].id,
//                                               ))));
//                                 })),
//                         )
//                     ),
//                     )}
//               );
//                 },
//               );
//             }
//           } else {
//             return Container();
//           }
//         },
//       ),
//     );
//   }
// }
                     
                                 


