// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:gestion_tesis/src/data/models/tesis.dart';
import 'package:gestion_tesis/src/data/models/tutor_model.dart';

class TutorTesisEntity {
  final TutorModel tutor;
  final List<TesisModel> tesis;

  TutorTesisEntity({
    required this.tutor,
    required this.tesis,
  });

  String toJson() => json.encode(this);

  @override
  String toString() => 'TutorTesisEntity(tutor: $tutor, tesis: $tesis)';

  TutorTesisEntity copyWith({
    TutorModel? tutor,
    List<TesisModel>? tesis,
  }) {
    return TutorTesisEntity(
      tutor: tutor ?? this.tutor,
      tesis: tesis ?? this.tesis,
    );
  }

  @override
  bool operator ==(covariant TutorTesisEntity other) {
    if (identical(this, other)) return true;

    return other.tutor == tutor && listEquals(other.tesis, tesis);
  }

  @override
  int get hashCode => tutor.hashCode ^ tesis.hashCode;
}
