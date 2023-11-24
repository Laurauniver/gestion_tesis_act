import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gestion_tesis/src/dependencies.dart';
import 'package:gestion_tesis/src/presentation/pages/pages.dart';
import 'package:gestion_tesis/src/presentation/pages/tests/cubit/tests_cubit.dart';

class PruebasPage extends StatelessWidget {
  const PruebasPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => TestsCubit(
        testsRepository: injector(),
      )..getAllPrueba(),
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
                                  state.tests[index].tipo.toString(),
                                  style: const TextStyle(fontSize: 14),
                                ),
                                Text(state.tests[index].estado.toString()),
                              ],
                            ),
                            trailing: IconButton(
                          icon: const Icon(Icons.visibility),
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: ((context) =>
                                         TestsDetailPage(
                                        testsId: state.tests[index].id,
                                      ))));
                          }            
                        )
                      )
                    )           
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