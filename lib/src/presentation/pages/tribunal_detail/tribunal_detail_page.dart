import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gestion_tesis/src/dependencies.dart';
import 'package:gestion_tesis/src/presentation/pages/tribunal_detail/cubit/tribunal_detail_cubit.dart';

class TribunalDetailPage extends StatelessWidget {
  const TribunalDetailPage({super.key, required this.tribunalId});

  final int tribunalId;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => TribunalDetailCubit(
        tribunalRepository: injector(),
      )..getTribunalById(tribunalId),
      child: const _TribunalDetailPage(),
    );
  }
}

class _TribunalDetailPage extends StatelessWidget {
  const _TribunalDetailPage();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Detalles del tribunal')),
      body: BlocBuilder<TribunalDetailCubit, TribunalDetailState>(
        builder: (BuildContext context, TribunalDetailState state) {
          if (state is TribunalDetailLoading) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is TribunalDetailFailure) {
            return Center(child: Text(state.message));
          } else if (state is TribunalDetailSuccessful) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _InfoWidget(
                  label: 'Tribunal',
                  info: state.tribunal.numero.toString(),
                ),
                _InfoWidget(
                    label: 'Presidente', info: state.tribunal.presidente),
                _InfoWidget(
                    label: 'Miembros',
                    info: state.tribunal.miembros.map((miembro) => '$miembro').join('\n'),
                ),
                   
                // _InfoWidget(
                //   label: 'Miembros',
                //   info: state.tribunal.miembros.join(', '),
                // ),
                // _InfoWidget(
                //   label: 'Vocales',
                //   info: state.tribunal.vocal.join(', '),
                // ),
                // _InfoWidget(
                //   label: 'Oponentes',
                //   info: state.tribunal.oponente.join(', '),
                // )
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


// class TribunalDetailPage extends StatelessWidget {
//   const TribunalDetailPage({super.key, this.tribunalTableEntity});

//   final TribunalTableEntity? tribunalTableEntity;

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: Text('Tribunal ${tribunalTableEntity!.numero}')),
//       body: Center(
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             const SizedBox(height: 20),
//             Text('Miembro : ${tribunalTableEntity!.miembro}',
//                 style: const TextStyle(fontSize: 22)),
//             const SizedBox(height: 15),
//             Text('Presidente : ${tribunalTableEntity!.presidente}',
//                 style: const TextStyle(fontSize: 22)),
//             const SizedBox(height: 15),
//             Text('Secretario : ${tribunalTableEntity!.secretario}',
//                 style: const TextStyle(fontSize: 22)),
//             const SizedBox(height: 15),
//             Text('Vocal : ${tribunalTableEntity!.vocal}',
//                 style: const TextStyle(fontSize: 22)),
//           ],
//         ),
//       ),
//     );
//   }
// }
