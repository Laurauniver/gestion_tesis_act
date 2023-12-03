import 'dart:convert';

import 'package:flutter/foundation.dart';

class Tribunal{
  final int id;
  final int numero;
  final int cantidadMiembros;
  final String presidente;
  final List<String> miembros;
  // final List<String> vocal;
  // final List<String> oponente;

  Tribunal({
  required this.id,
  required this.numero,
  required this.cantidadMiembros,
  required this.presidente,
  required this.miembros,
  // required this.vocal,
  // required this.oponente
});

Tribunal copyWith({
    int? id,
    int? numero,
    int? cantidadMiembros,
    String? presidente,
    List<String>? miembros,
    // List<String>? vocal,
    // List<String>? oponente,
  }) {
    return Tribunal(
      id: id ?? this.id,
      numero: numero ?? this.numero,
      cantidadMiembros: cantidadMiembros ?? this.cantidadMiembros,
      presidente: presidente ?? this.presidente,
      miembros: miembros ?? this.miembros,
      // vocal: vocal ?? this.vocal,
      // oponente: oponente ?? this.oponente,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'numero': numero,
      'cantidadMiembros': cantidadMiembros,
      'presidente': presidente,
      'miembros': miembros,
      // 'vocal': vocal,
      // 'oponente': oponente,
    };
  }

  factory Tribunal.fromMap(Map<String, dynamic> map) {
    return Tribunal(
      id: map['id'] as int,
      numero: map['numero'] as int,
      cantidadMiembros: map['cantidadMiembros'] as int,
      presidente: map['presidente'] as String,
      miembros: List<String>.from((map['miembros'] as List<dynamic>)),
      // vocal: List<String>.from((map['vocal'] as List<dynamic>)),
      // oponente: List<String>.from((map['oponente'] as List<dynamic>)),
    );
  }

  String toJson() => json.encode(toMap());

  factory Tribunal.fromJson(String source) => Tribunal.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'Tribunal(id: $id, numero: $numero, cantidadMiembros: $cantidadMiembros, presidente: $presidente, miembros: $miembros)';
  //, vocal: $vocal, oponente: $oponente)';

  @override
  bool operator ==(covariant Tribunal other) {
    if (identical(this, other)) return true;
  
    return 
      other.id == id &&
      other.numero == numero &&
      other.cantidadMiembros == cantidadMiembros &&
      other.presidente == presidente &&
      listEquals(other.miembros, miembros);
      // listEquals(other.vocal, vocal) &&
      // listEquals(other.oponente, oponente);
   
  }

  @override
  int get hashCode => id.hashCode ^ numero.hashCode ^ cantidadMiembros.hashCode ^ presidente.hashCode ^ miembros.hashCode;
  //^ vocal.hashCode ^ oponente.hashCode;
}

