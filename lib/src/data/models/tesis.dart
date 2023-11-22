// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:flutter/foundation.dart';

class TesisModel {
  final int id;
  final String titulo;
  final String area;
  final int ano;
  final List<String> autores;
  final int tribunalId;

  TesisModel({
    required this.id,
    required this.titulo,
    required this.area,
    required this.ano,
    required this.autores,
    required this.tribunalId,
  });

  TesisModel copyWith({
    int? id,
    String? titulo,
    String? area,
    int? ano,
    List<String>? autores,
    int? tribunalId,
  }) {
    return TesisModel(
      id: id ?? this.id,
      titulo: titulo ?? this.titulo,
      area: area ?? this.area,
      ano: ano ?? this.ano,
      autores: autores ?? this.autores,
      tribunalId: tribunalId ?? this.tribunalId,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'titulo': titulo,
      'area': area,
      'ano': ano,
      'autores': autores,
      'tribunalId': tribunalId,
    };
  }

  factory TesisModel.fromMap(Map<String, dynamic> map) {
    return TesisModel(
      id: map['id'] as int,
      titulo: map['titulo'] as String,
      area: map['area'] as String,
      ano: map['ano'] as int,
      autores: List<String>.from((map['autores'] as List<dynamic>)),
      tribunalId: map['tribunalId'] as int,
    );
  }

  String toJson() => json.encode(toMap());

  factory TesisModel.fromJson(String source) =>
      TesisModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'TesisModel(id: $id, titulo: $titulo, area: $area, ano: $ano, autores: $autores, tribunalId: $tribunalId)';
  }

  @override
  bool operator ==(covariant TesisModel other) {
    if (identical(this, other)) return true;

    return other.id == id &&
        other.titulo == titulo &&
        other.area == area &&
        other.ano == ano &&
        listEquals(other.autores, autores) &&
        other.tribunalId == tribunalId;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        titulo.hashCode ^
        area.hashCode ^
        ano.hashCode ^
        autores.hashCode ^
        tribunalId.hashCode;
  }
}
