import 'dart:convert';

import 'package:diacritic/diacritic.dart';
import 'package:gestion_tesis/src/data/models/tesis.dart';

class TesisRemoteDataSource {
  const TesisRemoteDataSource();

  //Obtener todos

  Future<List<TesisModel>> getAllTesis({String? titulo}) async {
    await Future.delayed(const Duration(milliseconds: 500));

    // Decodifica el JSON
    Map<String, dynamic> data = json.decode(tesis);

    final tesisList = (data['tesis'] as List<dynamic>)
        .map((e) => TesisModel.fromMap(e))
        .toList();

    if (titulo != null && titulo.isNotEmpty) {
      return tesisList
          .where((element) => removeDiacritics(element.titulo.toLowerCase())
              .contains(removeDiacritics(titulo.toLowerCase())))
          .toList();
    } else {
      return tesisList;
    }
  }

  Future<TesisModel> getTesisById(int id) async {
    await Future.delayed(const Duration(milliseconds: 500));

    // Decodifica el JSON
    Map<String, dynamic> data = json.decode(tesis);

    return (data['tesis'] as List<dynamic>)
        .map((e) => TesisModel.fromMap(e))
        .toList()
        .firstWhere((element) => element.id == id);
  }
}

const tesis = '''

{
  "tesis": [
    {
      "id": 1,
      "titulo": "Aplicación móvil para la Gestión de Trabajos de Diploma para el Centro de Informatización Gobierno-Empresa",
      "area": "Centro de Informatización Gobierno-Empresa",
      "ano": 2023,
      "autores": [
        "Laura Elena Rodríguez Hernández"
      ],
      "tribunalId": 2
    },
    {
      "id": 2,
      "autores": [
        "Chavely  Alfonso García",
        "Dayana García Morejón"
      ],
      "titulo": "Sistema de gestión de trabajos de diploma para el Centro de Informatización Gobierno-Empresa",
      "area": "Centro de Informatización Gobierno-Empresa",
      "ano": 2023,
      "tribunalId": 2
    },
    {
      "id": 3,
      "autores": [
        "Melissa Cribeiro Peraza",
        "Braulio Michel Torres DÍaz"
      ],
      "titulo": "Módulo para la gestión de la seguridad en el Sistema para gestión de préstamos",
      "area": "Centro de Informatización Gobierno-Empresa",
      "ano": 2023,
      "tribunalId": 2
    },
    {
      "id": 4,
      "autores": [
        "Gabriel David Milanés Torres",
        "Alexander Santa Cruz Pacheco Ortega"
      ],
      "titulo": "Sistema para la gestión de los proyectos de desarrollo de software en el Centro de Informatización Gobierno-Empresa",
      "area": "Centro de Informatización Gobierno-Empresa",
      "ano": 2023,
      "tribunalId": 2
    },
    {
      "id": 5,
      "autores": [
        "Adrian Aguirre Rodriguez",
        "Yisel Hernández Gómez"
      ],
      "titulo": "Módulo para la gestión de la seguridad en el Sistema para la Gestión de Cuadros",
      "area": "Centro de Informatización Gobierno-Empresa",
      "ano": 2023,
      "tribunalId": 2
    },
    {
      "id": 6,
      "autores": [
        "Jordan Téllez Pérez"
      ],
      "titulo": "Diseño de una estrategia de pruebas seguridad para aplicaciones web en en el Centro de Informatización Gobierno-Empresa",
      "area": "Centro de Informatización Gobierno-Empresa",
      "ano": 2023,
      "tribunalId": 2
    }
  ]
}
''';
