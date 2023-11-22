import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gestion_tesis/src/dependencies.dart';
import 'package:gestion_tesis/src/presentation/pages/tesis_detail/cubit/tesis_detail_cubit.dart';

class TesisDetailPage extends StatelessWidget {
  const TesisDetailPage({super.key, required this.tesisId});

  final int tesisId;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => TesisDetailCubit(
        tesisRepository: injector(),
      )..getTesisById(tesisId),
      child: const _TesisDetailPage(),
    );
  }
}

class _TesisDetailPage extends StatelessWidget {
  const _TesisDetailPage();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Detalles de la tesis')),
      body: BlocBuilder<TesisDetailCubit, TesisDetailState>(
        builder: (BuildContext context, TesisDetailState state) {
          if (state is TesisDetailLoading) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is TesisDetailFailure) {
            return Center(child: Text(state.message));
          } else if (state is TesisDetailSuccessful) {
            if (state.tesis == null) {
              return const Center(child: Text('No hay tesis'));
            } else {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _InfoWidget(
                    label: 'Título',
                    info: state.tesis.titulo,
                  ),
                  _InfoWidget(
                    label: 'Autores',
                    info: state.tesis.autores.join(', '),
                  ),
                  _InfoWidget(
                    label: 'Área',
                    info: state.tesis.area,
                  ),
                  _InfoWidget(
                    label: 'Año',
                    info: state.tesis.ano.toString(),
                  ),
                  _InfoWidget(
                    label: 'Tribunal',
                    info: state.tesis.tribunalId.toString(),
                  )
                ],
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
