// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'database.dart';

// ignore_for_file: type=lint
class $TesisEntityTable extends TesisEntity
    with TableInfo<$TesisEntityTable, TesisTableEntity> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $TesisEntityTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _tutorIdMeta =
      const VerificationMeta('tutorId');
  @override
  late final GeneratedColumn<int> tutorId = GeneratedColumn<int>(
      'tutor_id', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _autorMeta = const VerificationMeta('autor');
  @override
  late final GeneratedColumn<String> autor = GeneratedColumn<String>(
      'autor', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _tituloMeta = const VerificationMeta('titulo');
  @override
  late final GeneratedColumn<String> titulo = GeneratedColumn<String>(
      'titulo', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _anoMeta = const VerificationMeta('ano');
  @override
  late final GeneratedColumn<int> ano = GeneratedColumn<int>(
      'ano', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _areaMeta = const VerificationMeta('area');
  @override
  late final GeneratedColumn<String> area = GeneratedColumn<String>(
      'area', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns => [id, tutorId, autor, titulo, ano, area];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'tesis_entity';
  @override
  VerificationContext validateIntegrity(Insertable<TesisTableEntity> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('tutor_id')) {
      context.handle(_tutorIdMeta,
          tutorId.isAcceptableOrUnknown(data['tutor_id']!, _tutorIdMeta));
    } else if (isInserting) {
      context.missing(_tutorIdMeta);
    }
    if (data.containsKey('autor')) {
      context.handle(
          _autorMeta, autor.isAcceptableOrUnknown(data['autor']!, _autorMeta));
    } else if (isInserting) {
      context.missing(_autorMeta);
    }
    if (data.containsKey('titulo')) {
      context.handle(_tituloMeta,
          titulo.isAcceptableOrUnknown(data['titulo']!, _tituloMeta));
    } else if (isInserting) {
      context.missing(_tituloMeta);
    }
    if (data.containsKey('ano')) {
      context.handle(
          _anoMeta, ano.isAcceptableOrUnknown(data['ano']!, _anoMeta));
    } else if (isInserting) {
      context.missing(_anoMeta);
    }
    if (data.containsKey('area')) {
      context.handle(
          _areaMeta, area.isAcceptableOrUnknown(data['area']!, _areaMeta));
    } else if (isInserting) {
      context.missing(_areaMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  TesisTableEntity map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return TesisTableEntity(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      tutorId: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}tutor_id'])!,
      autor: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}autor'])!,
      titulo: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}titulo'])!,
      ano: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}ano'])!,
      area: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}area'])!,
    );
  }

  @override
  $TesisEntityTable createAlias(String alias) {
    return $TesisEntityTable(attachedDatabase, alias);
  }
}

class TesisTableEntity extends DataClass
    implements Insertable<TesisTableEntity> {
  final int id;
  final int tutorId;
  final String autor;
  final String titulo;
  final int ano;
  final String area;
  const TesisTableEntity(
      {required this.id,
      required this.tutorId,
      required this.autor,
      required this.titulo,
      required this.ano,
      required this.area});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['tutor_id'] = Variable<int>(tutorId);
    map['autor'] = Variable<String>(autor);
    map['titulo'] = Variable<String>(titulo);
    map['ano'] = Variable<int>(ano);
    map['area'] = Variable<String>(area);
    return map;
  }

  TesisEntityCompanion toCompanion(bool nullToAbsent) {
    return TesisEntityCompanion(
      id: Value(id),
      tutorId: Value(tutorId),
      autor: Value(autor),
      titulo: Value(titulo),
      ano: Value(ano),
      area: Value(area),
    );
  }

  factory TesisTableEntity.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return TesisTableEntity(
      id: serializer.fromJson<int>(json['id']),
      tutorId: serializer.fromJson<int>(json['tutorId']),
      autor: serializer.fromJson<String>(json['autor']),
      titulo: serializer.fromJson<String>(json['titulo']),
      ano: serializer.fromJson<int>(json['ano']),
      area: serializer.fromJson<String>(json['area']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'tutorId': serializer.toJson<int>(tutorId),
      'autor': serializer.toJson<String>(autor),
      'titulo': serializer.toJson<String>(titulo),
      'ano': serializer.toJson<int>(ano),
      'area': serializer.toJson<String>(area),
    };
  }

  TesisTableEntity copyWith(
          {int? id,
          int? tutorId,
          String? autor,
          String? titulo,
          int? ano,
          String? area}) =>
      TesisTableEntity(
        id: id ?? this.id,
        tutorId: tutorId ?? this.tutorId,
        autor: autor ?? this.autor,
        titulo: titulo ?? this.titulo,
        ano: ano ?? this.ano,
        area: area ?? this.area,
      );
  @override
  String toString() {
    return (StringBuffer('TesisTableEntity(')
          ..write('id: $id, ')
          ..write('tutorId: $tutorId, ')
          ..write('autor: $autor, ')
          ..write('titulo: $titulo, ')
          ..write('ano: $ano, ')
          ..write('area: $area')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, tutorId, autor, titulo, ano, area);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is TesisTableEntity &&
          other.id == this.id &&
          other.tutorId == this.tutorId &&
          other.autor == this.autor &&
          other.titulo == this.titulo &&
          other.ano == this.ano &&
          other.area == this.area);
}

