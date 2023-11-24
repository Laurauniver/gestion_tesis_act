import 'dart:convert';
import 'package:gestion_tesis/src/data/models/prueba.dart';

class TestsRemoteDataSource {
  const TestsRemoteDataSource();

  //Obtener todos

  Future<List<Prueba>> getAllPrueba() async {
    await Future.delayed(const Duration(seconds: 2));

    // Decodifica el JSON
    Map<String, dynamic> data = json.decode(tests);

    return (data['tests'] as List<dynamic>)
        .map((e) => Prueba.fromMap(e))
        .toList();
  }

  Future<Prueba> getPruebaById(int id) async {
    await Future.delayed(const Duration(seconds: 2));

    // Decodifica el JSON
    Map<String, dynamic> data = json.decode(tests);

    return (data['tests'] as List<dynamic>)
        .map((e) => Prueba.fromMap(e))
        .toList()
        .firstWhere((element) => element.id == id);
  }
}

const tests = '''
{
    "tests": [
        {
            "id": 1,
            "estado": "Ejecutado",
            "tipo": "Prueba de funcionalidad",
            "descripcion": "Esta es una prueba para validar la funcionalidad"
        },
        {
            "id": 2,
            "estado": "Sin ejecutar",
            "tipo": "Prueba de rendimiento",
            "descripcion": "Esta es una prueba para medir el rendimiento del sistema"
        }
    ]
}
''';
