import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gestion_tesis/src/dependencies.dart';

import 'package:gestion_tesis/src/presentation/pages/tests_detail/cubit/tests_detail_cubit.dart';

class TestsDetailPage extends StatelessWidget {
  const TestsDetailPage({super.key, required this.testsId});

  final int testsId;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => TestsDetailCubit(
        testsRepository: injector(),
      )..getPruebaById(testsId),
      child: const _TestsDetailPage(),
    );
  }
}

class _TestsDetailPage extends StatelessWidget {
  const _TestsDetailPage();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Detalles de la prueba')),
      body: BlocBuilder<TestsDetailCubit, TestsDetailState>(
        builder: (BuildContext context, TestsDetailState state) {
          if (state is TestsDetailLoading) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is TestsDetailFailure) {
            return Center(child: Text(state.message));
          } else if (state is TestsDetailSuccessful) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _InfoWidget(
                  label: 'Tipo',
                  info: state.tests.tipo,
                ),
                _InfoWidget(
                  label: 'Descripción',
                  info: state.tests.descripcion,
                ),
                _InfoWidget(
                  label: 'Estado',
                  info: state.tests.estado,
                ),
                
              ],
            );
          } else {
            return Container();
          }
        },
      ),
    );
  }
}

class _InfoWidget extends StatelessWidget {
  const _InfoWidget({
    Key? key,
    required this.label,
    required this.info,
  }) : super(key: key);

  final String label;
  final String info;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            label,
            style: const TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
          ),
          Text(info,
              style:
                  const TextStyle(fontSize: 16, fontWeight: FontWeight.w300)),
        ],
      ),
    );
  }
}


// class PruebasDetailPage extends StatelessWidget {
//   const PruebasDetailPage({super.key, this.titulo});

//   final String? titulo;

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text(titulo!),
//         centerTitle: false,
//       ),
//       body: SingleChildScrollView(
//           child: Padding(
//         padding: const EdgeInsets.all(12.0),
        
//       )),
//     );
//   }
// }