class TesisEntityCompanion extends UpdateCompanion<TesisTableEntity> {
  final Value<int> id;
  final Value<int> tutorId;
  final Value<String> autor;
  final Value<String> titulo;
  final Value<int> ano;
  final Value<String> area;
  const TesisEntityCompanion({
    this.id = const Value.absent(),
    this.tutorId = const Value.absent(),
    this.autor = const Value.absent(),
    this.titulo = const Value.absent(),
    this.ano = const Value.absent(),
    this.area = const Value.absent(),
  });
  TesisEntityCompanion.insert({
    this.id = const Value.absent(),
    required int tutorId,
    required String autor,
    required String titulo,
    required int ano,
    required String area,
  })  : tutorId = Value(tutorId),
        autor = Value(autor),
        titulo = Value(titulo),
        ano = Value(ano),
        area = Value(area);
  static Insertable<TesisTableEntity> custom({
    Expression<int>? id,
    Expression<int>? tutorId,
    Expression<String>? autor,
    Expression<String>? titulo,
    Expression<int>? ano,
    Expression<String>? area,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (tutorId != null) 'tutor_id': tutorId,
      if (autor != null) 'autor': autor,
      if (titulo != null) 'titulo': titulo,
      if (ano != null) 'ano': ano,
      if (area != null) 'area': area,
    });
  }

  TesisEntityCompanion copyWith(
      {Value<int>? id,
      Value<int>? tutorId,
      Value<String>? autor,
      Value<String>? titulo,
      Value<int>? ano,
      Value<String>? area}) {
    return TesisEntityCompanion(
      id: id ?? this.id,
      tutorId: tutorId ?? this.tutorId,
      autor: autor ?? this.autor,
      titulo: titulo ?? this.titulo,
      ano: ano ?? this.ano,
      area: area ?? this.area,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (tutorId.present) {
      map['tutor_id'] = Variable<int>(tutorId.value);
    }
    if (autor.present) {
      map['autor'] = Variable<String>(autor.value);
    }
    if (titulo.present) {
      map['titulo'] = Variable<String>(titulo.value);
    }
    if (ano.present) {
      map['ano'] = Variable<int>(ano.value);
    }
    if (area.present) {
      map['area'] = Variable<String>(area.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('TesisEntityCompanion(')
          ..write('id: $id, ')
          ..write('tutorId: $tutorId, ')
          ..write('autor: $autor, ')
          ..write('titulo: $titulo, ')
          ..write('ano: $ano, ')
          ..write('area: $area')
          ..write(')'))
        .toString();
  }
}

class $TribunalEntityTable extends TribunalEntity
    with TableInfo<$TribunalEntityTable, TribunalTableEntity> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $TribunalEntityTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _numeroMeta = const VerificationMeta('numero');
  @override
  late final GeneratedColumn<int> numero = GeneratedColumn<int>(
      'numero', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _presidenteMeta =
      const VerificationMeta('presidente');
  @override
  late final GeneratedColumn<String> presidente = GeneratedColumn<String>(
      'presidente', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _secretarioMeta =
      const VerificationMeta('secretario');
  @override
  late final GeneratedColumn<String> secretario = GeneratedColumn<String>(
      'secretario', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _vocalMeta = const VerificationMeta('vocal');
  @override
  late final GeneratedColumn<String> vocal = GeneratedColumn<String>(
      'vocal', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _miembroMeta =
      const VerificationMeta('miembro');
  @override
  late final GeneratedColumn<String> miembro = GeneratedColumn<String>(
      'miembro', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns =>
      [id, numero, presidente, secretario, vocal, miembro];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'tribunal_entity';
  @override
  VerificationContext validateIntegrity(
      Insertable<TribunalTableEntity> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('numero')) {
      context.handle(_numeroMeta,
          numero.isAcceptableOrUnknown(data['numero']!, _numeroMeta));
    } else if (isInserting) {
      context.missing(_numeroMeta);
    }
    if (data.containsKey('presidente')) {
      context.handle(
          _presidenteMeta,
          presidente.isAcceptableOrUnknown(
              data['presidente']!, _presidenteMeta));
    } else if (isInserting) {
      context.missing(_presidenteMeta);
    }
    if (data.containsKey('secretario')) {
      context.handle(
          _secretarioMeta,
          secretario.isAcceptableOrUnknown(
              data['secretario']!, _secretarioMeta));
    } else if (isInserting) {
      context.missing(_secretarioMeta);
    }
    if (data.containsKey('vocal')) {
      context.handle(
          _vocalMeta, vocal.isAcceptableOrUnknown(data['vocal']!, _vocalMeta));
    } else if (isInserting) {
      context.missing(_vocalMeta);
    }
    if (data.containsKey('miembro')) {
      context.handle(_miembroMeta,
          miembro.isAcceptableOrUnknown(data['miembro']!, _miembroMeta));
    } else if (isInserting) {
      context.missing(_miembroMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  TribunalTableEntity map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return TribunalTableEntity(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      numero: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}numero'])!,
      presidente: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}presidente'])!,
      secretario: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}secretario'])!,
      vocal: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}vocal'])!,
      miembro: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}miembro'])!,
    );
  }

  @override
  $TribunalEntityTable createAlias(String alias) {
    return $TribunalEntityTable(attachedDatabase, alias);
  }
}

class TribunalTableEntity extends DataClass
    implements Insertable<TribunalTableEntity> {
  final int id;
  final int numero;
  final String presidente;
  final String secretario;
  final String vocal;
  final String miembro;
  const TribunalTableEntity(
      {required this.id,
      required this.numero,
      required this.presidente,
      required this.secretario,
      required this.vocal,
      required this.miembro});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['numero'] = Variable<int>(numero);
    map['presidente'] = Variable<String>(presidente);
    map['secretario'] = Variable<String>(secretario);
    map['vocal'] = Variable<String>(vocal);
    map['miembro'] = Variable<String>(miembro);
    return map;
  }

  TribunalEntityCompanion toCompanion(bool nullToAbsent) {
    return TribunalEntityCompanion(
      id: Value(id),
      numero: Value(numero),
      presidente: Value(presidente),
      secretario: Value(secretario),
      vocal: Value(vocal),
      miembro: Value(miembro),
    );
  }

  factory TribunalTableEntity.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return TribunalTableEntity(
      id: serializer.fromJson<int>(json['id']),
      numero: serializer.fromJson<int>(json['numero']),
      presidente: serializer.fromJson<String>(json['presidente']),
      secretario: serializer.fromJson<String>(json['secretario']),
      vocal: serializer.fromJson<String>(json['vocal']),
      miembro: serializer.fromJson<String>(json['miembro']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'numero': serializer.toJson<int>(numero),
      'presidente': serializer.toJson<String>(presidente),
      'secretario': serializer.toJson<String>(secretario),
      'vocal': serializer.toJson<String>(vocal),
      'miembro': serializer.toJson<String>(miembro),
    };
  }

  TribunalTableEntity copyWith(
          {int? id,
          int? numero,
          String? presidente,
          String? secretario,
          String? vocal,
          String? miembro}) =>
      TribunalTableEntity(
        id: id ?? this.id,
        numero: numero ?? this.numero,
        presidente: presidente ?? this.presidente,
        secretario: secretario ?? this.secretario,
        vocal: vocal ?? this.vocal,
        miembro: miembro ?? this.miembro,
      );
  @override
  String toString() {
    return (StringBuffer('TribunalTableEntity(')
          ..write('id: $id, ')
          ..write('numero: $numero, ')
          ..write('presidente: $presidente, ')
          ..write('secretario: $secretario, ')
          ..write('vocal: $vocal, ')
          ..write('miembro: $miembro')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode =>
      Object.hash(id, numero, presidente, secretario, vocal, miembro);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is TribunalTableEntity &&
          other.id == this.id &&
          other.numero == this.numero &&
          other.presidente == this.presidente &&
          other.secretario == this.secretario &&
          other.vocal == this.vocal &&
          other.miembro == this.miembro);
}

class TribunalEntityCompanion extends UpdateCompanion<TribunalTableEntity> {
  final Value<int> id;
  final Value<int> numero;
  final Value<String> presidente;
  final Value<String> secretario;
  final Value<String> vocal;
  final Value<String> miembro;
  const TribunalEntityCompanion({
    this.id = const Value.absent(),
    this.numero = const Value.absent(),
    this.presidente = const Value.absent(),
    this.secretario = const Value.absent(),
    this.vocal = const Value.absent(),
    this.miembro = const Value.absent(),
  });
  TribunalEntityCompanion.insert({
    this.id = const Value.absent(),
    required int numero,
    required String presidente,
    required String secretario,
    required String vocal,
    required String miembro,
  })  : numero = Value(numero),
        presidente = Value(presidente),
        secretario = Value(secretario),
        vocal = Value(vocal),
        miembro = Value(miembro);
  static Insertable<TribunalTableEntity> custom({
    Expression<int>? id,
    Expression<int>? numero,
    Expression<String>? presidente,
    Expression<String>? secretario,
    Expression<String>? vocal,
    Expression<String>? miembro,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (numero != null) 'numero': numero,
      if (presidente != null) 'presidente': presidente,
      if (secretario != null) 'secretario': secretario,
      if (vocal != null) 'vocal': vocal,
      if (miembro != null) 'miembro': miembro,
    });
  }

  TribunalEntityCompanion copyWith(
      {Value<int>? id,
      Value<int>? numero,
      Value<String>? presidente,
      Value<String>? secretario,
      Value<String>? vocal,
      Value<String>? miembro}) {
    return TribunalEntityCompanion(
      id: id ?? this.id,
      numero: numero ?? this.numero,
      presidente: presidente ?? this.presidente,
      secretario: secretario ?? this.secretario,
      vocal: vocal ?? this.vocal,
      miembro: miembro ?? this.miembro,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (numero.present) {
      map['numero'] = Variable<int>(numero.value);
    }
    if (presidente.present) {
      map['presidente'] = Variable<String>(presidente.value);
    }
    if (secretario.present) {
      map['secretario'] = Variable<String>(secretario.value);
    }
    if (vocal.present) {
      map['vocal'] = Variable<String>(vocal.value);
    }
    if (miembro.present) {
      map['miembro'] = Variable<String>(miembro.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('TribunalEntityCompanion(')
          ..write('id: $id, ')
          ..write('numero: $numero, ')
          ..write('presidente: $presidente, ')
          ..write('secretario: $secretario, ')
          ..write('vocal: $vocal, ')
          ..write('miembro: $miembro')
          ..write(')'))
        .toString();
  }
}

class $NoConformidadEntityTable extends NoConformidadEntity
    with TableInfo<$NoConformidadEntityTable, NoConformidadTableEntity> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $NoConformidadEntityTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _descripcionMeta =
      const VerificationMeta('descripcion');
  @override
  late final GeneratedColumn<String> descripcion = GeneratedColumn<String>(
      'descripcion', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns => [id, descripcion];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'no_conformidad_entity';
  @override
  VerificationContext validateIntegrity(
      Insertable<NoConformidadTableEntity> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('descripcion')) {
      context.handle(
          _descripcionMeta,
          descripcion.isAcceptableOrUnknown(
              data['descripcion']!, _descripcionMeta));
    } else if (isInserting) {
      context.missing(_descripcionMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  NoConformidadTableEntity map(Map<String, dynamic> data,
      {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return NoConformidadTableEntity(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      descripcion: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}descripcion'])!,
    );
  }

  @override
  $NoConformidadEntityTable createAlias(String alias) {
    return $NoConformidadEntityTable(attachedDatabase, alias);
  }
}

class NoConformidadTableEntity extends DataClass
    implements Insertable<NoConformidadTableEntity> {
  final int id;
  final String descripcion;
  const NoConformidadTableEntity({required this.id, required this.descripcion});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['descripcion'] = Variable<String>(descripcion);
    return map;
  }

  NoConformidadEntityCompanion toCompanion(bool nullToAbsent) {
    return NoConformidadEntityCompanion(
      id: Value(id),
      descripcion: Value(descripcion),
    );
  }

  factory NoConformidadTableEntity.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return NoConformidadTableEntity(
      id: serializer.fromJson<int>(json['id']),
      descripcion: serializer.fromJson<String>(json['descripcion']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'descripcion': serializer.toJson<String>(descripcion),
    };
  }

  NoConformidadTableEntity copyWith({int? id, String? descripcion}) =>
      NoConformidadTableEntity(
        id: id ?? this.id,
        descripcion: descripcion ?? this.descripcion,
      );
  @override
  String toString() {
    return (StringBuffer('NoConformidadTableEntity(')
          ..write('id: $id, ')
          ..write('descripcion: $descripcion')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, descripcion);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is NoConformidadTableEntity &&
          other.id == this.id &&
          other.descripcion == this.descripcion);
}

class NoConformidadEntityCompanion
    extends UpdateCompanion<NoConformidadTableEntity> {
  final Value<int> id;
  final Value<String> descripcion;
  const NoConformidadEntityCompanion({
    this.id = const Value.absent(),
    this.descripcion = const Value.absent(),
  });
  NoConformidadEntityCompanion.insert({
    this.id = const Value.absent(),
    required String descripcion,
  }) : descripcion = Value(descripcion);
  static Insertable<NoConformidadTableEntity> custom({
    Expression<int>? id,
    Expression<String>? descripcion,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (descripcion != null) 'descripcion': descripcion,
    });
  }

  NoConformidadEntityCompanion copyWith(
      {Value<int>? id, Value<String>? descripcion}) {
    return NoConformidadEntityCompanion(
      id: id ?? this.id,
      descripcion: descripcion ?? this.descripcion,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (descripcion.present) {
      map['descripcion'] = Variable<String>(descripcion.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('NoConformidadEntityCompanion(')
          ..write('id: $id, ')
          ..write('descripcion: $descripcion')
          ..write(')'))
        .toString();
  }
}

class $PruebaEntityTable extends PruebaEntity
    with TableInfo<$PruebaEntityTable, PruebaTableEntity> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $PruebaEntityTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _tipoMeta = const VerificationMeta('tipo');
  @override
  late final GeneratedColumn<String> tipo = GeneratedColumn<String>(
      'tipo', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _descripcionMeta =
      const VerificationMeta('descripcion');
  @override
  late final GeneratedColumn<String> descripcion = GeneratedColumn<String>(
      'descripcion', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns => [id, tipo, descripcion];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'prueba_entity';
  @override
  VerificationContext validateIntegrity(Insertable<PruebaTableEntity> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('tipo')) {
      context.handle(
          _tipoMeta, tipo.isAcceptableOrUnknown(data['tipo']!, _tipoMeta));
    } else if (isInserting) {
      context.missing(_tipoMeta);
    }
    if (data.containsKey('descripcion')) {
      context.handle(
          _descripcionMeta,
          descripcion.isAcceptableOrUnknown(
              data['descripcion']!, _descripcionMeta));
    } else if (isInserting) {
      context.missing(_descripcionMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  PruebaTableEntity map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return PruebaTableEntity(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      tipo: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}tipo'])!,
      descripcion: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}descripcion'])!,
    );
  }

  @override
  $PruebaEntityTable createAlias(String alias) {
    return $PruebaEntityTable(attachedDatabase, alias);
  }
}

class PruebaTableEntity extends DataClass
    implements Insertable<PruebaTableEntity> {
  final int id;
  final String tipo;
  final String descripcion;
  const PruebaTableEntity(
      {required this.id, required this.tipo, required this.descripcion});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['tipo'] = Variable<String>(tipo);
    map['descripcion'] = Variable<String>(descripcion);
    return map;
  }

  PruebaEntityCompanion toCompanion(bool nullToAbsent) {
    return PruebaEntityCompanion(
      id: Value(id),
      tipo: Value(tipo),
      descripcion: Value(descripcion),
    );
  }

  factory PruebaTableEntity.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return PruebaTableEntity(
      id: serializer.fromJson<int>(json['id']),
      tipo: serializer.fromJson<String>(json['tipo']),
      descripcion: serializer.fromJson<String>(json['descripcion']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'tipo': serializer.toJson<String>(tipo),
      'descripcion': serializer.toJson<String>(descripcion),
    };
  }

  PruebaTableEntity copyWith({int? id, String? tipo, String? descripcion}) =>
      PruebaTableEntity(
        id: id ?? this.id,
        tipo: tipo ?? this.tipo,
        descripcion: descripcion ?? this.descripcion,
      );
  @override
  String toString() {
    return (StringBuffer('PruebaTableEntity(')
          ..write('id: $id, ')
          ..write('tipo: $tipo, ')
          ..write('descripcion: $descripcion')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, tipo, descripcion);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is PruebaTableEntity &&
          other.id == this.id &&
          other.tipo == this.tipo &&
          other.descripcion == this.descripcion);
}

class PruebaEntityCompanion extends UpdateCompanion<PruebaTableEntity> {
  final Value<int> id;
  final Value<String> tipo;
  final Value<String> descripcion;
  const PruebaEntityCompanion({
    this.id = const Value.absent(),
    this.tipo = const Value.absent(),
    this.descripcion = const Value.absent(),
  });
  PruebaEntityCompanion.insert({
    this.id = const Value.absent(),
    required String tipo,
    required String descripcion,
  })  : tipo = Value(tipo),
        descripcion = Value(descripcion);
  static Insertable<PruebaTableEntity> custom({
    Expression<int>? id,
    Expression<String>? tipo,
    Expression<String>? descripcion,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (tipo != null) 'tipo': tipo,
      if (descripcion != null) 'descripcion': descripcion,
    });
  }

  PruebaEntityCompanion copyWith(
      {Value<int>? id, Value<String>? tipo, Value<String>? descripcion}) {
    return PruebaEntityCompanion(
      id: id ?? this.id,
      tipo: tipo ?? this.tipo,
      descripcion: descripcion ?? this.descripcion,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (tipo.present) {
      map['tipo'] = Variable<String>(tipo.value);
    }
    if (descripcion.present) {
      map['descripcion'] = Variable<String>(descripcion.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('PruebaEntityCompanion(')
          ..write('id: $id, ')
          ..write('tipo: $tipo, ')
          ..write('descripcion: $descripcion')
          ..write(')'))
        .toString();
  }
}

class $ReportEntityTable extends ReportEntity
    with TableInfo<$ReportEntityTable, ReportTableEntity> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $ReportEntityTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _tutoresMeta =
      const VerificationMeta('tutores');
  @override
  late final GeneratedColumn<String> tutores = GeneratedColumn<String>(
      'tutores', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns => [id, tutores];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'report_entity';
  @override
  VerificationContext validateIntegrity(Insertable<ReportTableEntity> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('tutores')) {
      context.handle(_tutoresMeta,
          tutores.isAcceptableOrUnknown(data['tutores']!, _tutoresMeta));
    } else if (isInserting) {
      context.missing(_tutoresMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  ReportTableEntity map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return ReportTableEntity(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      tutores: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}tutores'])!,
    );
  }

  @override
  $ReportEntityTable createAlias(String alias) {
    return $ReportEntityTable(attachedDatabase, alias);
  }
}

class ReportTableEntity extends DataClass
    implements Insertable<ReportTableEntity> {
  final int id;
  final String tutores;
  const ReportTableEntity({required this.id, required this.tutores});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['tutores'] = Variable<String>(tutores);
    return map;
  }

  ReportEntityCompanion toCompanion(bool nullToAbsent) {
    return ReportEntityCompanion(
      id: Value(id),
      tutores: Value(tutores),
    );
  }

  factory ReportTableEntity.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return ReportTableEntity(
      id: serializer.fromJson<int>(json['id']),
      tutores: serializer.fromJson<String>(json['tutores']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'tutores': serializer.toJson<String>(tutores),
    };
  }

  ReportTableEntity copyWith({int? id, String? tutores}) => ReportTableEntity(
        id: id ?? this.id,
        tutores: tutores ?? this.tutores,
      );
  @override
  String toString() {
    return (StringBuffer('ReportTableEntity(')
          ..write('id: $id, ')
          ..write('tutores: $tutores')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, tutores);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is ReportTableEntity &&
          other.id == this.id &&
          other.tutores == this.tutores);
}

class ReportEntityCompanion extends UpdateCompanion<ReportTableEntity> {
  final Value<int> id;
  final Value<String> tutores;
  const ReportEntityCompanion({
    this.id = const Value.absent(),
    this.tutores = const Value.absent(),
  });
  ReportEntityCompanion.insert({
    this.id = const Value.absent(),
    required String tutores,
  }) : tutores = Value(tutores);
  static Insertable<ReportTableEntity> custom({
    Expression<int>? id,
    Expression<String>? tutores,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (tutores != null) 'tutores': tutores,
    });
  }

  ReportEntityCompanion copyWith({Value<int>? id, Value<String>? tutores}) {
    return ReportEntityCompanion(
      id: id ?? this.id,
      tutores: tutores ?? this.tutores,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (tutores.present) {
      map['tutores'] = Variable<String>(tutores.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('ReportEntityCompanion(')
          ..write('id: $id, ')
          ..write('tutores: $tutores')
          ..write(')'))
        .toString();
  }
}

class $TutorEntityTable extends TutorEntity
    with TableInfo<$TutorEntityTable, TutorTableEntity> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $TutorEntityTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _nombreMeta = const VerificationMeta('nombre');
  @override
  late final GeneratedColumn<String> nombre = GeneratedColumn<String>(
      'nombre', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _apellidosMeta =
      const VerificationMeta('apellidos');
  @override
  late final GeneratedColumn<String> apellidos = GeneratedColumn<String>(
      'apellidos', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns => [id, nombre, apellidos];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'tutor_entity';
  @override
  VerificationContext validateIntegrity(Insertable<TutorTableEntity> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('nombre')) {
      context.handle(_nombreMeta,
          nombre.isAcceptableOrUnknown(data['nombre']!, _nombreMeta));
    } else if (isInserting) {
      context.missing(_nombreMeta);
    }
    if (data.containsKey('apellidos')) {
      context.handle(_apellidosMeta,
          apellidos.isAcceptableOrUnknown(data['apellidos']!, _apellidosMeta));
    } else if (isInserting) {
      context.missing(_apellidosMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  TutorTableEntity map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return TutorTableEntity(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      nombre: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}nombre'])!,
      apellidos: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}apellidos'])!,
    );
  }

  @override
  $TutorEntityTable createAlias(String alias) {
    return $TutorEntityTable(attachedDatabase, alias);
  }
}

class TutorTableEntity extends DataClass
    implements Insertable<TutorTableEntity> {
  final int id;
  final String nombre;
  final String apellidos;
  const TutorTableEntity(
      {required this.id, required this.nombre, required this.apellidos});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['nombre'] = Variable<String>(nombre);
    map['apellidos'] = Variable<String>(apellidos);
    return map;
  }

  TutorEntityCompanion toCompanion(bool nullToAbsent) {
    return TutorEntityCompanion(
      id: Value(id),
      nombre: Value(nombre),
      apellidos: Value(apellidos),
    );
  }

  factory TutorTableEntity.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return TutorTableEntity(
      id: serializer.fromJson<int>(json['id']),
      nombre: serializer.fromJson<String>(json['nombre']),
      apellidos: serializer.fromJson<String>(json['apellidos']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'nombre': serializer.toJson<String>(nombre),
      'apellidos': serializer.toJson<String>(apellidos),
    };
  }

  TutorTableEntity copyWith({int? id, String? nombre, String? apellidos}) =>
      TutorTableEntity(
        id: id ?? this.id,
        nombre: nombre ?? this.nombre,
        apellidos: apellidos ?? this.apellidos,
      );
  @override
  String toString() {
    return (StringBuffer('TutorTableEntity(')
          ..write('id: $id, ')
          ..write('nombre: $nombre, ')
          ..write('apellidos: $apellidos')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, nombre, apellidos);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is TutorTableEntity &&
          other.id == this.id &&
          other.nombre == this.nombre &&
          other.apellidos == this.apellidos);
}

class TutorEntityCompanion extends UpdateCompanion<TutorTableEntity> {
  final Value<int> id;
  final Value<String> nombre;
  final Value<String> apellidos;
  const TutorEntityCompanion({
    this.id = const Value.absent(),
    this.nombre = const Value.absent(),
    this.apellidos = const Value.absent(),
  });
  TutorEntityCompanion.insert({
    this.id = const Value.absent(),
    required String nombre,
    required String apellidos,
  })  : nombre = Value(nombre),
        apellidos = Value(apellidos);
  static Insertable<TutorTableEntity> custom({
    Expression<int>? id,
    Expression<String>? nombre,
    Expression<String>? apellidos,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (nombre != null) 'nombre': nombre,
      if (apellidos != null) 'apellidos': apellidos,
    });
  }

  TutorEntityCompanion copyWith(
      {Value<int>? id, Value<String>? nombre, Value<String>? apellidos}) {
    return TutorEntityCompanion(
      id: id ?? this.id,
      nombre: nombre ?? this.nombre,
      apellidos: apellidos ?? this.apellidos,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (nombre.present) {
      map['nombre'] = Variable<String>(nombre.value);
    }
    if (apellidos.present) {
      map['apellidos'] = Variable<String>(apellidos.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('TutorEntityCompanion(')
          ..write('id: $id, ')
          ..write('nombre: $nombre, ')
          ..write('apellidos: $apellidos')
          ..write(')'))
        .toString();
  }
}

class $UserEntityTable extends UserEntity
    with TableInfo<$UserEntityTable, UserTableEntity> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $UserEntityTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _usernameMeta =
      const VerificationMeta('username');
  @override
  late final GeneratedColumn<String> username = GeneratedColumn<String>(
      'username', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _passwordMeta =
      const VerificationMeta('password');
  @override
  late final GeneratedColumn<String> password = GeneratedColumn<String>(
      'password', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _emailMeta = const VerificationMeta('email');
  @override
  late final GeneratedColumn<String> email = GeneratedColumn<String>(
      'email', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns => [id, username, password, email];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'user_entity';
  @override
  VerificationContext validateIntegrity(Insertable<UserTableEntity> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('username')) {
      context.handle(_usernameMeta,
          username.isAcceptableOrUnknown(data['username']!, _usernameMeta));
    } else if (isInserting) {
      context.missing(_usernameMeta);
    }
    if (data.containsKey('password')) {
      context.handle(_passwordMeta,
          password.isAcceptableOrUnknown(data['password']!, _passwordMeta));
    } else if (isInserting) {
      context.missing(_passwordMeta);
    }
    if (data.containsKey('email')) {
      context.handle(
          _emailMeta, email.isAcceptableOrUnknown(data['email']!, _emailMeta));
    } else if (isInserting) {
      context.missing(_emailMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  UserTableEntity map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return UserTableEntity(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      username: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}username'])!,
      password: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}password'])!,
      email: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}email'])!,
    );
  }

  @override
  $UserEntityTable createAlias(String alias) {
    return $UserEntityTable(attachedDatabase, alias);
  }
}

class UserTableEntity extends DataClass implements Insertable<UserTableEntity> {
  final int id;
  final String username;
  final String password;
  final String email;
  const UserTableEntity(
      {required this.id,
      required this.username,
      required this.password,
      required this.email});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['username'] = Variable<String>(username);
    map['password'] = Variable<String>(password);
    map['email'] = Variable<String>(email);
    return map;
  }

  UserEntityCompanion toCompanion(bool nullToAbsent) {
    return UserEntityCompanion(
      id: Value(id),
      username: Value(username),
      password: Value(password),
      email: Value(email),
    );
  }

  factory UserTableEntity.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return UserTableEntity(
      id: serializer.fromJson<int>(json['id']),
      username: serializer.fromJson<String>(json['username']),
      password: serializer.fromJson<String>(json['password']),
      email: serializer.fromJson<String>(json['email']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'username': serializer.toJson<String>(username),
      'password': serializer.toJson<String>(password),
      'email': serializer.toJson<String>(email),
    };
  }

  UserTableEntity copyWith(
          {int? id, String? username, String? password, String? email}) =>
      UserTableEntity(
        id: id ?? this.id,
        username: username ?? this.username,
        password: password ?? this.password,
        email: email ?? this.email,
      );
  @override
  String toString() {
    return (StringBuffer('UserTableEntity(')
          ..write('id: $id, ')
          ..write('username: $username, ')
          ..write('password: $password, ')
          ..write('email: $email')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, username, password, email);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is UserTableEntity &&
          other.id == this.id &&
          other.username == this.username &&
          other.password == this.password &&
          other.email == this.email);
}

class UserEntityCompanion extends UpdateCompanion<UserTableEntity> {
  final Value<int> id;
  final Value<String> username;
  final Value<String> password;
  final Value<String> email;
  const UserEntityCompanion({
    this.id = const Value.absent(),
    this.username = const Value.absent(),
    this.password = const Value.absent(),
    this.email = const Value.absent(),
  });
  UserEntityCompanion.insert({
    this.id = const Value.absent(),
    required String username,
    required String password,
    required String email,
  })  : username = Value(username),
        password = Value(password),
        email = Value(email);
  static Insertable<UserTableEntity> custom({
    Expression<int>? id,
    Expression<String>? username,
    Expression<String>? password,
    Expression<String>? email,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (username != null) 'username': username,
      if (password != null) 'password': password,
      if (email != null) 'email': email,
    });
  }

  UserEntityCompanion copyWith(
      {Value<int>? id,
      Value<String>? username,
      Value<String>? password,
      Value<String>? email}) {
    return UserEntityCompanion(
      id: id ?? this.id,
      username: username ?? this.username,
      password: password ?? this.password,
      email: email ?? this.email,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (username.present) {
      map['username'] = Variable<String>(username.value);
    }
    if (password.present) {
      map['password'] = Variable<String>(password.value);
    }
    if (email.present) {
      map['email'] = Variable<String>(email.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('UserEntityCompanion(')
          ..write('id: $id, ')
          ..write('username: $username, ')
          ..write('password: $password, ')
          ..write('email: $email')
          ..write(')'))
        .toString();
  }
}

abstract class _$AppDatabase extends GeneratedDatabase {
  _$AppDatabase(QueryExecutor e) : super(e);
  late final $TesisEntityTable tesisEntity = $TesisEntityTable(this);
  late final $TribunalEntityTable tribunalEntity = $TribunalEntityTable(this);
  late final $NoConformidadEntityTable noConformidadEntity =
      $NoConformidadEntityTable(this);
  late final $PruebaEntityTable pruebaEntity = $PruebaEntityTable(this);
  late final $ReportEntityTable reportEntity = $ReportEntityTable(this);
  late final $TutorEntityTable tutorEntity = $TutorEntityTable(this);
  late final $UserEntityTable userEntity = $UserEntityTable(this);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [
        tesisEntity,
        tribunalEntity,
        noConformidadEntity,
        pruebaEntity,
        reportEntity,
        tutorEntity,
        userEntity
      ];
}
