import 'dart:convert';

//import 'package:flutter/foundation.dart';

class Prueba {
  final int id;
  final String tipo;
  final String descripcion;
  final String estado;
 

  Prueba({
    required this.id,
    required this.tipo,
    required this.descripcion,
    required this.estado,
  });  

  Prueba copyWith({
    int? id,
    String? tipo,
    String? descripcion,
    String? estado,
  }) {
    return Prueba(
      id: id ?? this.id,
      tipo: tipo ?? this.tipo,
      descripcion: descripcion ?? this.descripcion,
      estado: estado ?? this.estado,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'tipo': tipo,
      'descripcion': descripcion,
      'estado': estado,
    };
  }

  factory Prueba.fromMap(Map<String, dynamic> map) {
    return Prueba(
      id: map['id']?.toInt() ?? 0,
      tipo: map['tipo'] ?? '',
      descripcion: map['descripcion'] ?? '',
      estado: map['estado'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory Prueba.fromJson(String source) => Prueba.fromMap(json.decode(source));

  @override
  String toString() {
    return 'Prueba(id: $id, tipo: $tipo, descripcion: $descripcion, estado: $estado)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
  
    return other is Prueba &&
      other.id == id &&
      other.tipo == tipo &&
      other.descripcion == descripcion &&
      other.estado == estado;
  }

  @override
  int get hashCode {
    return id.hashCode ^
      tipo.hashCode ^
      descripcion.hashCode ^
      estado.hashCode;
  }
}
