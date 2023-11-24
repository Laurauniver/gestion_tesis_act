import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gestion_tesis/src/dependencies.dart';
import 'package:gestion_tesis/src/presentation/pages/reports/cubit/report_cubit.dart';

class ReportesPage extends StatelessWidget {
  const ReportesPage({Key? key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ReportCubit(
        tutorRepository: injector(),
        )
      ..getAllTutor(),
      child: const Scaffold(
        body: Body(),
      ),
    );
  }
}

class Body extends StatelessWidget {
  const Body({Key? key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ReportCubit, ReportState>(
      builder: (context, state) {
        if (state is ReportLoading) {
          return const Center(child: CircularProgressIndicator());
        } else if (state is ReportFailure) {
          return Center(child: Text(state.message));
        } else if (state is ReportsSuccessful) {
          if (state.tutors.isEmpty) {
            return const Center(child: Text('No hay tutores con tesis'));
          } else {
            return ListView.builder(
              itemCount: state.tutors.length,
              itemBuilder: (BuildContext context, int index) {
                return DataTable(
                  columns: const <DataColumn>[
                    DataColumn(
                      label: Text('Tutores'),
                    ),
                    DataColumn(
                      label: Text('Cantidad de tesis'),
                    ),
                  ],
                  rows: [
                    DataRow(
                      cells: [
                        DataCell(
                          Text('${state.tutors[index].nombre} ${state.tutors[index].apellidos}'),
                        ),
                        DataCell(
                          Text(state.tutors[index].cantidadTesis.toString()),
                        ),
                      ],
                    ),
                  ],
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