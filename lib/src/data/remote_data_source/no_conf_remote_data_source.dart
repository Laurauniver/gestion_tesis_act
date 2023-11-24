import 'dart:convert';

import 'package:gestion_tesis/src/data/models/no_conformidad.dart';

class NoConformidadRemoteDataSource {
  NoConformidadRemoteDataSource();

  Future<List<NoConformidad>> getAllNoConformidad() async {
    await Future.delayed(const Duration(seconds: 2));

    // Decodifica el JSON
    Map<String, dynamic> data = json.decode(noConformidades);

    return (data['no_conformidades'] as List<dynamic>)
        .map((e) => NoConformidad.fromMap(e))
        .toList();
  }

  Future<NoConformidad> getNoConformidadById(int id) async {
    await Future.delayed(const Duration(seconds: 2));

    // Decodifica el JSON
    Map<String, dynamic> data = json.decode(noConformidades);

    return (data['no_conformidades'] as List<Map<String, dynamic>>)
        .map((e) => NoConformidad.fromMap(e))
        .toList()
        .firstWhere((element) => element.id == id);
  }
}

const noConformidades = '''
{
  "no_conformidades": [
    {
      "id": 1,
      "estado": "Nueva",
      "descripcion": "La funcionalidad de buscar por tipo de prueba no funciona."
    },
    {
      "id": 2,
      "estado": "Resuelta",
      "descripcion": "El botón de reporte, mostraba la misma pantalla 2 veces."
    },
    {
      "id": 3,
      "estado": "Cerrada",
      "descripcion": "Problema de seguridad detectado"
    }
  ]
}
''';
