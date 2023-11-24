import 'dart:convert';

//import 'package:flutter/foundation.dart';

class Prueba {
  final int id;
  final String tipo;
  final String descripcion;
  final String estado;
  //final List<String> noConfId;
 

  Prueba({
    required this.id,
    required this.tipo,
    required this.descripcion,
    required this.estado,
    //required this.noConfId
  });


  Prueba copyWith({
    int? id,
    String? tipo,
    String? estado,
    String? descripcion,
    //List<String>? noConfId
  }) {
    return Prueba(
      id: id ?? this.id,
      estado: estado ?? this.estado,
      descripcion: descripcion ?? this.descripcion, 
      tipo: tipo ?? this.tipo,
      //noConfId: noConfId?? this.noConfId,

    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'tipo': tipo,
      'estado': estado,
      'descripcion': descripcion,
      
    };
  }

  factory Prueba.fromMap(Map<String, dynamic> map) {
    return Prueba(
      id: map['id'] as int,
      tipo: map['tipo'] as String,
      estado: map['estado'] as String,
      descripcion: map['descripcion'] as String,
      //noConfId: List<String>.from((map['noConfId'] as List<dynamic>)),
    );
  }

  String toJson() => json.encode(toMap());

  factory Prueba.fromJson(String source) => Prueba.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'Prueba(id: $id, tipo: $tipo, estado: $estado, descripcion: $descripcion)';

  @override
  bool operator ==(covariant Prueba other) {
    if (identical(this, other)) return true;
  
    return 
      other.id == id &&
      other.tipo == tipo &&
      other.estado == estado &&
      other.descripcion == descripcion;
      //listEquals(other.noConfId, noConfId);
  }

  @override
  int get hashCode => id.hashCode ^ tipo.hashCode ^ estado.hashCode ^ descripcion.hashCode ;//^ noConfId.hashCode;
}
