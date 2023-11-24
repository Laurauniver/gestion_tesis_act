// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class NoConformidad {
  final int id;
  final String estado;
  final String descripcion;

  NoConformidad({
    required this.id,
    required this.estado,
    required this.descripcion,
  });

  NoConformidad copyWith({
    int? id,
    String? estado,
    String? descripcion,
  }) {
    return NoConformidad(
      id: id ?? this.id,
      estado: estado ?? this.estado,
      descripcion: descripcion ?? this.descripcion,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'estado': estado,
      'descripcion': descripcion,
    };
  }

  factory NoConformidad.fromMap(Map<String, dynamic> map) {
    return NoConformidad(
      id: map['id'] as int,
      estado: map['estado'] as String,
      descripcion: map['descripcion'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory NoConformidad.fromJson(String source) => NoConformidad.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'NoConformidad(id: $id, estado: $estado, descripcion: $descripcion)';

  @override
  bool operator ==(covariant NoConformidad other) {
    if (identical(this, other)) return true;
  
    return 
      other.id == id &&
      other.estado == estado &&
      other.descripcion == descripcion;
  }

  @override
  int get hashCode => id.hashCode ^ estado.hashCode ^ descripcion.hashCode;
}
