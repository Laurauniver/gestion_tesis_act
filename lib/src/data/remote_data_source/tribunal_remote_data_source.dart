import 'dart:convert';

import 'package:gestion_tesis/src/data/models/tribunal.dart';



class TribunalRemoteDataSource {
  TribunalRemoteDataSource();

  Future<List<Tribunal>> getAllTribunal() async {
    await Future.delayed(const Duration(seconds: 2));

    // Decodifica el JSON
    Map<String, dynamic> data = json.decode(tribunal);

    return (data['tribunal'] as List<dynamic>)
        .map((e) => Tribunal.fromMap(e))
        .toList();
  }

  Future<Tribunal> getTribunalById(int id) async {
    await Future.delayed(const Duration(seconds: 2));

    // Decodifica el JSON
    Map<String, dynamic> data = json.decode(tribunal);

    return (data['tribunal'] as List<dynamic>)
        .map((e) => Tribunal.fromMap(e))
        .toList()
        .firstWhere((element) => element.id == id);
  }
}

const tribunal = '''
{ "tribunal": [
    {
        "id": 1,
        "numero": 2,
        "cantidadMiembros": 5,
        "presidente": "P. Aux. Ing. Mayleidis Lopez Fernandez",
        "secretario": [
                "P. As. MSc. Olga Yarisbel Rojas Grass" ,
  
                "P. As. MSc. Yordanis Garcia Leiva "
                ],
        "vocal": [
            
                "P. As.  Ing. Reinier Fernández Coello",
  
                "P. Aux. Lic. Dariela Elvira Espinosa Leyva"
          ],
        "oponente": [
           
               "Ing. Aldis Joan Abreu Medina",

               "Ing. Dariel Rodríguez Díaz"

    
        ]
        
      }
  ]



}''';