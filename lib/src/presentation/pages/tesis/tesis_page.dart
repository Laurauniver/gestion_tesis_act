import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gestion_tesis/src/dependencies.dart';
import 'package:gestion_tesis/src/presentation/pages/tesis/cubit/tesis_cubit.dart';
import 'package:gestion_tesis/src/presentation/pages/tesis_detail/tesis_detail_page.dart';

class TesisPage extends StatelessWidget {
  const TesisPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => TesisCubit(
        tesisRepository: injector(),
      )..getAllTesis(),
      child: const _TesisPage(),
    );
  }
}

class _TesisPage extends StatefulWidget {
  const _TesisPage();

  @override
  State<_TesisPage> createState() => _TesisPageState();
}

class _TesisPageState extends State<_TesisPage> {
  bool showSearch = false;
  final TextEditingController controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: showSearch
            ? TextField(
                controller: controller,
                decoration: const InputDecoration(
                  hintText: 'Búscar por titulo',
                ),
                onChanged: (value) {
                  if (value.isNotEmpty) {
                    context.read<TesisCubit>().getAllTesis(titulo: value);
                  }
                },
              )
            : const Text('Listado de tesis'),
        actions: [
          IconButton(
            onPressed: () {
              if (showSearch) {
                context.read<TesisCubit>().getAllTesis();
              }
              setState(() {
                showSearch = !showSearch;
              });
            },
            icon:
                showSearch ? const Icon(Icons.close) : const Icon(Icons.search),
          ),
        ],
      ),
      body: BlocBuilder<TesisCubit, TesisState>(
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
                                  state.tesis[index].ano.toString(),
                                  style: const TextStyle(fontSize: 14),
                                ),
                                Text(state.tesis[index].titulo.toString()),
                              ],
                            ),
                            subtitle:
                                Text(state.tesis[index].autores.join(', ')),
                            trailing: IconButton(
                                icon: const Icon(Icons.visibility),
                                onPressed: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: ((context) =>
                                              TesisDetailPage(
                                                tesisId: state.tesis[index].id,
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
