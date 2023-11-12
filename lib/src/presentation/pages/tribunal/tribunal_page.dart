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
              TribunalDataSource(
                AppDatabase(),
              ),
            )..getAllTribunal(),
        child: Scaffold(
          appBar: AppBar(title: const Text('Listado de tribunales')),
          body: const _TribunalPage(),
        ));
  }
}

class _TribunalPage extends StatelessWidget {
  const _TribunalPage();

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
                    title: Text(state.tribunal[index].numero.toString()),
                    subtitle: Text(state.tribunal[index].presidente.toString()),
                    trailing: IconButton(
                        icon: const Icon(Icons.visibility),
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: ((context) =>
                                       TribunalDetailPage(
                                        tribunalTableEntity:
                                            state.tribunal[index],
                                      ))));
                        }));
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


