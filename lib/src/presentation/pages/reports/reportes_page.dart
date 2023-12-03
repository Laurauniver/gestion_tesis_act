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
      )..getAllTutor(),
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
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: IntrinsicWidth(
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.5),
                        spreadRadius: 1,
                        blurRadius: 1,
                        offset: const Offset(0, 1),
                      ),
                    ],
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: Table(
                      border: TableBorder.all(width: 1.0),
                      defaultVerticalAlignment:
                          TableCellVerticalAlignment.middle,
                      columnWidths: {
                        0: MaxColumnWidth(
                            FixedColumnWidth(
                                MediaQuery.of(context).size.width * 0.6),
                            const FlexColumnWidth(0.4)),
                        1: const MaxColumnWidth(
                            IntrinsicColumnWidth(), FlexColumnWidth(0.4)),
                      },
                      children: [
                        TableRow(
                          decoration: BoxDecoration(
                            color: Colors.blue,
                          ),
                          children: [
                            TableCell(
                              child: Padding(
                                padding: EdgeInsets.symmetric(
                                    horizontal: 8.0, vertical: 12.0),
                                child: Text(
                                  'Tutores',
                                  style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ),
                            TableCell(
                              child: Padding(
                                padding: EdgeInsets.symmetric(
                                    horizontal: 8.0, vertical: 12.0),
                                child: Text(
                                  'Cantidad de tesis',
                                  style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        for (final tutor in state.tutors)
                          TableRow(
                            decoration: BoxDecoration(
                              color: Colors.white,
                            ),
                            children: [
                              TableCell(
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 8.0, vertical: 12.0),
                                  child: Text(
                                    '${tutor.nombre} ${tutor.apellidos}',
                                    style: const TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.normal,
                                    ),
                                  ),
                                ),
                              ),
                              TableCell(
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 8.0, vertical: 12.0),
                                  child: Text(
                                    tutor.cantidadTesis.toString(),
                                    style: const TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.normal,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                      ],
                    ),
                  ),
                ),
              ),
            );
          }
        } else {
          return Container();
        }
      },
    );
  }
} 







//import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:gestion_tesis/src/dependencies.dart';
// import 'package:gestion_tesis/src/presentation/pages/reports/cubit/report_cubit.dart';

// class ReportesPage extends StatelessWidget {
//   const ReportesPage({Key? key});

//   @override
//   Widget build(BuildContext context) {
//     return BlocProvider(
//       create: (context) => ReportCubit(
//         tutorRepository: injector(),
//       )..getAllTutor(),
//       child: const Scaffold(
//         body: Body(),
//       ),
//     );
//   }
// }

// class Body extends StatelessWidget {
//   const Body({Key? key});

//   @override
//   Widget build(BuildContext context) {
//     return BlocBuilder<ReportCubit, ReportState>(
//       builder: (context, state) {
//         if (state is ReportLoading) {
//           return const Center(child: CircularProgressIndicator());
//         } else if (state is ReportFailure) {
//           return Center(child: Text(state.message));
//         } else if (state is ReportsSuccessful) {
//           if (state.tutors.isEmpty) {
//             return const Center(child: Text('No hay tutores con tesis'));
//           } else {
//             return Padding(
//               padding: const EdgeInsets.all(8.0),
//               child: IntrinsicWidth(
//                 child: Table(
//                   border: TableBorder.all(width: 1.0),
//                   defaultVerticalAlignment: TableCellVerticalAlignment.top,
//                   columnWidths: {
//                     0: MaxColumnWidth(
//                         FixedColumnWidth(
//                             MediaQuery.of(context).size.width * 0.6),
//                         const FlexColumnWidth(0.4)),
//                     1: const MaxColumnWidth(
//                         IntrinsicColumnWidth(), FlexColumnWidth(0.4)),
//                   },
//                   children: [
//                     const TableRow(
//                       children: [
//                         Padding(
//                           padding: EdgeInsets.symmetric(
//                               horizontal: 8.0, vertical: 12.0),
//                           child: Text(
//                             'Tutores',
//                             style: TextStyle(
//                               fontSize: 20,
//                               fontWeight: FontWeight.bold,
//                             ),
//                           ),
//                         ),
//                         Padding(
//                           padding: EdgeInsets.symmetric(
//                               horizontal: 8.0, vertical: 12.0),
//                           child: Text(
//                             'Cantidad de tesis',
//                             style: TextStyle(
//                               fontSize: 20,
//                               fontWeight: FontWeight.bold,
//                             ),
//                           ),
//                         ),
//                       ],
//                     ),
//                     for (final tutor in state.tutors)
//                       TableRow(
//                         children: [
//                           Padding(
//                             padding: const EdgeInsets.symmetric(
//                                 horizontal: 8.0, vertical: 12.0),
//                             child: Text(
//                               '${tutor.nombre} ${tutor.apellidos}',
//                               style: const TextStyle(
//                                 fontSize: 18,
//                                 fontWeight: FontWeight.normal,
//                               ),
//                             ),
//                           ),
//                           Padding(
//                             padding: const EdgeInsets.symmetric(
//                                 horizontal: 8.0, vertical: 12.0),
//                             child: Text(
//                               tutor.cantidadTesis.toString(),
//                               style: const TextStyle(
//                                 fontSize: 18,
//                                 fontWeight: FontWeight.normal,
//                               ),
//                             ),
//                           ),
//                         ],
//                       ),
//                   ],
//                 ),
//               ),
//             );
//           }
//         } else {
//           return Container();
//         }
//       },
//     );
//   }
// }
