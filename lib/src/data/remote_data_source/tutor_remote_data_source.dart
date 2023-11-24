import 'dart:convert';

import 'package:gestion_tesis/src/data/models/tutor_model.dart';

class TutorRemoteDataSource {
  TutorRemoteDataSource();

  Future<List<TutorModel>> getAllTutor() async {
    await Future.delayed(const Duration(seconds: 2));

    // Decodifica el JSON
    Map<String, dynamic> data = json.decode(tutor);

    return (data['tutor'] as List<dynamic>)
        .map((e) => TutorModel.fromMap(e))
        .toList();
  }

  Future<TutorModel> getTutorById(int id) async {
    await Future.delayed(const Duration(seconds: 2));

    // Decodifica el JSON
    Map<String, dynamic> data = json.decode(tutor);

    return (data['tutor'] as List<Map<String, dynamic>>)
        .map((e) => TutorModel.fromMap(e))
        .toList()
        .firstWhere((element) => element.id == id);
  }
}

const tutor= '''
{
  "tutor": [
    {
      "id": 1,
      "nombre": "Yordanis",
      "apellidos": "García Leiva",
      "categoria": "Master en Ciencias",
      "cantidadTesis": 3
    },
    {
        "id": 2,
        "nombre": "Yeleny",
        "apellidos": "Almora Galvez",
        "categoria": "Master en Ciencias",
        "cantidadTesis": 1
    },
    {
      "id": 3,
      "nombre": "Camilo",
      "apellidos": "Tamayo Morales",
      "categoria": "Ingeniero",
      "cantidadTesis": 3
    },
    {
      "id": 4,
      "nombre": "Yoslenys",
      "apellidos": "Roque Hernández",
      "categoria": "Ingeniero",
      "cantidadTesis": 2
    },
    {
        "id": 5,
        "nombre": "Reinier",
        "apellidos": "Fernández Coello",
        "categoria": "Ingeniero",
        "cantidadTesis": 2
    }

  ]
}
''';