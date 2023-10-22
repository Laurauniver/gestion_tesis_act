import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gestion_tesis/src/data/datasources/db/database.dart';
import 'package:gestion_tesis/src/data/datasources/local_data_sources/report_datasources.dart';
import 'package:gestion_tesis/src/presentation/pages/reports/cubit/report_cubit.dart';

class ReportesPage extends StatelessWidget {
  const ReportesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ReportCubit(
        ReportDataSources(
          AppDatabase(),
        ),
      )..getAllTutorWithTesis(),
      child: const Scaffold(
        body: Body(),
      ),
    );
  }
}

class Body extends StatelessWidget {
  const Body({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ReportCubit, ReportState>(
      builder: (context, state) {
        if (state is ReportLoading) {
          return const Center(child: CircularProgressIndicator());
        } else if (state is ReportFailure) {
          return Center(child: Text(state.message));
        } else if (state is ReportsSuccessful) {
          if (state.tutorsWithTesis.isEmpty) {
            return const Center(child: Text('No hay tutores con tesis'));
          } else {
            return ListView.builder(
              itemCount: state.tutorsWithTesis.length,
              itemBuilder: (BuildContext context, int index) {
                return ListTile(
                  title: Text(
                      state.tutorsWithTesis[index].tutor.nombre.toString()),
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


// class ReportesPage extends StatefulWidget {



//   @override
//   _ReportePageState createState() => _ReportePageState();
// }

// class _ReportePageState extends State<ReportesPage> {
//   List<TutorTableEntity> tutores = [];
//   List<TesisTableEntity> tesis = [];

//   @override
//   void initState() {
//     super.initState();
//     loadData();
//   }

//   Future<void> loadData() async {
//     final tutores = await widget.tutorRepository.getAllTutor();
//     final tesis = await widget.tesisRepository.getAllTesis();
//     setState(() {
//       this.tutores = tutores;
//       this.tesis = tesis;
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Reporte'),
//       ),
//       body: SingleChildScrollView(
//         child: DataTable(
//           columns: const [
//             DataColumn(label: Text('Tutor')),
//             DataColumn(label: Text('Tesis')),
//             DataColumn(label: Text('Año')),
//           ],
//           rows: tutores.map((tutor) {
//             List<TesisTableEntity> tesisTutor = tesis.where((t) => t.tutorId == tutor.id).toList();
//             return DataRow(cells: [
//               DataCell(Text('${tutor.nombre} ${tutor.apellidos}')),
//               DataCell(Column(
//                 children: tesisTutor.map((tesis) => Text(tesis.titulo)).toList(),
//               )),
//               DataCell(Column(
//                 children: tesisTutor
//                     .map((tesis) => Text(tesis.ano.toString()))
//                     .toList(),
//               )),
//             ]);
//           }).toList(),
//         ),
//       ),
//     );
//   }
// }