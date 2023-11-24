import 'dart:convert';

class TutorModel {
  final int id;
  final String nombre;
  final String apellidos;
  final String categoria;
  final int cantidadTesis;

  TutorModel({
    required this.id,
    required this.nombre,
    required this.apellidos,
    required this.categoria,
    required this.cantidadTesis
  });

  TutorModel copyWith({
    int? id,
    String? nombre,
    String? apellidos,
    String? categoria,
    int? cantidadTesis,
  }) {
    return TutorModel(
      id: id ?? this.id,
      nombre: nombre ?? this.nombre,
      apellidos: apellidos ?? this.apellidos,
      categoria: categoria ?? this.categoria,
      cantidadTesis: cantidadTesis ?? this.cantidadTesis,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'nombre': nombre,
      'apellidos': apellidos,
      'categoria': categoria,
      'cantidadTesis': cantidadTesis, 
    };
  }

  factory TutorModel.fromMap(Map<String, dynamic> map) {
    return TutorModel(
      id: map['id'] as int,
      nombre: map['nombre'] as String,
      apellidos: map['apellidos'] as String,
      categoria: map['categoria'] as String,
      cantidadTesis: map['cantidadTesis'] as int,
    );
  }

  String toJson() => json.encode(toMap());

  factory TutorModel.fromJson(String source) => TutorModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'TutorModel(id: $id, nombre: $nombre, apellidos: $apellidos, categoria: $categoria, cantidadTesis: $cantidadTesis )';

  @override
  bool operator ==(covariant TutorModel other) {
    if (identical(this, other)) return true;
  
    return 
      other.id == id &&
      other.nombre == nombre &&
      other.apellidos == apellidos &&
      other.categoria == categoria &&
      other.cantidadTesis == cantidadTesis;
  }

  @override
  int get hashCode => id.hashCode ^ nombre.hashCode ^ apellidos.hashCode ^ categoria.hashCode ^ cantidadTesis.hashCode;
}
